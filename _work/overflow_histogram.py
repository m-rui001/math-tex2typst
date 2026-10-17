r"""How far the worst overfull line of each paper sticks out, and what it is.

`page_overflow_report` prints one row per (side, kind); that hides the shape of the family -- whether
723 papers each lose a couple of points to a wide formula or a few lose half an inch. This takes the
single worst text item per paper per side, buckets the size, and labels the item as an equation tag
(`(3.33)`, the shape `mathconv.tag_text` prints) or as formula/prose text, since the two have
different causes: a tag is pushed out by the equation it belongs to.

Usage: python _work/overflow_histogram.py [floor-pt]
"""
import glob
import io
import os
import re
import sys

import fitz

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "_work"))
TYPST = os.path.join(ROOT, "typst")

from page_overflow_report import margins_of, ink  # noqa: E402

TAG = re.compile(r"^\([0-9][0-9.a-zA-Z*]*\)$")


def main():
    floor = float(sys.argv[1]) if len(sys.argv) > 1 else 2.0
    per_paper = []
    for pdf in sorted(glob.glob(os.path.join(TYPST, "*", "main.pdf"))):
        paper = os.path.basename(os.path.dirname(pdf))
        mg = margins_of(paper)
        if mg is None:
            continue
        left, top_m, right, bottom = mg
        doc = fitz.open(pdf)
        worst = None
        for no, page in enumerate(doc, 1):
            box = fitz.Rect(left, top_m, page.rect.width - right, page.rect.height - bottom)
            for r, what in ink(page):
                if what == "draw" or r.y0 > box.y1:
                    continue
                out = max(box.x0 - r.x0, r.x1 - box.x1)
                if out > floor and (worst is None or out > worst[0]):
                    worst = (out, no, what[5:], "right" if r.x1 - box.x1 >= box.x0 - r.x0 else "left")
        doc.close()
        if worst:
            per_paper.append((worst[0], paper, worst[1], worst[2], worst[3]))

    print("papers with a text line past the margin: %d" % len(per_paper))
    buckets = [(2, 5), (5, 10), (10, 20), (20, 40), (40, 80), (80, 10 ** 6)]
    for lo, hi in buckets:
        got = [r for r in per_paper if lo < r[0] <= hi]
        tags = sum(1 for r in got if TAG.match(r[3]))
        print("  %3d-%-3d pt: %4d papers (%d of them an equation tag)"
              % (lo, hi if hi < 10 ** 6 else -1, len(got), tags))
    over = [r for r in per_paper if r[0] > 10]
    over.sort(reverse=True)
    print("--- every paper worse than 10pt: %d" % len(over))
    for out, paper, no, what, side in over:
        print("%7.1f %-6s p%-4d %-56s %s" % (out, side, no, paper[:56], what[:30]))


main()
