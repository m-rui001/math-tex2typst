r"""Print the full text of every line that sticks out of the margin box on one page.

`page_overflow_report` truncates the item to 24 characters, which is not enough to grep the product
for it. This prints the whole line, its box and how far past each side it reaches, so the offending
`main.typ` source line can be found by a distinctive fragment.

Usage: python _work/wide_line.py <paper-dir-name> <page-number>
"""
import os
import sys

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "_work"))
from page_overflow_report import margins_of  # noqa: E402

paper, no = sys.argv[1], int(sys.argv[2])
left, top, right, bottom = margins_of(paper)
doc = fitz.open(os.path.join(ROOT, "typst", paper, "main.pdf"))
page = doc[no - 1]
box = fitz.Rect(left, top, page.rect.width - right, page.rect.height - bottom)
print("page %d of %s: page box %s, text block %s (margins l%.1f t%.1f r%.1f b%.1f)"
      % (no, paper, page.rect, box, left, top, right, bottom))
for blk in page.get_text("dict")["blocks"]:
    for ln in blk.get("lines", []):
        r = fitz.Rect(ln["bbox"])
        if r.x0 >= box.x0 and r.x1 <= box.x1:
            continue
        text = "".join(sp["text"] for sp in ln.get("spans", []))
        print("  x[%7.1f,%7.1f] y[%6.1f,%6.1f] over L%.1f R%.1f | %s"
              % (r.x0, r.x1, r.y0, r.y1, box.x0 - r.x0, r.x1 - box.x1, text))
