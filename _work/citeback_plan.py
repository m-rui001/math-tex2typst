# -*- coding: utf-8 -*-
# 回引计划：把已完成 C 稿的「arXiv id -> C 稿路径」按引用稿排成一节 Edit 载荷
# 用法：python _work/citeback_plan.py            # 只读，打印每篇引用稿要追加的一节
#       python _work/citeback_plan.py --apply    # 落盘：无节则追加，有节则整节复写（条目只增不减）
import io, os, re, sys, glob, json, collections
sys.stdout.reconfigure(encoding='utf-8')

APPLY = '--apply' in sys.argv
plan = json.load(io.open('_work/cited_plan.json', encoding='utf-8'))

# 已完成的 C 稿：被引笔记/C##-*.md，且必须过规格下限 22,000 字节。
# 只按文件存在判定会把在飞未写完的那份（C05 起笔 7,554 字节）当成可引的成品。
done = {}
short = []
for p in glob.glob('被引笔记/C*-*.md'):
    m = re.match(r'(C\d+)-(.*)\.md', os.path.basename(p))
    sz = os.path.getsize(p)
    if sz < 22000:
        short.append((m.group(1), sz))
        continue
    done[m.group(1)] = (p, sz)
print('completed C notes = %d of %d ; 未达下限不引=%s' % (len(done), len(plan), short))

# arXiv id -> (cid, path)；引用稿 -> [(cid, arxiv, path)]
by_note = collections.defaultdict(list)
for p in plan:
    if p['cid'] not in done:
        continue
    for n in p['notes']:
        by_note[n].append((p['cid'], p['arxiv'], done[p['cid']][0], p['title']))

HDR = re.compile(r'^##\s+(.*\S)')


def argval(flag, default):
    for a in sys.argv:
        if a.startswith(flag + '='):
            return a.split('=', 1)[1]
    return default


ROOT = argval('--root', u'研究笔记')
ONLY = [a.split('=', 1)[1] for a in sys.argv if a.startswith('--only=')]
INFLIGHT = set(x for x in io.open('.tools/inflight.txt', encoding='utf-8').read().split() if x)
EM = chr(8212) * 2

for n in sorted(by_note):
    if ONLY and n not in ONLY:
        continue
    hits = glob.glob(u'%s/%s-*.md' % (ROOT, n))
    if not hits:
        print(n, 'NOFILE'); continue
    path = hits[0]
    raw = io.open(path, 'rb').read()
    assert b'\r' not in raw, '%s 盘上带 CR，先查上一笔' % n
    text = raw.decode('utf-8')
    lines = text.split(u'\n')
    heads = [(i + 1, l) for i, l in enumerate(lines) if l.startswith(u'## ')]
    nums = []
    for _, h in heads:
        if u'被引文献笔记对照' in h:
            continue          # 本节自己不算进正文节号序列，复写时沿用它的旧号
        m = re.match(r'##\s+(?:§)?(\d+)', h)
        if m:
            nums.append(int(m.group(1)))
    form = u'§' if any(h.startswith(u'## §') for _, h in heads) else u''
    nxt = (max(nums) + 1) if nums else 0
    contig = nums == list(range(nums[0], nums[0] + len(nums))) if nums else True
    # 已有的那一节（若有）就地整节复写：条目是超集，覆盖面只增不减，节号与首行逐字不动
    old_i = None
    for i, l in enumerate(lines):
        if l.startswith(u'## ') and u'被引文献笔记对照' in l:
            old_i = i
    if old_i is not None:
        nxt_line = lines[old_i]
        m = re.match(r'##\s+(?:§)?(\d+)', nxt_line)
        assert m and int(m.group(1)) == nxt, '%s 已有对照节的节号 %r 与末节号 %d 不接，先查节号' % (n, nxt_line, nxt)
        nxt = int(m.group(1))
        form = u'§' if nxt_line.startswith(u'## §') else u''
        nxt_head = [i for i in range(old_i + 1, len(lines)) if lines[i].startswith(u'## ')]
        stop = nxt_head[0] if nxt_head else len(lines)
    body = [u'## %s%d 被引文献笔记对照' % (form, nxt),
            u'本稿 `build/references.bib` 里下列被引论文各已有一份精读笔记落在 `被引笔记/`，路径为盘上实测存在的文件：']
    for cid, arx, cpath, title in sorted(by_note[n]):
        body.append(u'- arXiv:%s，笔记 `%s`（%s）' % (arx, cpath.replace('\\', '/'), title))
    add = u'\n'.join(body) + u'\n'
    for l in body:
        assert l.count(u'$') % 2 == 0 and l.count(u'`') % 2 == 0, '奇偶不合格：%s' % l[:60]
        assert EM not in l, '生成行自带长破折号：%s' % l[:60]
    if old_i is None:
        nb = text.rstrip(u'\n') + u'\n\n' + add
        oldb = u''
    else:
        tail = (u'\n' + u'\n'.join(lines[stop:])) if stop < len(lines) else u''
        nb = u'\n'.join(lines[:old_i]) + u'\n' + add + tail
        oldb = u'\n'.join(lines[old_i:stop])
    delta = len(nb.encode('utf-8')) - len(raw)
    print('--- %s  heads=%d last=%s nums_contig=%s  Δ%+dB  %d 行  %s' % (
        n, len(heads), heads[-1][0] if heads else '-', contig, delta, add.count(u'\n'),
        u'复写旧节 %dB' % len(oldb.encode('utf-8')) if old_i is not None else u'新节'))
    if not APPLY:
        print(add[:240].replace(u'\n', u' ⏎ '))
        continue
    if n in INFLIGHT:
        raise SystemExit('%s 在飞，不落盘' % n)
    assert contig, '%s 节号本就不连续，先修节号再挂回引' % n
    data = nb.encode('utf-8')
    assert len(data) == len(raw) + delta, '%s 字节增量对不上账' % n
    h2 = [l for l in nb.split(u'\n') if l.startswith(u'## ')]
    assert len(h2) == len(heads) + (0 if old_i is not None else 1), '%s 节数不符' % n
    assert h2.count(u'## %s%d 被引文献笔记对照' % (form, nxt)) == 1, '%s 对照节不唯一' % n
    assert data.count(b'$') % 2 == raw.count(b'$') % 2 and data.count(b'`') % 2 == raw.count(b'`') % 2, \
        '%s 本笔改了定界符奇偶（基线可以本来就是奇数，但这一笔不许动）' % n
    assert data.count(b'\n') >= raw.count(b'\n'), '%s 行数被削减' % n
    assert b'\r' not in data
    io.open(path, 'wb').write(data)
    print('%s APPLIED size=%d Δ%+dB 条目=%d 节 ## %s%d' % (n, len(data), delta, len(body) - 2, form, nxt))
