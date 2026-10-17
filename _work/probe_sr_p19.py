# -*- coding: utf-8 -*-
r"""Detail p19 of Strongly-rational-unitary-vertex-operator-algebras: the 1.365x-frame drawing."""
import sys
import pymupdf

sys.stdout.reconfigure(errors='replace')
PDF = ('E:/math/typst/Strongly-rational-unitary-vertex-operator-algebras-and-conformal-nets-'
       'September-25-2026/main.pdf')
doc = pymupdf.open(PDF)
page = doc[19]
blocks = page.get_text('blocks')
xs = [b[0] for b in blocks] + [b[2] for b in blocks]
x0f, x1f = min(xs), max(xs)
fw = x1f - x0f
print('pages=%d  frame x=[%.0f..%.0f] w=%.0f mid=%.0f' % (doc.page_count, x0f, x1f, fw, (x0f + x1f) / 2))
print('--- drawings items>=3, share>=0.25 ---')
for d in page.get_drawings():
    if len(d['items']) < 3:
        continue
    r = d['rect']
    s = r.width / fw
    if s >= 0.25:
        print('x=[%6.1f..%6.1f] w=%6.1f share=%.3f  y=[%6.1f..%6.1f] items=%d'
              % (r.x0, r.x1, r.width, s, r.y0, r.y1, len(d['items'])))
print('--- page text ---')
print(page.get_text()[:1500])
doc.close()
