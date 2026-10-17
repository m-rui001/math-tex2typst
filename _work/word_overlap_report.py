r"""Measure text that is printed on top of other text, off the rendered PDFs.

CeTz places node text without knowing its typeset width, so a label can land on its neighbour. The
page is the only authority for that: fitz reports every word's box after layout, so two words whose
boxes nearly coincide are two words the reader cannot read apart. Pages carrying vector drawings are
reported apart from prose pages, because an overlap inside a drawing is a CeTz placement bug while one
in prose is something else entirely.

Usage: python _work/word_overlap_report.py [top-count]
"""
import io
import os
import re
import sys

import fitz

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TYPST = os.path.join(ROOT, "typst")


def overlap(a, b):
    """-> (dx, dy) overlap lengths of two word boxes, or None when they do not intersect."""
    dx = min(a[2], b[2]) - max(a[0], b[0])
    dy = min(a[3], b[3]) - max(a[1], b[1])
    return (dx, dy) if dx > 0 and dy > 0 else None


def coincident(a, b):
    """Two words count as压字 only when each dimension overlaps by > half the narrower box."""
    got = overlap(a, b)
    if not got:
        return False
    dx, dy = got
    wa, ha = a[2] - a[0], a[3] - a[1]
    wb, hb = b[2] - b[0], b[3] - b[1]
    return dx > 0.5 * min(wa, wb) and dy > 0.5 * min(ha, hb)


rows = []
pages_scanned = 0
for paper in sorted(os.listdir(TYPST)):
    pdf = os.path.join(TYPST, paper, "main.pdf")
    if not os.path.isfile(pdf):
        continue
    doc = fitz.open(pdf)
    hits = 0
    for pno, page in enumerate(doc, start=1):
        pages_scanned += 1
        words = [w for w in page.get_text("words") if w[4].strip()]
        words.sort(key=lambda w: (w[1], w[0]))
        found = []
        for i, a in enumerate(words):
            # a word can only collide with a word whose baseline is within its own height
            for b in words[i + 1:i + 60]:
                if b[1] > a[3]:
                    break
                if a[5] == b[5] and a[6] == b[6]:
                    continue
                if coincident(a, b):
                    found.append((a[4], b[4], round(a[0], 1), round(a[1], 1)))
        if found:
            figure = len(page.get_drawings()) >= 10
            hits += len(found)
            rows.append((len(found), paper, pno, figure, found[:3]))
    doc.close()

rows.sort(reverse=True)
print("pages scanned: %d ; pages with coincident words: %d ; pairs: %d"
      % (pages_scanned, len(rows), sum(r[0] for r in rows)))
print("of those pages, vector-drawing pages: %d over %d papers"
      % (sum(1 for r in rows if r[3]), len(set(r[1] for r in rows if r[3]))))
for n, paper, pno, figure, pairs in rows[:int(sys.argv[1]) if len(sys.argv) > 1 else 20]:
    print("  %4d  %-44s p%-4d %s  %s"
          % (n, paper[:44], pno, "FIGURE" if figure else "prose",
             "; ".join("'%s'/'%s'@%.0f,%.0f" % p for p in pairs[:2])[:110]))
