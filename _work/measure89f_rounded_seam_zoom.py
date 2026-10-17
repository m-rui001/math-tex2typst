r"""Is the 12pt corner in `measure89d` variant B (one merged path) actually clean?

The 300 dpi view of the product page still shows a white notch at a junction, so the same isolated
corner is cropped at 600 dpi, split items and merged items, from the PDF `_work/measure89d_...` already
compiled.
"""
import os

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
pdf = os.path.join(ROOT, "_work", "_m89d", "m89d.pdf")
doc = fitz.open(pdf)
page = doc[0]
for i, rect in enumerate([fitz.Rect(85, 105, 145, 165), fitz.Rect(240, 105, 300, 165)]):
    name = "seam89d_zoom_%d.png" % i
    page.get_pixmap(dpi=600, clip=rect).save(os.path.join(ROOT, "_work", name))
    print("-> %s  rect=%s" % (name, rect))
for d in page.get_drawings():
    kinds = "".join(x[0] for x in d["items"])
    print("drawing type=%s items=%s rect=%s" % (d["type"], kinds, d["rect"]))
