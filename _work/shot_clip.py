r"""Crop one band of one product page, so a figure can be looked at at a readable size.

A whole page at 150 dpi is downscaled by whatever reads it, and the thing #42 is about -- a letter
sitting on the left border of a 12mm box instead of in its middle -- is 11pt of ink. Usage:
`python _work/shot_clip.py <paper-glob> <page> <top-fraction> <height-fraction> [dpi]`, e.g.
`python _work/shot_clip.py A-Counterexample 36 0.05 0.42 300`.
"""
import glob
import os
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
pat, page_no = sys.argv[1], int(sys.argv[2])
top, height = float(sys.argv[3]), float(sys.argv[4])
dpi = int(sys.argv[5]) if len(sys.argv) > 5 else 300

hits = glob.glob(os.path.join(ROOT, "typst", pat + "*", "main.pdf"))
if not hits:
    sys.exit("no main.pdf matches typst/%s*" % pat)
print(os.path.basename(os.path.dirname(hits[0]))[:60])
doc = fitz.open(hits[0])
page = doc[page_no - 1]
rect = page.rect
clip = fitz.Rect(rect.x0, rect.y0 + top * rect.height,
                 rect.x1, rect.y0 + (top + height) * rect.height)
out = os.path.join(ROOT, "_work", "clip-%s-p%d.png" % (pat[:22], page_no))
page.get_pixmap(dpi=dpi, clip=clip).save(out)
print("%s  page %d  clip y %.2f..%.2f at %d dpi" % (os.path.basename(out), page_no, top,
                                                    top + height, dpi))
