r"""Raster just the figure a needle sits in, from the generated PDF, next to the pdflatex control.

`render_pair` dumps whole pages, and a page of dense prose at 170 dpi is too small to judge a 5pt
padding by. This clips: the needle's own rect, widened to swallow every drawing path that overlaps
it (the frame and its arrows), then rendered at a dpi where the gap between text and frame is
several pixels.
"""
import pathlib
import sys

import pymupdf

ROOT = pathlib.Path(__file__).resolve().parents[1]
STEM = sys.argv[1]
NEEDLES = sys.argv[2].split("|")
TAG = sys.argv[3]

doc = pymupdf.open(str(ROOT / "typst" / STEM / "main.pdf"))
for n in range(len(doc)):
    page = doc[n]
    hits = [r for needle in NEEDLES for r in page.search_for(needle)]
    if not hits:
        continue
    wide = hits[0]
    for rect in hits[1:]:
        wide |= rect
    wide = pymupdf.Rect(wide.x0 - 90, wide.y0 - 90, wide.x1 + 90, wide.y1 + 90)
    for path in page.get_drawings():
        if path["rect"].intersects(wide):
            hits.append(path["rect"])
    box = hits[0]
    for rect in hits:
        box |= rect
    box = pymupdf.Rect(box.x0 - 8, box.y0 - 8, box.x1 + 8, box.y1 + 8) & page.rect
    out = ROOT / "_work" / ("clip_%s_p%d.png" % (TAG, n + 1))
    page.get_pixmap(dpi=300, clip=box).save(str(out))
    print("page %d box=%s -> %s" % (n + 1, box, out.name))
doc.close()
