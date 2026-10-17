r"""Read one residual collision canvas: its emitted source, its pairs, and a 300 dpi crop of the window.

  python _work/probe82b_one_canvas.py <paper-prefix> <canvas-index>

The crop is the union of the colliding windows (plus 12pt), because a whole canvas is unreadable at
300 dpi. The source block is printed so the emitter construct next to the pixels can be read together.
"""
import json
import os
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "_work"))
import probe81_label_box_face as g  # noqa: E402


def main():
    stem_frag, k = sys.argv[1], int(sys.argv[2])
    records = json.load(open(os.path.join(ROOT, "_work", "label81_pairs.json"), encoding="utf-8"))
    rec = [r for r in records if r[0].startswith(stem_frag) and r[1] == k]
    if not rec:
        print("no flagged pair for %s#%d in the census" % (stem_frag, k))
        return 1
    stem, _k, sizes, found, both = rec[0]
    canv = g.canvases()
    head, block = canv[(stem, k)]
    got = g.render(block, "82b", head)
    if not got:
        print("typst refused this canvas")
        return 1
    rects, ink, pdf = got
    box = None
    for t in found:
        r = fitz.Rect(t[5])
        box = r if box is None else box | r
    for t in both:
        r = fitz.Rect(t[5])
        box = r if box is None else box | r
    box = (box + (-12, -12, 12, 12)) & fitz.Rect(0, 0, 30 * 28.35, 22 * 28.35)
    doc = fitz.open(pdf)
    name = os.path.join(ROOT, "_work", "shot82_%s_%d.png" % (stem[:18], k))
    doc[0].get_pixmap(clip=box, dpi=300).save(name)
    print("paper %s  canvas #%d   boxes=%d ink=%d   crop %.0fx%.0fpt -> %s"
          % (stem, k, sizes[0], sizes[1], box.width, box.height, os.path.relpath(name, ROOT)))
    print("canvas page size: %.1f x %.1f pt" % (doc[0].rect.width, doc[0].rect.height))
    doc.close()
    print("\n--- foreign pairs (depth, dx, dy, text, ink window, box) ---")
    for t in found:
        print("  %.1f  %.1f %.1f  %r  box=%.0fx%.0fpt" % (t[0], t[1], t[2], t[3][:34],
                                                           t[5][2] - t[5][0], t[5][3] - t[5][1]))
    print("--- ink-on-ink pairs ---")
    for t in both:
        print("  %.1f  dx%.1f dy%.1f  %r x %r" % (t[0], t[1], t[2], t[3][:24], t[4][:24]))
    print("\n--- emitted canvas ---")
    print(block)
    return 0


if __name__ == "__main__":
    sys.exit(main())
