r"""Say what runs off one page: the widest text block and the widest drawing, with their content."""
import os
import sys

import pymupdf

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
stem, num = sys.argv[1], int(sys.argv[2]) - 1

doc = pymupdf.open(os.path.join(ROOT, "typst", stem, "main.pdf"))
try:
    page = doc[num]
    print("page.rect", page.rect)
    for b in page.get_text("blocks"):
        x0, y0, x1, y1, text = b[0], b[1], b[2], b[3], b[4]
        over = max(page.rect.x0 - x0, x1 - page.rect.x1, page.rect.y0 - y0,
                   y1 - page.rect.y1)
        if over > 2:
            print("TEXT over %.0f bbox=(%.0f,%.0f,%.0f,%.0f) %r"
                  % (over, x0, y0, x1, y1, text[:120].replace("\n", " ")))
    worst = []
    for d in page.get_drawings():
        r = d["rect"]
        over = max(page.rect.x0 - r.x0, r.x1 - page.rect.x1, page.rect.y0 - r.y0,
                   r.y1 - page.rect.y1)
        if over > 2:
            worst.append((over, r, d["type"]))
    worst.sort(key=lambda t: -t[0])
    print("drawings off-page: %d" % len(worst))
    for over, r, kind in worst[:6]:
        print("  DRAW over %.0f type=%s bbox=(%.0f,%.0f,%.0f,%.0f)"
              % (over, kind, r.x0, r.y0, r.x1, r.y1))
finally:
    doc.close()
