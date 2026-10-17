r"""Does any node's words stick out past the rectangle drawn around them?

#61 re-frames a sized node with Typst's own `#box`, because that is the frame that has a `radius:`.
The one thing Typst does not do is treat a declared `height:` as pgf's minimum:
`_work/measure_box_vertical_align.py` watched a 3cm x 2cm box hold 3.0000 x 2.0000 cm while three
lines of words ran out through its bottom.  CeTz's `content(range, ..., frame: "rect")` GREW the
frame to fit, so a node whose label is taller than the measure the author wrote is the case this
swap could make worse -- and it is a page fact, not a code reading: count, on every page of a
product, the pairs (drawn box, text line) where the line's centre sits inside the box horizontally
while the line's band crosses its top or bottom edge.

Run it on the same paper before and after a regeneration: the numbers have to agree.

Usage:  python _work/probe_frame_ink_overflow.py [--limit N] [stem ...]
"""
import glob
import json
import os
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
# a node's own rectangle: prose columns, table rules and page frames are not candidates
MAX_W, MAX_H, MIN_W = 220.0, 140.0, 8.0


def pairs(page, floor=1.0):
    """(rect, line) pairs whose ink escapes the box drawn around it, worst overflow in pt.

    The last two fields say what escaped: `math` is whether any span of the line is set in a math
    font (Typst keeps maths in its own face, so the page itself tells us -- the product line does
    not), and `edge` is which rule the ink crosses, `top` or `bottom`.  `floor` is the noise gate:
    1.0 pt is the one the #61/#63 ledger numbers were taken with, and #69's subscripts cross by less
    than that, so the same pairs are re-counted at a smaller floor instead of building a second
    gauge.
    """
    seen, rects = set(), []
    for d in page.get_drawings():
        r = d["rect"]
        key = (round(r.x0, 1), round(r.y0, 1), round(r.x1, 1), round(r.y1, 1))
        # one rectangle drawn as four segments arrives as several items
        if key in seen:
            continue
        seen.add(key)
        if MIN_W <= r.width <= MAX_W and r.height <= MAX_H and r.height > 2:
            rects.append(r)
    lines = []
    for block in page.get_text("dict")["blocks"]:
        for line in block.get("lines", []):
            lines.append((fitz.Rect(line["bbox"]),
                          "".join(s["text"] for s in line["spans"]).strip(),
                          any("math" in s["font"].lower() for s in line["spans"])))
    got = []
    for r in rects:
        for band, text, math in lines:
            cx = (band.x0 + band.x1) / 2
            if not (r.x0 - 1 <= cx <= r.x1 + 1):
                continue
            if band.width > r.width + 6:
                continue
            top, bottom = r.y0 - band.y0, band.y1 - r.y1
            over = max(top, bottom)
            if over > floor and over < band.height:
                got.append((over, r, band, text, math, "top" if top >= bottom else "bottom"))
    return got


def report(stem, floor=1.0):
    pdf = os.path.join(ROOT, "typst", stem, "main.pdf")
    if not os.path.exists(pdf):
        return None
    doc = fitz.open(pdf)
    worst, total, hits, pages = 0.0, 0, [], doc.page_count
    cats = {}
    for i, page in enumerate(doc):
        for over, r, band, text, math, edge in pairs(page, floor):
            total += 1
            worst = max(worst, over)
            hits.append((over, i + 1, r, text, math, edge))
            cat = ("math" if math else "prose") + "+" + edge
            cats[cat] = cats.get(cat, 0) + 1
    doc.close()
    return total, worst, sorted(hits, key=lambda h: -h[0])[:3], pages, cats


def main():
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    argv = sys.argv[1:]
    out, ref = _flag("--out"), _flag("--diff")
    floor = float(_flag("--over") or 1.0)
    every = "--all" in argv
    args = [a for i, a in enumerate(argv)
            if not a.startswith("--") and argv[i - 1] not in ("--out", "--diff", "--over")]
    if args:
        stems = args
    elif ref:
        # the population is taken from the reference run: after this round nothing in the products
        # still says `frame: "rect"`, so the census that selects it has to come from the before file
        stems = sorted(json.load(open(ref, encoding="utf-8")))
    elif every:
        stems = sorted(os.path.basename(os.path.dirname(p))
                       for p in glob.glob(os.path.join(ROOT, "typst", "*", "main.typ")))
    else:
        # the population this round moves: every product that still draws a sized node with CeTz's
        # `frame: "rect"`
        stems = sorted(os.path.basename(os.path.dirname(p))
                       for p in glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))
                       if b'frame: "rect"' in open(p, "rb").read())
    print("papers scanned: %d  floor: %.2f pt" % (len(stems), floor))
    rows = {}
    for stem in stems:
        got = report(stem, floor)
        if got is None:
            continue
        total, worst, hits, pages, cats = got
        rows[stem] = {"total": total, "worst": round(worst, 2), "pages": pages, "cats": cats,
                      "hits": [(round(h[0], 2), h[1], h[3][:44]) for h in hits]}
    if out:
        with open(out, "w", encoding="utf-8") as f:
            json.dump(rows, f, indent=1, ensure_ascii=False)
        print("wrote %s" % out)
    base = json.load(open(ref, encoding="utf-8")) if ref else {}
    deltas = [(rows[s]["total"] - base.get(s, {}).get("total", 0), s) for s in rows]
    for delta, s in sorted(deltas, reverse=True)[:15]:
        now = rows[s]
        print("%+4d escapes  now %4d / worst %6.2f pt  p%d  %s"
              % (delta, now["total"], now["worst"], now["pages"], s[:52]))
        for over, page, text in now["hits"]:
            print("        p%-3d over %5.2f  %r" % (page, over, text))
    print("TOTAL escapes: %d over %d papers%s"
          % (sum(r["total"] for r in rows.values()), len(rows),
             "" if not base else "  (reference %d)" % sum(r["total"] for r in base.values())))
    for cat in sorted({c for r in rows.values() for c in r["cats"]}):
        n = sum(r["cats"].get(cat, 0) for r in rows.values())
        m = len([r for r in rows.values() if cat in r["cats"]])
        print("  %-14s %5d escapes over %3d papers" % (cat, n, m))


def _flag(name):
    argv = sys.argv[1:]
    if name in argv:
        return argv[argv.index(name) + 1]
    return None


if __name__ == "__main__":
    main()
