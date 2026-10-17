"""Read the fixed equation off the shipped page: is the 2x2 matrix a matrix now?"""
import sys

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

STEM = "The-Quasi-Riemann-Hypothesis-October-5-2026"
NEEDLE = "To choose the cusp"
doc = fitz.open("typst/%s/main.pdf" % STEM)
try:
    for pno in range(doc.page_count):
        page = doc[pno]
        hits = page.search_for(NEEDLE)
        if not hits:
            continue
        y0 = hits[0].y0
        print("page %d, needle at y=%.0f" % (pno + 1, y0))
        rows = {}
        for b in page.get_text("dict")["blocks"]:
            for l in b.get("lines", []):
                for s in l["spans"]:
                    y = round(s["bbox"][1], 0)
                    if y0 - 10 <= y <= y0 + 130:
                        rows.setdefault(y, []).append((round(s["bbox"][0], 1), s["text"]))
        for y in sorted(rows):
            print("  y=%-5s %s" % (y, " | ".join("%s@%.0f" % (t, x) for x, t in sorted(rows[y]))[:150]))
        break
finally:
    doc.close()
