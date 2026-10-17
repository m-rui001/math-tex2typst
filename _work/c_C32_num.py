# -*- coding: utf-8 -*-
import io
import re

MAT = u'被引素材/1707.05561/main.tex'
ls = io.open(MAT, encoding='utf-8').read().split(u'\n')

print(u'==== newtheorem 声明 ====')
for i, l in enumerate(ls, 1):
    if u'\\newtheorem' in l and not l.strip().startswith(u'%'):
        print(u'%5d %s' % (i, l.strip()[:160]))
    if i > 220:
        break

ENV = re.compile(r'\\begin\{(thm|thm*|defn|lem|cor|prop|rmk|ques|ex|conj)\}')
print(u'==== 定理类环境全序（节内计数）====')
sec = 0
ctr = {}
rows = []
for i, l in enumerate(ls, 1):
    if l.strip().startswith(u'%'):
        continue
    if re.search(r'\\section\*?\{', l):
        sec += 1
        ctr = {}
    m = ENV.search(l)
    if m:
        k = m.group(1)
        ctr[k] = ctr.get(k, 0) + 1
        lab = u''
        ml = re.search(r'\\label\{([^}]*)\}', l)
        if ml:
            lab = ml.group(1)
        rows.append((sec, k, ctr[k], i, lab))
for r in rows:
    if r[4] in (u'd-ksemi', u'd-ksemiSE', u't-unique') or (r[0] in (2, 4) and r[1] == u'defn'):
        print(u'sec%d %s %d.%d @%d %s' % (r[0], r[1], r[0], r[2], r[3], r[4]))
