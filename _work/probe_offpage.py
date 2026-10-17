r"""Corpus scan: ink that falls outside its own page.

Reads every product PDF with fitz (no typst) and reports, per paper, the pages whose text or drawing
bbox runs past the page edge. A figure the canvas sized only from its points can hang off either
side, and nothing downstream complains -- the ink is simply not on the page.
"""
import glob
import os
import sys

import pymupdf

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TOL = 2.0

rows = []
for pdf in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.pdf"))):
    stem = os.path.basename(os.path.dirname(pdf))
    doc = pymupdf.open(pdf)
    try:
        pages, worst = [], 0.0
        for n in range(len(doc)):
            page = doc[n]
            rects = [b[:4] for b in page.get_text("blocks")]
            rects += [tuple(d["rect"]) for d in page.get_drawings()]
            over = 0.0
            for x0, y0, x1, y1 in rects:
                over = max(over, page.rect.x0 - x0, x1 - page.rect.x1,
                           page.rect.y0 - y0, y1 - page.rect.y1)
            if over > TOL:
                pages.append(n + 1)
                worst = max(worst, over)
        if pages:
            rows.append((stem, len(pages), pages[:6], worst))
    finally:
        doc.close()

rows.sort(key=lambda r: -r[3])
print("papers with off-page ink: %d" % len(rows))
for stem, n, pages, worst in rows:
    print("  %-62s %3d pages  worst %.0fpt  %s" % (stem[:62], n, worst, pages))
