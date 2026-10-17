# -*- coding: utf-8 -*-
r"""1) `\mathfrm` 全库面（是否只在 D204/D307 两站）；2) D137/D307 素材那两行的原写法；
3) `\mathfrak m_x`／`\mathfrak m_z` 在 constrained-minimum.tex 的分布。"""
import glob
import io
import json
import os
import re

B = chr(92)
T = json.load(io.open(u'_work/preamble_tables.json', encoding=u'utf-8'))

print(u'### 全库笔记 `mathfrm` 出现')
for p in sorted(glob.glob(os.path.join(u'研究笔记', u'D*.md'))):
    txt = io.open(p, encoding=u'utf-8', errors=u'replace').read()
    for m in re.finditer(r'mathfrm\b', txt):
        line = txt.count(u'\n', 0, m.start()) + 1
        lo = max(0, m.start() - 45)
        print(u'  %s:%-5d %s' % (os.path.basename(p)[:4], line,
                                txt[lo:m.end() + 25].replace(u'\n', u' / ')))

print(u'\n### 素材原行')
for cid, needle, fn in [(u'D137', u'm_0+', None), (u'D137', u'a_' + B + B + r'sigma', None),
                        (u'D307', u'log resolution', None), (u'D307', u'constrained', None)]:
    v = T.get(cid)
    if not v:
        continue
    d = os.path.join(u'preprints', v[u'dir'])
    for root, _dirs, files in os.walk(d):
        if u'typst' in root:
            continue
        for f in sorted(files):
            if not f.endswith(u'.tex'):
                continue
            path = os.path.join(root, f)
            for i, l in enumerate(io.open(path, encoding=u'utf-8', errors=u'replace').read().split(u'\n'), 1):
                if needle in l:
                    print(u'  %s %s:%-4d [%s] %s' % (cid, f, i, needle, l.strip()[:170]))

print(u'\n### constrained-minimum.tex:120-135')
v = T.get(u'D307')
d = os.path.join(u'preprints', v[u'dir'])
for root, _dirs, files in os.walk(d):
    if u'typst' in root:
        continue
    for f in files:
        if f == u'constrained-minimum.tex':
            ls = io.open(os.path.join(root, f), encoding=u'utf-8', errors=u'replace').read().split(u'\n')
            for i in range(118, min(136, len(ls))):
                print(u'  %4d  %s' % (i + 1, ls[i][:170]))
