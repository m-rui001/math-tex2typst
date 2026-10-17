"""Where pdflatex put the marked node on each page.

The red disc is the anchor of a named in-path node, so its centre in cm relative to the
two black endpoints says whether TikZ used the segment's end or its midpoint.
"""
import sys

import pymupdf

pdf = pymupdf.open(sys.argv[1])
CM = 72.0 / 2.54


def discs(page):
    out = []
    for d in page.get_drawings():
        for item in d["items"]:
            pts = [p for p in item[1:] if hasattr(p, "x")]
            if not pts:
                continue
            r = pymupdf.Rect(min(p.x for p in pts), min(p.y for p in pts),
                             max(p.x for p in pts), max(p.y for p in pts))
            if r.width < 20:
                out.append((d.get("fill"), (r.x0 + r.x1) / 2.0, (r.y0 + r.y1) / 2.0))
    return out


for i, page in enumerate(pdf):
    got = discs(page)
    print("page %d: %d discs" % (i + 1, len(got)))
    for fill, x, y in got:
        tag = "RED" if (fill and fill[0] > 0.6 and fill[1] < 0.4) else "blk"
        print("   %s  x=%.3f cm  y=%.3f cm" % (tag, x / CM, y / CM))
