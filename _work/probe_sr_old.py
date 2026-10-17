# -*- coding: utf-8 -*-
r"""Measure the Strongly-rational Figure-1 overflow under the OLD behaviour (no grid):
stub emit._side_by_side -> False, re-convert + compile the paper, and report the widest
multi-item drawing as a share of the text frame.  If it is still ~1.6x the frame, the
overflow is pre-existing (the oversized cetz canvas), not caused by the minipage grid."""
import os
import sys
import subprocess

sys.path.insert(0, r'E:/math/tools')
sys.stdout.reconfigure(errors='replace')

from t2t import emit, convert  # noqa: E402

NAME = 'Strongly-rational-unitary-vertex-operator-algebras-and-conformal-nets-September-25-2026'
FLAT = r'E:/math/_work/flat/' + NAME + '.tex'
OUT = r'E:/math/_work/_old_sr/' + NAME

emit._side_by_side = lambda run: False          # OLD: stack the minipages, no grid
rep = convert.convert_paper(FLAT, OUT, NAME)
print('convert ok=%s refused=%s' % (rep.get('ok'), rep.get('stats', {}).get('cetz_refused')))
print('grid in output?', '#grid(' in open(os.path.join(OUT, 'main.typ'), encoding='utf-8').read())

typ = os.path.join(OUT, 'main.typ')
pdf = os.path.join(OUT, 'main.pdf')
comp = subprocess.run(['typst', 'compile', typ, pdf], capture_output=True, text=True)
print('typst rc=%s' % comp.returncode, (comp.stderr or '').strip()[:200])

import pymupdf  # noqa: E402

doc = pymupdf.open(pdf)
worst = 0.0
worst_page = -1
for i, page in enumerate(doc):
    blocks = page.get_text('blocks')
    xs = [b[0] for b in blocks] + [b[2] for b in blocks]
    if not xs:
        continue
    fw = max(xs) - min(xs)
    if fw <= 0:
        continue
    for d in page.get_drawings():
        if len(d['items']) < 3:
            continue
        s = d['rect'].width / fw
        if s > worst:
            worst = s
            worst_page = i
print('OLD behaviour: widest multi-item drawing = %.3f of frame  p%d' % (worst, worst_page))
doc.close()
