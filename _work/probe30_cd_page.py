r"""#30's page-side judge: does an arrow's shaft run through letters on the rendered page?

The canvas gauges (`_work/probe30_cd_face.py`) reason in the centimetres the converter wrote down;
this one reads the ink Typst put on the sheet.  Not every line on a page is an arrow: the first cut
of this gauge counted page-wide horizontal rules and table grids as shafts and reported 137 pairs on
48 papers, five times what the canvas gauge counts.  A CeTz arrow is identifiable by its structure --
PyMuPDF gives its shaft as a drawing holding one `l` item, and its tip as a next drawing of three
short `l` items (a 4.2 x 5.6 pt triangle on the Filtered paper's p40) with a vertex on the shaft's
endpoint.  A fraction bar, an overline, a table rule and a body `\\rule` carry no tip, so a line
counts as a shaft only when a tip touches one of its ends.

A shaft then crosses a label when it *passes through* the span's box -- entering one edge and leaving
another, with the part inside the box longer than a hair -- and keeps drawing outside it, which is
what separates a shaft from a formula's own rule that stops at its box.

Usage: python _work/probe30_cd_page.py [name-list | --all] [crop]
"""
import io
import os
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace", newline="")
MIN_PT = 12.0
OUTSIDE_PT = 3.0
TIP_PT = 9.0  # an arrowhead triangle is 4-6 pt across; anything larger is not a tip
# a shaft counts as crossing a box only once it is this far inside it, measured across the shaft.
# Typst's line box for an 11pt letter is 0.388 cm tall while the ink is about half that, so a label
# hung by tikz-cd's 0.077 cm gap grazes its own shaft by 0.2 pt; a shaft through a letter bites ~5 pt.
DEPTH_PT = 1.0


def clip(x1, y1, x2, y2, r):
    """The parameter interval of the segment that lies inside the rect, or None.

    Liang-Barsky: a negative `p` enters the slab at `t` and a positive one leaves it there, so the
    branch is on the sign of `p`.  Branching on the sign of `t` instead -- as this first did --
    returns None for every segment that crosses, which is a gauge that cannot say yes.
    """
    lo, hi, dx, dy = 0.0, 1.0, x2 - x1, y2 - y1
    for p, q in ((-dx, x1 - r.x0), (dx, r.x1 - x1), (-dy, y1 - r.y0), (dy, r.y1 - y1)):
        if abs(p) < 1e-9:
            if q < 0:
                return None
            continue
        t = q / p
        if p < 0:
            if t > hi:
                return None
            lo = max(lo, t)
        else:
            if t < lo:
                return None
            hi = min(hi, t)
    return (lo, hi) if lo <= hi else None


def shafts_of(page):
    """The arrow shafts on a page: lone-`l` lines that a tip drawing touches at an end.

    CeTz writes `line(a, b, mark: (end: ">"))` as two stroked paths -- the shaft (one `l`) and the
    arrowhead (three `l` inside a 4-6 pt box, not closed).  Lines with no tip anywhere near them are
    table rules, fraction bars or body rules, and this gauge must not call them arrows.
    """
    tips, lines = [], []
    for d in page.get_drawings():
        items = [i for i in d["items"] if i[0] == "l"]
        if len(d["items"]) != len(items):
            continue
        if 2 <= len(items) <= 4 and d["rect"].width <= TIP_PT and d["rect"].height <= TIP_PT:
            tips.append(fitz.Rect(d["rect"]))
        elif len(items) == 1:
            lines.append((items[0][1], items[0][2]))
    shafts = []
    for p, q in lines:
        if ((p.x - q.x) ** 2 + (p.y - q.y) ** 2) ** 0.5 < MIN_PT:
            continue
        # the arrowhead straddles the shaft's end: its base corners sit 2 pt to the sides of the
        # endpoint, so the test is "the endpoint lies in the tip's box", not "a vertex coincides".
        for end in (p, q):
            if any(-0.8 <= end.x - r.x0 and end.x - r.x1 <= 0.8
                   and -0.8 <= end.y - r.y0 and end.y - r.y1 <= 0.8 for r in tips):
                shafts.append((p.x, p.y, q.x, q.y))
                break
    return shafts


