r"""Render the worst escaping pair of a page at 300 dpi, so the eye settles what the count says.

`_work/probe_frame_ink_overflow.py` answers how many (box, line) pairs cross a rule; it cannot say
whether the crossing is a node's own subscript hanging out of its frame or a label that merely sits
inside a big frame somebody else drew. This imports that gauge's own `pairs` -- the same pairing rule
and floor, not a second one -- takes the worst pair on the page, and prints the strip that holds both
the rectangle and the ink band.

Usage: python _work/crop_escape.py <stem> <page> <out.png> [floor]
"""
import os
import sys

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, ROOT)
from _work.probe_frame_ink_overflow import pairs  # noqa: E402


def main():
    stem, page, out = sys.argv[1], int(sys.argv[2]), sys.argv[3]
    floor = float(sys.argv[4]) if len(sys.argv) > 4 else 0.2
    pdf = os.path.join(ROOT, "typst", stem, "main.pdf")
    doc = fitz.open(pdf)
    p = doc[page - 1]
    got = sorted(pairs(p, floor), key=lambda h: -h[0])
    if not got:
        print("no pair over %.2f pt on %s p%d" % (floor, stem[:40], page))
        doc.close()
        return
    over, r, band, text, math, edge = got[0]
    clip = fitz.Rect(min(r.x0, band.x0) - 40, min(r.y0, band.y0) - 40,
                     max(r.x1, band.x1) + 40, max(r.y1, band.y1) + 40)
    clip &= p.rect
    pix = p.get_pixmap(dpi=300, clip=clip)
    path = os.path.join(ROOT, "_work", out)
    pix.save(path)
    print("wrote %s (%dx%d)  %s p%d  over %.2f pt at the %s rule, %s"
          % (path, pix.width, pix.height, stem[:40], page, over, edge,
             "math" if math else "prose"))
    print("  rect x[%.1f %.1f] y[%.1f %.1f]  band y[%.1f %.1f]  %r"
          % (r.x0, r.x1, r.y0, r.y1, band.y0, band.y1, text[:60]))
    print("  pairs on the page over %.2f pt: %d" % (floor, len(got)))
    doc.close()


if __name__ == "__main__":
    main()
