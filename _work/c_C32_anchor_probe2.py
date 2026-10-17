# -*- coding: utf-8 -*-
import io
import glob

MAT = u'被引素材/1707.05561/main.tex'
ls = io.open(MAT, encoding='utf-8').read().split(u'\n')

# 逐节统计 defn / thm 编号，看 885 与 2012 各自是第几个
import re
sec = 0
ctr = {}
NUM = re.compile(r'\\begin\{(defn|thm|lem|cor|rmk|prop)\}\[?([^\]]*)\]?(\\label\{([^}]*)\})?')
for i, l in enumerate(ls, 1):
    m = re.search(r'\\section\*?\{([^}]*)\}', l)
    if m:
        sec += 1
        print(u'-- SEC %d @%d %s' % (sec, i, m.group(1)))
        ctr = {}
    m2 = NUM.match(l.strip())
    if m2:
        k = m2.group(1)
        ctr[k] = ctr.get(k, 0) + 1
        tag = u'%d.%d' % (sec, ctr[k])
        if i in (885, 2012, 251, 253, 255, 257, 259, 261, 344, 345, 346):
            print(u'   #%s %s @%d label=%s | %s' % (tag, k, i, m2.group(4) or u'-', l.strip()[:120]))

print(u'==== 245-265 原文 ====')
for i in range(245, 266):
    print(u'%5d %s' % (i, ls[i - 1][:180]))
print(u'==== 340-356 原文（outline） ====')
for i in range(340, 357):
    print(u'%5d %s' % (i, ls[i - 1][:180]))

print(u'==== C 稿内部工具词逐处上下文 ====')
toks = [u'_work/', u'.tools/', u'gate_one', u'ccheck', u'sweep.py', u'katex_census',
        u'citeback', u'c_collect', u'macro_extract', u'index_backfill', u'next_batch']
for p in sorted(glob.glob(u'被引笔记/C*.md')):
    for n, l in enumerate(io.open(p, encoding='utf-8').read().split(u'\n'), 1):
        hits = [t for t in toks if t in l]
        if hits:
            print(u'%s:%d %s | %s' % (p.split(u'/')[-1][:14], n, hits, l.strip()[:170]))