def crossings(page):
    """(depth into the box, segment, span box, text) for every shaft that runs through letters.

    The severity is how deep the shaft bites into the box *across* itself, not how much of it the box
    covers along its length.  A label hung by tikz-cd's own 0.077 cm clears a shaft by a hair, and
    Typst reports that 11pt letter as a 0.388 cm line box, so the shaft grazes the box's edge and the
    chord inside it is the label's whole width -- 20 pt of "crossing" for a graze the eye does not
    see.  Depth tells the two apart: a shaft through the middle of a letter bites ~5 pt, one along its
    edge a fraction of a point.
    """
    shafts = shafts_of(page)
    got = []
    for b in page.get_text("dict")["blocks"]:
        for line in b.get("lines", []):
            for s in line["spans"]:
                if not s["text"].strip():
                    continue
                r = fitz.Rect(s["bbox"])
                if r.width < 2 or r.height < 2:
                    continue
                for x1, y1, x2, y2 in shafts:
                    span_len = ((x2 - x1) ** 2 + (y2 - y1) ** 2) ** 0.5
                    hit = clip(x1, y1, x2, y2, r)
                    if not hit:
                        continue
                    inside = (hit[1] - hit[0]) * span_len
                    # a rule that belongs to the formula stops at its own box; a shaft goes on
                    if min(hit[0], 1 - hit[1]) * span_len < OUTSIDE_PT or inside < 2.0:
                        continue
                    # the box's corners projected across the shaft's own line: the smaller of the two
                    # sides the line got past is how deep it is
                    ux, uy = (x2 - x1) / span_len, (y2 - y1) / span_len
                    side = [(p.x - x1) * uy - (p.y - y1) * ux
                            for p in (fitz.Point(r.x0, r.y0), fitz.Point(r.x1, r.y0),
                                      fitz.Point(r.x0, r.y1), fitz.Point(r.x1, r.y1))]
                    depth = min(-min(side), max(side))
                    if depth < DEPTH_PT:
                        continue
                    got.append((depth, (x1, y1, x2, y2), r, s["text"][:36]))
    return got


def main():
    if len(sys.argv) > 1 and sys.argv[1] == "--all":
        names = sorted(d for d in os.listdir(os.path.join(ROOT, "typst"))
                       if os.path.exists(os.path.join(ROOT, "typst", d, "main.pdf")))
    else:
        listfile = sys.argv[1] if len(sys.argv) > 1 else os.path.join(ROOT,
                                                                     "_work", "regen_needed.txt")
        names = [l.strip() for l in open(listfile, encoding="utf-8") if l.strip()]
    crop = len(sys.argv) > 2
    total, pages_hit, papers_hit, worst = 0, 0, set(), []
    for name in names:
        pdf = os.path.join(ROOT, "typst", name, "main.pdf")
        if not os.path.exists(pdf):
            continue
        doc = fitz.open(pdf)
        for i, page in enumerate(doc):
            got = crossings(page)
            if not got:
                continue
            total += len(got)
            pages_hit += 1
            papers_hit.add(name)
            worst.extend([(d, name, i + 1, r, s, seg) for d, seg, r, s in got])
            if crop:
                clip_rect = fitz.Rect(got[0][2])
                for _d, _seg, r, _s in got:
                    clip_rect |= r
                clip_rect = (clip_rect + (-45, -35, 45, 35)) & page.rect
                page.get_pixmap(dpi=300, clip=clip_rect).save(
                    os.path.join(ROOT, "_work", "crop30page_%s_p%d.png" % (name[:20], i + 1)))
        doc.close()
    worst.sort(key=lambda g: g[0], reverse=True)
    print("== shaft-through-letters pairs: %d on %d pages of %d papers, out of %d checked"
          % (total, pages_hit, len(papers_hit), len(names)))
    for d, name, page_no, r, s, seg in worst[:12]:
        print("   %5.1f pt through  %s p%d  %r" % (d, name[:36], page_no, s))


if __name__ == "__main__":
    main()
