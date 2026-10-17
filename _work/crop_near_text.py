r"""Crop the neighbourhood of a word out of a PDF at print resolution, for the eye.

A 2.6bp shift is not visible in a whole-page 144 dpi render (`_work/render_single.py`), so this takes a
page number and a word, unions the word's own band with the rectangles that touch it, and writes that
crop at 300 dpi.  Used in pairs -- the same region of the old-law and new-law products of one paper --
to tell a real collision from a counter's artifact.

Usage:  python _work/crop_near_text.py <pdf> <page> <word> <out.png> [dpi]
"""
import sys

import pymupdf

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
pdf, page_no, word, out = sys.argv[1:5]
dpi = float(sys.argv[5]) if len(sys.argv) > 5 else 300.0

doc = pymupdf.open(pdf)
page = doc[int(page_no) - 1]
hits = page.search_for(word)
if not hits:
    print("no %r on page %s" % (word, page_no))
    sys.exit()
band = hits[0]
for b in hits[1:]:
    band |= b
box = pymupdf.Rect(band.x0 - 10, band.y0 - 14, band.x1 + 10, band.y1 + 14)
for d in page.get_drawings():
    r = d["rect"]
    if r.intersects(pymupdf.Rect(band.x0 - 40, band.y0 - 40, band.x1 + 40, band.y1 + 40)):
        box |= pymupdf.Rect(r.x0 - 4, r.y0 - 4, r.x1 + 4, r.y1 + 4)
page.get_pixmap(matrix=pymupdf.Matrix(dpi / 72, dpi / 72), clip=box).save(out)
print("%s  page %s  crop %.1f x %.1f pt  word at %s"
      % (out, page_no, box.width, box.height, [round(v, 1) for v in band]))
