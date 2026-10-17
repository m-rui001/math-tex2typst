# -*- coding: utf-8 -*-
r"""Final page-level prerequisite check for the 20 side-by-side-minipage papers.

Uses the NOMINAL text frame parsed from each paper's `#set page(... margin: (x: Npt))` rather than
a text-block heuristic (an overflowing canvas prints its own labels, which widens the measured
"frame" and hides the overflow).  For each paper reports:
  max_draw  = widest multi-item drawing  / nominal frame   (any drawing)
  max_cell  = widest drawing confined to one half / nominal frame  (a grid-cell candidate)
A paper is a real risk if a grid-cell canvas exceeds ~0.5 of the frame, or any drawing exceeds 1.0.
"""
import io
import os
import re
import sys

import pymupdf

sys.stdout.reconfigure(errors='replace')
TY = r'E:/math/typst'
NAMES = [l.strip() for l in io.open(r'E:/math/_work/mp_face_names.txt', encoding='utf-8') if l.strip()]
MARGIN_RX = re.compile(r'#set page\([^)]*margin:\s*\(x:\s*([0-9.]+)pt')
PAGE_W = 612.0  # us-letter


def nominal_frame(main_typ):
    m = MARGIN_RX.search(open(main_typ, encoding='utf-8').read())
    if not m:
        return None
    return PAGE_W - 2 * float(m.group(1))


for paper in NAMES:
    d = os.path.join(TY, paper)
    fw = nominal_frame(os.path.join(d, 'main.typ'))
    if fw is None:
        print('NO MARGIN', paper[:50])
        continue
    doc = pymupdf.open(os.path.join(d, 'main.pdf'))
    max_draw = 0.0
    max_cell = 0.0
    for page in doc:
        # nominal frame centre in page coordinates: page is 612 wide, margin = (612-fw)/2
        margin = (PAGE_W - fw) / 2.0
        x0f, x1f = margin, PAGE_W - margin
        mid = PAGE_W / 2.0
        eps = 0.06 * fw
        for dr in page.get_drawings():
            if len(dr['items']) < 3:
                continue
            r = dr['rect']
            share = r.width / fw
            max_draw = max(max_draw, share)
            if r.x1 <= mid + eps or r.x0 >= mid - eps:
                max_cell = max(max_cell, share)
    doc.close()
    flag = ''
    if max_draw > 1.0:
        flag = ' <== drawing wider than frame'
    elif max_cell > 0.60:
        flag = ' <== cell canvas over half-frame'
    print('%-52s frame=%.0f  max_draw=%.3f  max_cell=%.3f%s'
          % (paper[:52], fw, max_draw, max_cell, flag))
