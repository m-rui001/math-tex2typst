# -*- coding: utf-8 -*-
r"""Targeted look at the flagged paper: per-page widest drawing, its x-extent within the frame,
and whether it sits in the left half / right half / full width of the text frame."""
import sys
import pymupdf

sys.stdout.reconfigure(errors='replace')
PAPER = 'Variable-dimension-Weisfeiler-Leman-equivalence-on-general-and-subcubic-graphs-September-25-2026'
PDF = 'E:/math/typst/' + PAPER + '/main.pdf'

doc = pymupdf.open(PDF)
print('pages =', doc.page_count)
for i, page in enumerate(doc):
    blocks = page.get_text('blocks')
    xs = [b[0] for b in blocks] + [b[2] for b in blocks]
    if not xs:
        continue
    x0f, x1f = min(xs), max(xs)
    fw = x1f - x0f
    if fw <= 0:
        continue
    best = None
    for d in page.get_drawings():
        r = d['rect']
        if best is None or r.width > best.width:
            best = r
    if best is None:
        continue
    share = best.width / fw
    if share < 0.45:
        continue
    # classify horizontally
    mid = (x0f + x1f) / 2
    if best.x0 >= mid - 5:
        where = 'RIGHT-half'
    elif best.x1 <= mid + 5:
        where = 'LEFT-half'
    else:
        where = 'FULL/centered'
    print('p%-3d frame=[%.0f..%.0f] w=%.0f | widest x=[%.0f..%.0f] w=%.0f share=%.3f %s'
          % (i, x0f, x1f, fw, best.x0, best.x1, best.width, share, where))
doc.close()
