"""Report where the caption lands relative to the last table rows in the repro PDF."""
import io
import pathlib
import sys

import fitz

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
pdf = fitz.open(str(ROOT / "_work" / "lt_repro" / "repro.pdf"))
print("pages:", pdf.page_count)
cap_page = None
for n, page in enumerate(pdf):
    txt = page.get_text()
    if "Exact coefficients" in txt:
        cap_page = n
        break
print("caption on page", cap_page)

for n, page in enumerate(pdf):
    blocks = page.get_text("blocks")
    ys = [(round(b[1], 1), round(b[3], 1), b[4].strip().replace("\n", "|")[:44]) for b in blocks]
    ys.sort()
    print("---- page", n, "height", round(page.rect.height, 1), "blocks", len(ys))
    for y0, y1, t in ys[:4]:
        print("   top  %7.1f %7.1f  %s" % (y0, y1, t))
    for y0, y1, t in ys[-6:]:
        print("   tail %7.1f %7.1f  %s" % (y0, y1, t))
pdf.close()
