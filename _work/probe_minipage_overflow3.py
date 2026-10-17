# -*- coding: utf-8 -*-
r"""Refined page-level check, v2, for the 20 side-by-side-minipage papers.

Multi-item drawings only (a real canvas; table rules have 1 item).  Classify each by how it
relates to the text-frame edges:
  - reaches both edges  -> genuine full-width figure/table        (ignore)
  - reaches neither     -> confined to a half (grid cell)          (measure)
  - reaches exactly one -> suspicious: an overflowing cell canvas  (measure; this is the case
                           the half-confined filter alone would have missed)
Report, per paper, the widest drawing in the "measure" set as a share of the frame.
"""
import io
import os
import sys

import pymupdf

sys.stdout.reconfigure(errors='replace')
TY = r'E:/math/typst'
NAMES = [l.strip() for l in io.open(r'E:/math/_work/mp_face_names.txt', encoding='utf-8') if l.strip()]
MIN_ITEMS = 3
EDGE_EPS = 0.05


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
    worst_kind = ''
    for i, page in enumerate(doc):
        fr = frame(page)
        if fr is None:
            continue
        x0f, x1f = fr
        fw = x1f - x0f
        if fw <= 0:
            continue
        eps = EDGE_EPS * fw
        for d in page.get_drawings():
            if len(d['items']) < MIN_ITEMS:
                continue
            r = d['rect']
            reach_l = r.x0 <= x0f + eps
            reach_r = r.x1 >= x1f - eps
            if reach_l and reach_r:
                continue  # genuine full-width
            kind = 'cell' if (not reach_l and not reach_r) else 'SPAN'
            share = r.width / fw
            if share > worst:
                worst = share
                worst_page = i
                worst_kind = kind
    doc.close()
    flag = 'OVERFLOW?' if worst > 0.60 else 'ok'
    print('%-54s widest=%.3f of frame  p%d %-5s %s'
          % (paper[:54], worst, worst_page, worst_kind, flag))
