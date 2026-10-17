r"""Per drawn rectangle on a page, how far its own text reaches past the border.

The TikZ control centres a node's lines inside its frame; if the generated box is shorter
than the text it holds, the border prints across a line of words.  A rectangle owns the
spans whose centre falls inside it horizontally and whose middle row is nearest to it; the
number reported is how many points of the text stick out above or below the border.
"""
import glob
import os
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


def main():
    sys.stdout.reconfigure(errors="replace")
    pat, page_no = sys.argv[1], int(sys.argv[2])
    pdf = glob.glob(os.path.join(ROOT, "typst", pat, "main.pdf"))[0]
    p = fitz.open(pdf)[page_no - 1]
    rects = []
    for dr in p.get_drawings():
        r = fitz.Rect(dr["rect"])
        if 20 < r.width < 200 and 8 < r.height < 120 and dr.get("color") is not None:
            rects.append(r)
    spans = []
    for blk in p.get_text("dict")["blocks"]:
        for ln in blk.get("lines", []):
            for sp in ln.get("spans", []):
                if sp["text"].strip():
                    spans.append((fitz.Rect(sp["bbox"]), sp["text"].strip()))
    print("%s page %d: %d stroked boxes" % (os.path.basename(pdf), page_no, len(rects)))
    for r in sorted(rects, key=lambda r: (round(r.y0), r.x0)):
        own = [(s, t) for (s, t) in spans
               if r.x0 <= (s.x0 + s.x1) / 2 <= r.x1 and r.y0 - 2 <= s.y0 <= r.y1 + 14]
        if not own:
            continue
        top = min(s.y0 for s, _ in own)
        bot = max(s.y1 for s, _ in own)
        over = max(0.0, r.y0 - top) + max(0.0, bot - r.y1)
        print("  box y %.1f..%.1f  text y %.1f..%.1f  overflow %5.1f pt  %r"
              % (r.y0, r.y1, top, bot, over, " / ".join(t for _, t in own)[:44]))


if __name__ == "__main__":
    main()
