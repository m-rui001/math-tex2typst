# -*- coding: utf-8 -*-
r"""Refined page-level check for the 20 side-by-side-minipage papers.

The §7 prerequisite is: no *canvas* (a real picture, i.e. a multi-item drawing) is wider than
about half the text frame.  The coarse "widest drawing on any page" metric false-positives on
table rules (single-item horizontal lines) and on legitimately full-width figures.  So here we
only look at multi-item drawings and classify each by which half of the frame it occupies:
  - a drawing confined to the left half or the right half  -> a grid-cell subfigure
  - a drawing spanning both halves                          -> full-width figure/table (ignore)
Report, per paper, the widest *half-confined* multi-item drawing as a share of the frame.
"""
import io
import os
import sys

import pymupdf

sys.stdout.reconfigure(errors='replace')
TY = r'E:/math/typst'
NAMES = [l.strip() for l in io.open(r'E:/math/_work/mp_face_names.txt', encoding='utf-8') if l.strip()]
MIN_ITEMS = 3        # a real canvas has several strokes; a table rule has 1
CONFINE_EPS = 0.06   # tolerance so a cell that slightly overshoots mid still counts as "half"


def frame(page):
    blocks = page.get_text('blocks')
    xs = [b[0] for b in blocks] + [b[2] for b in blocks]
    if not xs:
        return None
    return min(xs), max(xs)


for paper in NAMES:
    pdf = os.path.join(TY, paper, 'main.pdf')
    if not os.path.exists(pdf):
        print('NO PDF', paper[:50])
        continue
    doc = pymupdf.open(pdf)
    worst = 0.0
    worst_page = -1
    worst_where = ''
    for i, page in enumerate(doc):
        fr = frame(page)
        if fr is None:
            continue
        x0f, x1f = fr
        fw = x1f - x0f
        if fw <= 0:
            continue
        mid = (x0f + x1f) / 2.0
        eps = CONFINE_EPS * fw
        for d in page.get_drawings():
            if len(d['items']) < MIN_ITEMS:
                continue
            r = d['rect']
            # confine to a single half?
            if r.x1 <= mid + eps:
                where = 'L'
            elif r.x0 >= mid - eps:
                where = 'R'
            else:
                continue  # spans both halves -> full-width figure, not a grid cell
            share = r.width / fw
            if share > worst:
                worst = share
                worst_page = i
                worst_where = where
    doc.close()
    flag = 'OVERFLOW?' if worst > 0.60 else 'ok'
    print('%-56s widest_cell_canvas=%.3f of frame  p%d %s  %s'
          % (paper[:56], worst, worst_page, worst_where, flag))
