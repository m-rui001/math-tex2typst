r"""What does a Typst node frame look like in the PDF, item by item?

`is_frame` has to accept the frame the emitter actually draws -- the control picture is the one that
says so. Print every stroked path's item types, segment endpoints and rects for the control canvas and
for a couple of products' canvases.
"""
import os
import sys

import fitz

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import probe81_label_box_face as P  # noqa: E402
from t2t import cetz  # noqa: E402


def dump(pdf, label):
    doc = fitz.open(pdf)
    print("== %s" % label)
    for d in doc[0].get_drawings():
        if d.get("color") is None:
            continue
        r = d["rect"]
        if not (P.MIN_W <= r.width <= P.MAX_W and 2 < r.height <= P.MAX_H):
            continue
        kinds = [i[0] for i in d["items"]]
        print("  rect %.1fx%.1f  items=%s  w=%s" % (r.width, r.height, kinds, d.get("width")))
        for i in d["items"][:6]:
            pts = " ".join("%.2f,%.2f" % (p.x, p.y) for p in i[1:] if hasattr(p, "x"))
            print("     %s  %s" % (i[0], pts))
    doc.close()


def main():
    pic = (r"\begin{tikzpicture}"
           r"\node[draw, minimum width=2cm, minimum height=0.8cm] (a) at (0,0) {BOXED};"
           r"\node at (1.15, 0.30) {INVADES};"
           r"\end{tikzpicture}")
    canvas = cetz.build(cetz.strip_envelope(pic))
    P.render(canvas, "ctlframe")
    dump(os.path.join(P.TMP, "ctlframe.pdf"), "control node[draw]")

    canv = P.canvases()
    want = ("Finite-cylinder", "Spontaneous-magnetization")
    got = 0
    for (stem, k), (head, block) in sorted(canv.items()):
        if not stem.startswith(want):
            continue
        name = "fr_%d" % got
        if P.render(block, name, head):
            dump(os.path.join(P.TMP, name + ".pdf"), "%s#%d" % (stem[:40], k))
        got += 1
        if got >= 2:
            return


if __name__ == "__main__":
    main()
