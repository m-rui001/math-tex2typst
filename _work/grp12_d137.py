# -*- coding: utf-8 -*-
r"""D137 素材 differentiability/preliminaries.tex 的 m_0 / a_sigma / tfrac 原行。"""
import io
import json
import os

T = json.load(io.open(u'_work/preamble_tables.json', encoding=u'utf-8'))
d = os.path.join(u'preprints', T[u'D137'][u'dir'])
for root, _dirs, files in os.walk(d):
    if u'typst' in root:
        continue
    for f in sorted(files):
        if not f.endswith(u'.tex'):
            continue
        path = os.path.join(root, f)
        rel = os.path.relpath(path, d)
        if u'preliminaries' not in rel and u'differentiability' not in root.replace(os.sep, u'/'):
            continue
        ls = io.open(path, encoding=u'utf-8', errors=u'replace').read().split(u'\n')
        for i, l in enumerate(ls, 1):
            if u'm_0' in l or u'a_' in l and u'sigma' in l:
                print(u'%s:%-4d %s' % (rel, i, l.strip()[:200]))
        if u'preliminaries' in rel:
            print(u'--- %s:108-142' % rel)
            for i in range(107, min(142, len(ls))):
                print(u'%5d| %s' % (i + 1, ls[i][:200]))
