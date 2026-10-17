# -*- coding: utf-8 -*-
import io

SPECS = [(u'C11', 11), (u'C30', 13), (u'C30', 228), (u'C31', 13), (u'C32', 13),
         (u'C33', 19), (u'C41', 18), (u'C42', 13), (u'C42', 797)]
import glob
import os
paths = {}
for p in glob.glob(u'被引笔记/C*.md'):
    b = os.path.basename(p)
    paths[b[:3]] = p
for cid, n in SPECS:
    p = paths[cid]
    ls = io.open(p, encoding='utf-8').read().split(u'\n')
    print(u'---- %s:%d (%d chars)' % (p, n, len(ls[n - 1])))
    print(ls[n - 1])
    print()
