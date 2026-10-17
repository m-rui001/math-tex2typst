r"""Does the residual foreign-ink face survive one more rule: an invaded box must HOLD text?

The worst canvas of the residual face (`Finite-cylinder-approximation-of-ruled-sets#0`, 12.5pt) is a grid of
95 stroked 27x27pt cells with the author's own prose sitting on top of them -- in the source tikz the text is
`at` a coordinate over the grid, so pgf overlaps those cells too. A rectangle that contains **no** text
centre is artwork, not a node frame, and ink crossing it is not a collision of labels and boxes.

Re-render the flagged canvases with that filter added to the box population and recount. The gauge's own
control picture must still say yes (its box holds `BOXED`), which is the positive that licenses the zero.

  python _work/probe82c_box_holds_text.py
"""
import json
import os
import sys
import concurrent.futures

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "_work"))
import probe81_label_box_face as g  # noqa: E402


def hits_filter(rects, ink):
    """The gauge's two rules, plus: a box must have some ink centred inside it to be a box."""
    live = []
    for r in rects:
        for text, band in ink:
            cx, cy = (band.x0 + band.x1) / 2, (band.y0 + band.y1) / 2
            if r.x0 <= cx <= r.x1 and r.y0 <= cy <= r.y1:
                live.append(r)
                break
    return g.hits(live, ink), len(rects), len(live)


def main():
    records = json.load(open(os.path.join(ROOT, "_work", "label81_pairs.json"), encoding="utf-8"))
    canv = g.canvases()
    items = [(stem, k) for stem, k, _s, found, both in records if found or both]
    print("flagged canvases to re-read: %d in %d papers"
          % (len(items), len({s for s, _ in items})), flush=True)

    def one(item):
        i, (stem, k) = item
        head, block = canv[(stem, k)]
        got = g.render(block, "c%04d_%d" % (i, k), head)
        if not got:
            return None
        rects, ink, pdf = got
        (found, both), n_before, n_after = hits_filter(rects, ink)
        if found or both:
            nf = len(found)
            caps = g.confirmed(pdf, [t[5] for t in found] + [t[6] for t in both])
            found = [t for t, ok in zip(found, caps[:nf]) if ok]
            both = [t for t, ok in zip(both, caps[nf:]) if ok]
        return stem, k, len(found), len(both), n_before, n_after

    canv_with = papers = 0
    nf = nb = boxes = live_boxes = 0
    papers = set()
    with concurrent.futures.ThreadPoolExecutor(max_workers=12) as pool:
        for r in pool.map(one, enumerate(items)):
            if r is None:
                continue
            stem, k, a, b, n_before, n_after = r
            boxes += n_before
            live_boxes += n_after
            nf += a
            nb += b
            if a or b:
                canv_with += 1
                papers.add(stem)
    print("boxes seen: %d   holding text: %d" % (boxes, live_boxes))
    print("with the filter: canvases with a collision %d -> %d in %d papers"
          % (len(items), canv_with, len(papers)))
    print("foreign pairs %d   ink-on-ink pairs %d" % (nf, nb))

    # positive control: the gauge's own known positive must still be a positive
    pic = (r"\begin{tikzpicture}"
           r"\node[draw, minimum width=2cm, minimum height=0.8cm] (a) at (0,0) {BOXED};"
           r"\node at (1.15, 0.30) {INVADES};"
           r"\node (b) at (0, 2) {FIRSTWORD};"
           r"\node (c) at (0.9, 2.1) {SECONDWORD};"
           r"\end{tikzpicture}")
    canvas = g.cetz.build(g.cetz.strip_envelope(pic))
    got = g.render(canvas, "c_control", g.HEAD + g.PAGE)
    if not got:
        print("CONTROL FAILED: typst refused the control canvas")
        return 1
    rects, ink, pdf = got
    (found, both), n_before, n_after = hits_filter(rects, ink)
    nf = len(found)
    caps = g.confirmed(pdf, [t[5] for t in found] + [t[6] for t in both])
    found = [t for t, ok in zip(found, caps[:nf]) if ok]
    both = [t for t, ok in zip(both, caps[nf:]) if ok]
    print("control: boxes %d holding text %d   foreign-ink=%d  ink-on-ink=%d (must be 1 and 2)"
          % (n_before, n_after, len(found), len(both)))
    return 0


if __name__ == "__main__":
    sys.exit(main())
