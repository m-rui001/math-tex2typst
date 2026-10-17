r"""#94 page receipt: look at a shipped canvas node label that carries pandoc's escaped punctuation.

The gauges say the escaped `\( \[ X \/ G \] \, \)` prints the ink TeX prints; this crops the figure page
of the live product at 300 dpi around that label so the claim is seen, not only read.  One canvas of
`typst/A-rational-obstruction-.../main.typ` is picked by the walker #93 uses, its text is located with
fitz, and the clip around the hit is written next to this probe.

  python _work/receipt94_canvas.py
"""
import os
import re
import sys

import fitz

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from probe93_product_scan import canvases  # one canvas walker, #93's

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PAPER = "A-rational-obstruction-to-strong-chromatic-splitting-at-height-three-September-25-2026"
NEEDLE = r"X \/ G"          # the escaped form as it stands on disk, not the ink it prints
INK = "X/G"                 # what that string reaches the page as


def main():
    base = os.path.join(ROOT, "typst", PAPER)
    text = open(os.path.join(base, "main.typ"), encoding="utf-8", errors="replace").read()
    in_canvas = [c for c in canvases(text) if NEEDLE in c]
    print("canvases carrying %r: %d of %d" % (NEEDLE, len(in_canvas), len(canvases(text))))
    if not in_canvas:
        return 1
    print("   node label as shipped: %s"
          % re.sub(r"\s+", " ", re.search(r"\$[^$]*\$", in_canvas[0]).group(0))[:110])

    doc = fitz.open(os.path.join(base, "main.pdf"))
    for pno, page in enumerate(doc):
        hits = page.search_for(INK)
        if not hits:
            continue
        draws = len(page.get_drawings())
        print("   page %-3d hits=%-3d drawings=%d" % (pno + 1, len(hits), draws))
    # the figure page is the one where the string sits among the page's own ink, not in a text column:
    # take every hit page and crop the one with the most drawings.
    best = max(((len(p.get_drawings()), i, r) for i, p in enumerate(doc) for r in p.search_for(INK)))
    _n, pno, rect = best
    clip = fitz.Rect(rect.x0 - 90, rect.y0 - 22, rect.x1 + 90, rect.y1 + 22)
    pix = doc[pno].get_pixmap(clip=clip, dpi=300)
    out = os.path.join(ROOT, "_work", "r94_canvas.png")
    pix.save(out)
    print("   wrote %s  page %d  clip %s  %dx%d px"
          % (out, pno + 1, [round(v, 1) for v in clip], pix.width, pix.height))
    doc.close()
    return 0


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
