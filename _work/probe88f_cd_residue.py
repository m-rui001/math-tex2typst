"""What is left on the one tikzcd face canvas after the script-size label rule?

`probe88e` rebuilds `Global-quantum-geometric-Langlands-at-irrational-level…#0` with the live
`build_cd` and reads its over-3pt on-ink pairs down from 7 to 1 (the `'N'` at 4.08pt).  Before the
regen that residue has to be named, not handed to the batch as an assumption: this prints the pair's
own two boxes, the statements whose coordinates straddle them, and the same for the product on disk.

The text is matched the way `probe88` matches it (NFKD then space-stripped), because our page emits
Unicode math alphanumerics where the census texts are ASCII.

  python _work/probe88f_cd_residue.py
"""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
sys.path.insert(0, WORK)
sys.path.insert(0, os.path.join(ROOT, "tools"))
import probe81_label_box_face as g  # noqa: E402
import probe84_control_face as C  # noqa: E402
import probe87_onink_mechanism as M  # noqa: E402
from t2t import cetz  # noqa: E402

DEPTH = 3.0
STEM = "Global-quantum-geometric-Langlands-at-irrational-level"


def main():
    canvases = g.canvases()
    hits = [(stem, k) for (stem, k) in M.face_canvases() if stem.startswith(STEM)]
    if not hits:
        print("no face canvas matching %r" % STEM)
        return 1
    stem, k = hits[0]
    path, pics = C.pictures(stem)
    head, block = canvases[(stem, k)]
    print("=== %s#%d" % (stem, k))
    print("-- source picture --")
    print(pics[k].strip()[:1500])
    rebuilt = cetz.convert(pics[k], refs=None)
    print("\n-- rebuilt canvas --")
    print(rebuilt)
    for kind, canvas in (("product", block), ("rebuilt", rebuilt)):
        got = g.render(canvas, "88f", head)
        if not got:
            print("\n%s: typst refused" % kind)
            continue
        rects, ink, pdf = got
        found, both = g.decide(pdf, rects, ink)
        print("\n-- %s: over-%.1fpt on-ink pairs --" % (kind, DEPTH))
        for t in both:
            if t[0] <= DEPTH:
                continue
            depth, dx, dy, t1, t2, window, b1, b2 = t[:8]
            print("  %.2f  dx%5.2f dy%5.2f  %r x %r" % (depth, dx, dy, t1, t2))
            print("      box1=(%.1f,%.1f,%.1f,%.1f) w%.1f h%.1f"
                  % (b1.x0, b1.y0, b1.x1, b1.y1, b1.width, b1.height))
            print("      box2=(%.1f,%.1f,%.1f,%.1f) w%.1f h%.1f"
                  % (b2.x0, b2.y0, b2.x1, b2.y1, b2.width, b2.height))
    return 0


if __name__ == "__main__":
    sys.exit(main())
