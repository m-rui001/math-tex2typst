r"""Is the gap inside `D_(upright("hole"))` real ink, or my eye on a 216 dpi crop?

`_work/compare_figure.py` cropped the Nonuniqueness figure at Matrix(3,3) and the subscript word
`hole` looked split.  Read the word boxes off the PDF: their x-ranges and the gap between them.
Read-only, fitz only.

  python _work/probe93_hole_gap.py
"""
import os
import re
import sys

import pymupdf

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")

TY = os.path.join(ROOT, "typst")
for d in sorted(os.listdir(TY)):
    if not d.startswith("Nonuniqueness-with-local-conservation"):
        continue
    doc = pymupdf.open(os.path.join(TY, d, "main.pdf"))
    for pno in range(doc.page_count):
        for w in doc[pno].get_text("words"):
            if re.search(r"[Hh]ol?e|hole", w[4]):
                print("p%-3s x0=%7.2f x1=%7.2f y=%7.2f  %r" % (pno + 1, w[0], w[2], w[1], w[4]))
    doc.close()
