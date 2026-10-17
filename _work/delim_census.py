# -*- coding: utf-8 -*-
r"""全库欠账表（只读）：`python _work/delim_census.py`
逐行用 `texmask.line_delims` 数「行内代码之外的单 $」，奇数＝这一行有一枚没在本行闭合，
它就把后面的正文一路拖进式内（KaTeX 那一侧表现为 `Expected 'EOF', got '#'` 之类跨行拒渲）。
反引号同量：行末还开着反引号＝这一行的行内代码没关。
只数不改，用来给定点修补定裁决口径（这一族的批量通改要用户明示）。
"""
import glob
import io
import os
import sys

sys.path.insert(0, u'_work')
from texmask import line_delims  # noqa: E402

odd_d = []
odd_t = []
for p in sorted(glob.glob(os.path.join(u'研究笔记', u'D*.md'))):
    cid = os.path.basename(p)[:4]
    lines = io.open(p, encoding='utf-8', errors='replace').read().split(u'\n')
    infence = False
    for i, l in enumerate(lines, 1):
        if l.strip().startswith(u'`' * 3):
            infence = not infence
            continue
        if infence:
            continue
        s, d, tick = line_delims(l)
        if s % 2:
            odd_d.append((cid, i, s, l))
        if tick:
            odd_t.append((cid, i, l))
print(u'单 $ 奇数行=%d 篇=%d' % (len(odd_d), len(set(x[0] for x in odd_d))))
print(u'行内代码未关行=%d 篇=%d' % (len(odd_t), len(set(x[0] for x in odd_t))))
print(u'同线双缺陷=%d' % len(set((c, i) for c, i, _s, _l in odd_d) &
                            set((c, i) for c, i, _l in odd_t)))
lim = int(sys.argv[1]) if len(sys.argv) > 1 else 12
for cid, i, s, l in odd_d[:lim]:
    print(u'  %s:%-5d 单$=%d  %s' % (cid, i, s, repr(l[:120])[1:-1]))
