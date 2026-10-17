# -*- coding: utf-8 -*-
import io
import re

MAT = u'被引素材/1707.05561/main.tex'
ls = io.open(MAT, encoding='utf-8').read().split(u'\n')

# 所有 \newtheorem{X}[thm]{Name} 与 thm 本身共用一个按节计数的计数器
shared = set([u'thm'])
for l in ls[:230]:
    m = re.match(r'\\newtheorem\{(\w+)\}\[thm\]\{([^}]*)\}', l.strip())
    if m:
        shared.add(m.group(1))
print(u'shared envs: %s' % sorted(shared))

ENV = re.compile(r'\\begin\{(' + u'|'.join(sorted(shared, key=len, reverse=True)) + u')\}')
NAME = {u'defn': u'Definition'}
sec = 0
ctr = 0
for i, l in enumerate(ls, 1):
    if l.strip().startswith(u'%'):
        continue
    if re.search(r'\\section\*?\{', l):
        sec += 1
        ctr = 0
    m = ENV.search(l)
    if m:
        ctr += 1
        ml = re.search(r'\\label\{([^}]*)\}', l)
        lab = ml.group(1) if ml else u'-'
        if m.group(1) == u'defn' or lab in (u'd-ksemi', u'd-ksemiSE', u't-unique'):
            print(u'@%5d  sec%d %s %d.%d  label=%s' % (i, sec, m.group(1), sec, ctr, lab))
