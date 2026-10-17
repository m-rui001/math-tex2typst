r"""Which lines does the page gauge actually treat as shafts?

`_work/probe30_cd_page.py` reports 137 shaft-through-letters pairs over the 48 regenerated papers,
five times the 32 the canvas gauge counts, so most of them are not arrows.  A CeTz arrow reaches the
PDF as one stroke holding the `l` segment *and* its tip mark, while a fraction bar or an overline is
a lone `l`; this prints, for each page, the flagged pair's line together with the item kinds of the
drawing that owns it, so the discriminator can be read instead of guessed.

Usage: python _work/probe30_cd_kinds.py <stem-prefix> <page>
"""
import os
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, ROOT)
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
from _work.probe30_cd_page import crossings  # noqa: E402

name = sys.argv[1]
page_no = int(sys.argv[2])
path = next(os.path.join(ROOT, "typst", d, "main.pdf")
            for d in sorted(os.listdir(os.path.join(ROOT, "typst"))) if d.startswith(name))
doc = fitz.open(path)
page = doc[page_no - 1]
drawings = page.get_drawings()


def owner(seg):
    """The drawing holding a segment of exactly these endpoints, plus its item-kind signature."""
    for d in drawings:
        for item in d["items"]:
            if item[0] != "l":
                continue
            p, q = item[1], item[2]
            if max(abs(p.x - seg[0]), abs(p.y - seg[1]),
                   abs(q.x - seg[2]), abs(q.y - seg[3])) < 0.05:
                kinds = {}
                for it in d["items"]:
                    kinds[it[0]] = kinds.get(it[0], 0) + 1
                return d["type"], kinds, round(d.get("width") or 0, 2), d["color"], len(d["items"])
    return None


for d, seg, r, text in sorted(crossings(page), key=lambda g: -g[0]):
    print("   %5.1f pt %-12r seg %s owner %s"
          % (d, text[:12], tuple(round(v, 1) for v in seg), owner(seg)))
print("== page has %d drawings" % len(drawings))
doc.close()
