r"""Render one page of any PDF to _work/shot/, locating it by a text needle.

Used to compare a figure against the author's own LaTeX PDF: the same drawing, two renderers.

Usage: python _work/shot_pdf_page.py <pdf> <needle> [dpi]
"""
import io
import os
import sys

import fitz

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
pdf, needle = sys.argv[1], sys.argv[2]
dpi = int(sys.argv[3]) if len(sys.argv) > 3 else 150
doc = fitz.open(pdf)
hit = None
for i, page in enumerate(doc):
    if needle in page.get_text():
        hit = i
        break
if hit is None:
    print("needle %r on no page of %s" % (needle, os.path.basename(pdf)))
    sys.exit(1)
png = os.path.join(ROOT, "_work", "shot", "%s-p%d.png" % (os.path.splitext(os.path.basename(pdf))[0][:44], hit + 1))
doc[hit].get_pixmap(dpi=dpi).save(png)
print("page %d -> %s" % (hit + 1, png))
