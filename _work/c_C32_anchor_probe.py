# -*- coding: utf-8 -*-
# 只读探针：C32 的位置串定档 + 全库「内部工具词」面
import io
import os
import re
import glob

MAT = u'被引素材/1707.05561/main.tex'
SEC = re.compile(r'\\(section|subsection|subsubsection)\*?\{')

lines = io.open(MAT, encoding='utf-8', errors='replace').read().split(u'\n')
print(u'main.tex lines=%d bytes=%d' % (len(lines), os.path.getsize(MAT)))
print(u'==== section starts ====')
for i, l in enumerate(lines, 1):
    if SEC.search(l):
        print(u'%5d %s' % (i, l.strip()[:110]))
print(u'==== MSY mentions ====')
for i, l in enumerate(lines, 1):
    if u'MSY' in l:
        print(u'%5d %s' % (i, l.strip()[:140]))
print(u'==== 2983-2989 ====')
for i in range(2982, 2989):
    if i < len(lines):
        print(u'%5d %s' % (i + 1, lines[i].strip()[:140]))
print(u'==== \\appendix / appendix-ish ====')
for i, l in enumerate(lines, 1):
    if l.strip().startswith(u'\\appendix') or u'\\bibliography' in l:
        print(u'%5d %s' % (i, l.strip()[:110]))

print(u'==== 全库内部工具词 ====')
toks = [u'_work/', u'.tools/', u'gate_one', u'ccheck', u'sweep.py', u'katex_census',
        u'citeback', u'c_collect', u'macro_extract', u'index_backfill', u'next_batch']
tot = 0
for p in sorted(glob.glob(u'被引笔记/C*.md')):
    txt = io.open(p, encoding='utf-8').read()
    hits = [(t, txt.count(t)) for t in toks if t in txt]
    if hits:
        print(u'%s %s' % (os.path.basename(p), hits))
        tot += sum(h[1] for h in hits)
print(u'total token occurrences=%d' % tot)
