# -*- coding: utf-8 -*-
"""只读：某宏名在全库素材 preamble 里的所有定义形（含参宏把 #N 原样打出）。

用法：python -X utf8 _work/c_name_witness.py rfdown bc A C wt
"""
import io
import json
import sys

d = json.load(io.open('_work/macro_defs.json', encoding='utf-8'))
names = sys.argv[1:]
for nm in names:
    print(u'==== \\' + nm)
    for cid in sorted(d):
        body = d[cid].get(nm)
        if body is None:
            continue
        print(u'   %-16s %s' % (cid, body.replace(u'\x00', u'~')[:90]))
