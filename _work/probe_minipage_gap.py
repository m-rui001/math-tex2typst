# -*- coding: utf-8 -*-
r"""For the 20 face papers, show the text between a minipage's `\end` and the next `\begin`.

A side-by-side pair is joined by glue (`\hfill`, `\centering`, spaces); a paragraph break
(blank line -> \par) means TeX stacks them and gridding would be wrong.  This prints each gap
so the two cases can be told apart.
"""
import os, re, sys

FLAT = r'E:/math/_work/flat'
sys.stdout.reconfigure(errors='replace')

PAPERS = [line.strip().split(' grid')[0].strip()
          for line in sys.stdin.read().splitlines() if 'grid 0 ->' in line]

END = re.compile(r'\\end\{minipage\}')
BEG = re.compile(r'\\begin\{minipage\}')

for paper in PAPERS:
    path = os.path.join(FLAT, paper + '.tex')
    if not os.path.exists(path):
        cands = [n for n in os.listdir(FLAT) if n.startswith(paper)]
        if len(cands) == 1:
            path = os.path.join(FLAT, cands[0])
        else:
            print('MISSING', paper, len(cands))
            continue
    src = open(path, encoding='utf-8', errors='replace').read()
    gaps = []
    for m in END.finditer(src):
        nxt = BEG.search(src, m.end())
        if not nxt:
            continue
        gap = src[m.end():nxt.start()]
        if len(gap) <= 60:
            gaps.append(gap)
    for g in gaps:
        blank = '\n\n' in g or '\r\n\r\n' in g
        flag = 'BLANKLINE' if blank else 'glue'
        print('%-52s %-10s %r' % (paper[:52], flag, g))
