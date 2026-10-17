r"""Flag text that a stroked path is drawn through, off the rendered PDFs.

A label that collides with another label and a label that a rule runs through are the same defect seen
from two sides: CeTz places text without knowing its extent. `_work/word_overlap_report.py` only compares
text to text, so it cannot see the second kind, which is what page 20 of The-Deligne-Drinfeld-conjecture
shows ("letters in {p,0}" under its own box rule, a vertical connector straight through "any further
deletions"). This walks each page's vector drawings and measures how far a stroked segment runs inside a
word box.

A segment counts as crossing a word when the part of it inside the box is at least 0.5 * the box's shorter
side, which lets a rule through a word or a stem through a word through while rejecting a path that only
clips a corner.

Usage: python _work/text_rule_overlap_report.py [paper-prefix] [top-count]
"""
import io
import os
import sys

import pymupdf as fitz

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TYPST = os.path.join(ROOT, "typst")


def chord(seg, box):
    """-> length of the segment that lies inside box (Liang-Barsky clipping), 0 when disjoint."""
    (x0, y0), (x1, y1) = seg
    dx, dy = x1 - x0, y1 - y0
    t0, t1 = 0.0, 1.0
    for p, q in ((-dx, x0 - box[0]), (dx, box[2] - x0),
                 (-dy, y0 - box[1]), (dy, box[3] - y0)):
        if p == 0:
            if q < 0:
                return 0.0
            continue
        r = q / p
        if p < 0:
            t0 = max(t0, r)          # entering the box along this axis
        else:
            t1 = min(t1, r)          # leaving it
        if t0 > t1:
            return 0.0
    return (t1 - t0) * (dx * dx + dy * dy) ** 0.5


def ink_box(w):
    """A word's box shrunk inside its own line box.

    fitz reports the em box, not the ink, so a node's frame line crosses the top and bottom of the
    box without touching the glyphs; 20% off each vertical edge keeps a rule through the middle of a
    word and drops a rule that only bounds it.
    """
    pad = 0.2 * (w[3] - w[1])
    return (w[0], w[1] + pad, w[2], w[3] - pad)


def clusters(paths, min_items=5):
    """-> bounding boxes of stroked groups big enough to be a drawing.

    A fraction bar or an integral sign is also a stroked line through a maths box, and it is not a
    defect; a picture is a connected mass of strokes, so only text inside such a mass is judged.
    Boxes are merged while they still touch, which keeps one figure together and leaves inline maths
    out.
    """
    boxes = []
    for path in paths:
        if path.get("type") not in ("s", "stroke"):
            continue
        items = [i for i in path["items"] if i[0] in ("l", "re", "qu", "c")]
        if not items:
            continue
        r = fitz.Rect(path["rect"])
        boxes.append((r, len(items)))
    merged = True
    while merged:
        merged = False
        out = []
        while boxes:
            a, na = boxes.pop()
            for b, nb in list(out):
                if a.intersects(b):
                    out.remove((b, nb))
                    a = a | b
                    na += nb
                    merged = True
                    break
            out.append((a, na))
        boxes = out
    return [r for r, n in boxes if n >= min_items]


def crossings(page, words):
    """-> [(word, segment, chord length)] for stroked paths running through a word box."""
    drawings = page.get_drawings()
    zones = clusters(drawings)
    if not zones:
        return []
    words = [w for w in words
             if any(z.contains(fitz.Point((w[0] + w[2]) / 2, (w[1] + w[3]) / 2)) for z in zones)]
    out = []
    for path in drawings:
        if path.get("type") not in ("s", "stroke"):
            continue
        for item in path["items"]:
            segs = []
            if item[0] == "l":
                segs.append(((item[1].x, item[1].y), (item[2].x, item[2].y)))
            elif item[0] == "re":
                r = item[1]
                for a, b in (((r.x0, r.y0), (r.x1, r.y0)), ((r.x1, r.y0), (r.x1, r.y1)),
                             ((r.x1, r.y1), (r.x0, r.y1)), ((r.x0, r.y1), (r.x0, r.y0))):
                    segs.append((a, b))
            for seg in segs:
                for w in words:
                    box = ink_box(w)
                    short = min(box[2] - box[0], box[3] - box[1])
                    got = chord(seg, box)
                    if got and short and got >= 0.5 * short:
                        out.append((w[4], seg, round(got, 1)))
    return out


def scan(prefix=""):
    rows = []
    for paper in sorted(os.listdir(TYPST)):
        if prefix and not paper.startswith(prefix):
            continue
        pdf = os.path.join(TYPST, paper, "main.pdf")
        if not os.path.isfile(pdf):
            continue
        doc = fitz.open(pdf)
        for pno, page in enumerate(doc, start=1):
            words = [w for w in page.get_text("words") if w[4].strip()]
            if len(words) < 3:
                continue
            got = crossings(page, words)
            if got:
                rows.append((len(got), paper, pno, got[:3]))
        doc.close()
    return rows


if __name__ == "__main__":
    prefix = sys.argv[1] if len(sys.argv) > 1 else ""
    top = int(sys.argv[2]) if len(sys.argv) > 2 else 20
    rows = scan(prefix)
    rows.sort(reverse=True)
    print("pages with a stroked path through text: %d over %d papers"
          % (len(rows), len(set(r[1] for r in rows))))
    for n, paper, pno, sample in rows[:top]:
        print("  %4d  %-44s p%-4d  %s"
              % (n, paper[:44], pno,
                 "; ".join("'%s' chord %.1f" % (w, c) for w, _, c in sample)[:120]))
