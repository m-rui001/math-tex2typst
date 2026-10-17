# -*- coding: utf-8 -*-
r"""Detail p33 of the flagged paper: all drawings with share>=0.25, and the page text,
to identify whether the wide drawing is the side-by-side figure or something else."""
import sys
import pymupdf

sys.stdout.reconfigure(errors='replace')
PDF = ('E:/math/typst/Variable-dimension-Weisfeiler-Leman-equivalence-on-general-and-'
       'subcubic-graphs-September-25-2026/main.pdf')
doc = pymupdf.open(PDF)
page = doc[33]
blocks = page.get_text('blocks')
xs = [b[0] for b in blocks] + [b[2] for b in blocks]
x0f, x1f = min(xs), max(xs)
fw = x1f - x0f
print('frame x=[%.0f..%.0f] w=%.0f  mid=%.0f' % (x0f, x1f, fw, (x0f + x1f) / 2))
print('--- drawings share>=0.25 (x0,x1,width,share,y0,y1) ---')
for d in page.get_drawings():
    r = d['rect']
    s = r.width / fw
    if s >= 0.25:
        print('x=[%6.1f..%6.1f] w=%6.1f share=%.3f  y=[%6.1f..%6.1f]  items=%d'
              % (r.x0, r.x1, r.width, s, r.y0, r.y1, len(d['items'])))
print('--- page text (first 1200 chars) ---')
print(page.get_text()[:1200])
doc.close()
