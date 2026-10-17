# -*- coding: utf-8 -*-
r"""定点窗口打印：python _work/win.py D137 667 [5]"""
import glob
import io
import os
import sys

cid = sys.argv[1]
line = int(sys.argv[2])
pad = int(sys.argv[3]) if len(sys.argv) > 3 else 3
p = glob.glob(os.path.join(u'研究笔记', cid + u'-*.md'))[0]
ls = io.open(p, encoding=u'utf-8').read().split(u'\n')
for j in range(max(0, line - 1 - pad), min(len(ls), line + pad)):
    print(u'%5d| %s' % (j + 1, ls[j]))
