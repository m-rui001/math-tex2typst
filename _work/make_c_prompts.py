# -*- coding: utf-8 -*-
# 由 _work/cited_plan.json 生成 C 稿派单提示词（参数逐字实测，永久条款只在 被引笔记/规格.md）
import io, os, re, sys, json, glob, collections
sys.stdout.reconfigure(encoding='utf-8')
plan = json.load(io.open('_work/cited_plan.json', encoding='utf-8'))
by = {p['cid']: p for p in plan}

PAT = re.compile(r'preprints[/\\]+([A-Za-z0-9][A-Za-z0-9._\-]*[A-Za-z0-9])')
note2dir = {}
for p in glob.glob('研究笔记/D*.md'):
    m = re.match(r'(D\d+)', os.path.basename(p))
    if not m:
        continue
    c = collections.Counter(PAT.findall(io.open(p, encoding='utf-8', errors='replace').read(20000)))
    if c:
        note2dir[m.group(1)] = c.most_common(1)[0][0]

DONE = {'C01', 'C02', 'C03', 'C04', 'C05', 'C06', 'C07', 'C08', 'C09', 'C10', 'C11', 'C12',
        'C15', 'C16', 'C17'}   # 已派出的号：含在飞的四份一单那代、已收稿的 C12，与 22:33 派出的 C15-C17
rest = [p['cid'] for p in plan if p['cid'] not in DONE and p['texs']]
print('skipped (no tex source on disk):', [p['cid'] + ':' + p['arxiv'] for p in plan if p['cid'] not in DONE and not p['texs']])
# 本体的轮数是瓶颈（每次子 agent 回报要吃一轮），把稿数堆到一单里换回报次数；
# 上限由工具调用数定死：实测一份 C 稿约 50 次（C01+C02 那一单 99 次），子 agent 上限 150，故一单三份。
GROUPS = [tuple(rest[i:i + 3]) for i in range(0, len(rest), 3)]

HEAD = (u'你是写手。先完整读 `E:\\math\\被引笔记\\规格.md` 并遵守其中全部条款（取材、记法、结构、体量、落盘、自查都在那里，本派单不复述）。'
        u'除该文件、本派单文件自身与你本单的素材目录外不得读任何其他文件：**不得读 `研究笔记/`、`preprints/`、`.tools/`、`_work/`（本派单文件自身除外）、`被引笔记/INDEX.md`**。'
        u'素材只用下面给定的 arXiv 源码 `.tex`；不得读素材目录里的 `.pdf`；不要执行任何 git 命令；不要生成 PDF。\n\n'
        u'本单要写 %d 份 C 稿（按下面给定的顺序，一份写完立刻开下一份）。每份各自满足规格的结构与体量要求。\n\n')


def block(p):
    texs = '\n'.join(u'  - `%s`（%d 字节 / %d 行）' % (t['path'], t['bytes'], t['lines']) for t in p['texs'])
    cites = []
    for n in p['notes']:
        d = note2dir.get(n)
        keys = p['bib_keys'].get(d, []) if d else []
        cites.append(u'%s（bib key %s）' % (n, '、'.join('`%s`' % k for k in keys) if keys else '未标'))
    return (u"""## 一份：%s

- arXiv id：%s
- 原题名（逐字）：%s
- 作者（逐字，API 署名）：%s
- 发表年月：%s
- 素材目录：`E:\\math\\%s`
- 主 tex 清单（实测，路径以盘面为准）：
%s
- 本语料中引用它的稿号与 bib key（你只在 §0 原样登记，不去读这些稿）：%s
- 成品路径：`E:\\math\\被引笔记\\%s-<中文题名>.md`（中文题名由你按原题拟，不超过 24 字，不得含 `:` 与 `/`）
- 目标体量：不少于 22,000 字节
""" % (p['cid'], p['arxiv'], p['title'], ', '.join(p['authors']) or '（API 未给，从 tex 的 \\author 读取）',
       p['published'], p['dir'], texs, u'；'.join(cites), p['cid']))


TAIL_TMPL = (u"""
## 落地节奏（本单各份合起来算）

- 新建每份稿允许一次 `Write` 落「`# 标题` + `## 0 取证边界`」骨架，此后一律 `Edit` 追加，单笔新增正文不超过 10,000 字节；
- 第一份的首次落盘落在第 4--10 次工具调用之间；每写完一份立刻开始下一份，不要停下来等确认；
- 每份落盘后 sleep 90 秒再复量一次字节以证未回滚；
- 收工报告按规格第 5 条对**每一份稿分别**给数，并给出各份成品文件的绝对路径与实测字节。
""")

for grp in GROUPS:
    parts = [HEAD % len(grp)]
    for cid in grp:
        parts.append(block(by[cid]))
    txt = u'\n'.join(parts) + TAIL_TMPL
    name = '_work/prompt_%s.txt' % ('_'.join(grp))
    io.open(name, 'w', encoding='utf-8').write(txt)
    print('%-42s %5d B  %s' % (name, os.path.getsize(name), ','.join(grp)))
