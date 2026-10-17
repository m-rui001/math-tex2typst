# -*- coding: utf-8 -*-
r"""双打 `^^`／`__`、`_#`、以及「下标紧跟控制字」的全库形与上下文。"""
import glob
import io
import os
import re

B = chr(92)
BB = B + B

PATS = [
    (u'caret-double', re.compile(r'\^\^\+*')),
    (u'under-double', re.compile(r'_{2,}')),
    (u'hash-bare', re.compile(r'[_\^]' + B + r'#')),
    (u'hash-escaped', re.compile(r'[_\^]' + BB + r'#')),
    (u'sub-cs-bare', re.compile(r'[_\^]' + BB + r'(?!mathrm|mathbf|mathbb|mathcal|text|operatorname)[a-zA-Z]{2,}')),
    (u'sub-cs-braced', re.compile(r'[_\^]\{' + BB + r'[a-zA-Z]{2,}\}')),
]

hits = {}
for p in sorted(glob.glob(os.path.join(u'研究笔记', u'D*.md'))):
    cid = os.path.basename(p)[:4]
    txt = io.open(p, encoding=u'utf-8', errors=u'replace').read()
    for label, rx in PATS:
        for m in rx.finditer(txt):
            line = txt.count(u'\n', 0, m.start()) + 1
            lo = max(0, m.start() - 40)
            ctx = txt[lo:m.end() + 40].replace(u'\n', u' / ')
            hits.setdefault(label, []).append((cid, line, ctx))

for label, _rx in PATS:
    v = hits.get(label, [])
    files = set(x[0] for x in v)
    print(u'\n### %s  %d 处 / %d 篇' % (label, len(v), len(files)))
    if label in (u'sub-cs-bare', u'sub-cs-braced'):
        continue
    for cid, line, ctx in v:
        print(u'  %s:%-5d %s' % (cid, line, ctx))
