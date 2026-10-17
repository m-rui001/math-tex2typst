r"""Render a clip of one product page at high dpi so small figure text can be read."""
import os
import sys

import pymupdf

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
stem, num, clip, dpi = sys.argv[1], int(sys.argv[2]), sys.argv[3], int(sys.argv[4])
x0, y0, x1, y1 = (float(v) for v in clip.split(","))
doc = pymupdf.open(os.path.join(ROOT, "typst", stem, "main.pdf"))
try:
    page = doc[num - 1]
    out = os.path.join(ROOT, "_work", "crop_%s_p%s.png" % (stem[:24], num))
    page.get_pixmap(dpi=dpi, clip=pymupdf.Rect(x0, y0, x1, y1)).save(out)
    print(out)
finally:
    doc.close()
