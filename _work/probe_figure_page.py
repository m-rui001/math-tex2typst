"""Which page of the generated PDF carries this picture's own words, and at what coordinates.

#46 widened a frame by its declared `inner xsep`, so the check is not just "does it look right" but
"where did the arrow land": a connector that reaches the box's edge in the control and stops 7pt
short of it in the candidate is the same bug wearing a different face.  fitz answers both -- the page
number from a needle, the geometry from `get_drawings()`.
"""
import pathlib
import sys

import pymupdf

ROOT = pathlib.Path(__file__).resolve().parents[1]
STEM = sys.argv[1]
NEEDLES = sys.argv[2:]

doc = pymupdf.open(str(ROOT / "typst" / STEM / "main.pdf"))
for n in range(len(doc)):
    page = doc[n]
    text = page.get_text()
    hit = [needle for needle in NEEDLES if needle in text]
    if not hit:
        continue
    print("page %d <- %s" % (n + 1, hit))
    print("  rect=%s  drawings=%d" % (page.rect, len(page.get_drawings())))
    for word in ("Positively", "Insertion", "Kakeya", "Loss"):
        for rect in page.search_for(word)[:2]:
            print("  %-11s x0=%.2f y0=%.2f x1=%.2f y1=%.2f" %
                  (word, rect.x0, rect.y0, rect.x1, rect.y1))
doc.close()
