# -*- coding: utf-8 -*-
r"""Page-level overflow check for the 20 side-by-side-minipage papers.

The §7 row's prerequisite ("no canvas wider than half a column") cannot be read from the source
(the subfigures use absolute sizes), so measure it on the rendered page: a drawing that belongs
to a grid cell and is wider than ~half the text frame (or crosses the frame) is a candidate
overflow.  Reports, per paper, the widest drawing bbox as a share of the text frame.
"""
import io, os, sys
import pymupdf

sys.stdout.reconfigure(errors='replace')
TY = r'E:/math/typst'
NAMES = [l.strip() for l in io.open(r'E:/math/_work/mp_face_names.txt', encoding='utf-8') if l.strip()]


def frame_width(page):
    # text frame = page width minus the widest left/right margin seen in text blocks
    blocks = page.get_text('blocks')
    xs = [b[0] for b in blocks] + [b[2] for b in blocks]
    if not xs:
        return page.rect.width
    return max(xs) - min(xs)


for paper in NAMES:
    pdf = os.path.join(TY, paper, 'main.pdf')
    if not os.path.exists(pdf):
        print('NO PDF', paper[:50])
        continue
    doc = pymupdf.open(pdf)
    worst = 0.0
    worst_page = -1
    for i, page in enumerate(doc):
        fw = frame_width(page)
        if fw <= 0:
            continue
        for d in page.get_drawings():
            r = d['rect']
            w = r.width
            if w > worst:
                worst = w / fw
                worst_page = i
    doc.close()
    flag = 'OVERFLOW?' if worst > 0.60 else 'ok'
    print('%-58s widest_drawing=%.3f of frame  p%d  %s'
          % (paper[:58], worst, worst_page, flag))
