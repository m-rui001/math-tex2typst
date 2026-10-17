# -*- coding: utf-8 -*-
# Parallel-batch dispatcher: claim inflight + emit 加深批 prompts for my reverse block.
import io, os, glob, sys
sys.path.insert(0, '.tools')
import gate

CLAIM = ['D687', 'D693', 'D699']

# params from .tools/wave.txt (row / material bytes / dir)
WAVE = {}
for line in io.open('.tools/wave.txt', encoding='utf-8'):
    parts = line.rstrip('\n').split('\t')
    if not parts or not parts[0].startswith('D'):
        continue
    d = {'dir': ''}
    for f in parts[1:]:
        if f.startswith('dir='):
            d['dir'] = f[4:]
        elif '=' in f:
            k, v = f.split('=', 1)
            d[k] = v
    WAVE[parts[0]] = d

def material_bytes(dirname):
    # dirname is like 'preprints/<full-dir>'
    root = os.path.join(dirname, 'build')
    tot = 0
    n = 0
    for p in glob.glob(os.path.join(root, '**', '*.tex'), recursive=True):
        tot += os.path.getsize(p)
        n += 1
    return n, tot

TARGET = 120000
rows = []
for k in CLAIM:
    hits = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/%s-*.md' % k)
    p = hits[0]
    r = gate.chk(p, quiet=True)
    t = io.open(p, encoding='utf-8').read()
    secs = [l[3:].split()[0] for l in t.split('\n') if l.startswith('## ')]
    maxsec = secs[-1] if secs else u'\u00a70'
    n, mb = material_bytes(WAVE[k]['dir'])
    name = os.path.basename(p)
    prompt = u"""你是研究笔记写手，执行一笔「加深批（续写追加批）」。规格在 E:\\math\\.tools\\spec_other.md，先读它，尤其「续写追加批」与落盘窗口那几段；所有永久禁令（素材只读给定 build 目录下的 .tex、严禁 pdftotext 与任何 PDF、不执行任何 git 命令、禁读清单、Write 次数必须为 0、单笔 ≤ 25,000 B、台账表头与分隔行全文各只一次、禁用字形只在文末按类别申报、已落盘字节不回改）一律以规格为准，下面只给参数。

- 目标文件：E:\\math\\研究笔记\\%(name)s（现 %(size)d B，标题写成 `## §N 题名` 形，最大节号 %(maxsec)s，台账数据行 %(rows)d，数学定界符 %(math)d）
- 素材目录（只读这里）：E:\\math\\%(dir)s\\build，tex %(n)d 个文件 / %(mb)d B
- 本单是「加深批」。稿子已合规但偏薄：素材 %(mb)d B 对正文 %(size)d B，很多证明骨架与估计来源被旧稿跳过。用 Edit 在文末追加新节，从 %(nextsec)s 起连续排号，每节 4,000--4,500 B，必须是真实技术账：新定理的证明骨架、旧稿一笔带过的估计从哪来、试过但卡住的路线及卡点、与相邻结果的接口。不许复述旧节、不许编造事实，信息不足就标 `[推测]` 并说明。
- 目标正文 ≥ %(target)d B（现 %(size)d，需再追加约 %(need)d B）；数学定界符增量 ≥ 800。台账已有 %(rows)d 行（≥28），表头与分隔行不要再发第二份；如需追加数据行，只能写在既有数据行之后且每行恰好 6 枚竖线、位置栏是本会话真实 Read 到的 `文件:行`。
- 落盘优先于体量：Write 次数必须为 0，每次 Edit 追加一节（≤ 25,000 B）并立刻 `wc -c` 复量，不要攒到最后一次性追加。取证 ≤ 10 次调用（厚素材按窗口分段读，单次窗口 ≤ 12,000 B）。
- 收工：`sleep 90` → 两次 `wc -c` → `ls -l --time-style=full-iso` → CR 字节数 → 三项 awk 逐行自查（标题序列连续、台账每行恰好 6 枚竖线、定界符逐行奇偶）；交付报告只写实测数字与缺陷分类，申报段不许逐字抄写违例字形。
""" % dict(name=name, size=r['size'], maxsec=maxsec, rows=r['rows'], math=r['math'],
           dir=WAVE[k]['dir'], n=n, mb=mb,
           nextsec=u'\u00a7' + str(int(maxsec.lstrip(u'\u00a7')) + 1),
           target=TARGET, need=TARGET - r['size'])
    outp = u'_work/prompt_%s_p2.txt' % k
    io.open(outp, 'w', encoding='utf-8', newline='\n').write(prompt)
    rows.append((k, outp, r['size'], mb))

# claim in inflight (append tokens, keep single-line space-separated)
inf = '.tools/inflight.txt'
cur = io.open(inf, encoding='utf-8').read().split()
for k in CLAIM:
    if k not in cur:
        cur.append(k)
io.open(inf, 'w', encoding='utf-8', newline='\n').write(u' '.join(cur) + u'\n')
print('inflight now:', io.open(inf, encoding='utf-8').read().strip())
for k, outp, sz, mb in rows:
    print('prompt', k, outp, 'note=%d material=%d' % (sz, mb))
