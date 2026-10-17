# -*- coding: utf-8 -*-
r"""Compare the widest multi-item drawing (absolute pt) + its page between the NEW (grid) render
and the OLD (stacked) render of the Strongly-rational paper."""
import sys
import pymupdf

sys.stdout.reconfigure(errors='replace')
NAME = 'Strongly-rational-unitary-vertex-operator-algebras-and-conformal-nets-September-25-2026'
NEW = 'E:/math/typst/' + NAME + '/main.pdf'
OLD = 'E:/math/_work/_old_sr/' + NAME + '/main.pdf'


def widest(pdf):
    doc = pymupdf.open(pdf)
    best = (0.0, -1, 0.0, 0.0)  # width_pt, page, frame_w, share
    for i, page in enumerate(doc):
        blocks = page.get_text('blocks')
        xs = [b[0] for b in blocks] + [b[2] for b in blocks]
        if not xs:
            continue
        fw = max(xs) - min(xs)
        for d in page.get_drawings():
            if len(d['items']) < 3:
                continue
            w = d['rect'].width
            if w > best[0]:
                best = (w, i, fw, w / fw if fw else 0)
    doc.close()
    return best


for tag, pdf in (('NEW(grid)', NEW), ('OLD(stack)', OLD)):
    w, p, fw, s = widest(pdf)
    print('%-11s widest_canvas=%.1fpt  frame=%.1fpt  share=%.3f  p%d' % (tag, w, fw, s, p))
