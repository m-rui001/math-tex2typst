r"""How many arrowheads still print inside a word's own letters, over the whole corpus?

§7's 「箭线插进只按文字撑开的盒子节点」 row counted three anecdotes, all read by eye off screenshots.
#73 and #74 priced a label's ink, so this is the mechanical re-ask of what the eye asked -- and the
first pass over it was worthless, reporting 53,948 hits because it took EVERY endpoint of EVERY
stroked line on the page: the four sides of a node's frame, a table's rules, and the segments of a
bent path all have endpoints, and a frame's corner sits in the text it frames. What the question
actually needs is one straight segment, arriving from outside the word: a path of exactly one `l`
item whose far end lies in no word box at all, and whose near end lies in the CORE of a word box --
ink, not leading. A tip that fails either half is not an arrow printed into letters.

    python _work/probe_tip_in_ink.py [N]        # N examples per family, default 12
"""
import io
import os
import sys

import fitz

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
INK = 1.0            # pt of a word box that is leading, not glyph
MIN_LEN = 4.0        # a segment shorter than this is a dash, not an arrow


def arrows(page):
    """One-segment stroked paths on the page, as (start, end) pairs."""
    out = []
    for d in page.get_drawings():
        if d.get("fill") is not None or d.get("color") is None:
            continue
        items = [item for item in d["items"] if item[0] in ("l", "c")]
        if len(items) != 1 or items[0][0] != "l":
            continue
        a, b = items[0][1], items[0][2]
        if abs(b.x - a.x) + abs(b.y - a.y) < MIN_LEN:
            continue
        out.append((a, b))
    return out


hits = {}
papers = set()
for name in sorted(os.listdir(os.path.join(ROOT, "typst"))):
    pdf = os.path.join(ROOT, "typst", name, "main.pdf")
    if not os.path.isfile(pdf):
        continue
    doc = fitz.open(pdf)
    try:
        for pno in range(len(doc)):
            page = doc[pno]
            words = [(fitz.Rect(w[:4]) + (INK, INK, -INK, -INK), w[4])
                     for w in page.get_text("words")]
            if not words:
                continue
            for a, b in arrows(page):
                for tip, tail in ((a, b), (b, a)):
                    inside = [word for r, word in words if r.contains(fitz.Point(tip.x, tip.y))]
                    if not inside:
                        continue
                    if any(r.contains(fitz.Point(tail.x, tail.y)) for r, _ in words):
                        continue          # both ends in text: a rule, not an arriving arrow
                    papers.add(name)
                    hits.setdefault(inside[0], []).append(
                        (name[:34], pno + 1, "%.1f,%.1f" % (tip.x, tip.y)))
                    break
    finally:
        doc.close()

n = int(sys.argv[1]) if len(sys.argv) > 1 else 12
print("arrow tips printed inside a word: %d over %d papers (%d distinct words)"
      % (sum(len(v) for v in hits.values()), len(papers), len(hits)))
for word, rows in sorted(hits.items(), key=lambda kv: -len(kv[1]))[:n]:
    print("%6d  %-16s" % (len(rows), word[:16]))
    for paper, page, off in rows[:3]:
        print("          %s p%s  tip=(%s)pt" % (paper, page, off))
