r"""Does the script-size label rule clear the exchange-diagram collisions it was priced against?

Rebuilds each face canvas from its own source picture with the live `build_cd`, renders it through
the census's own gauge, and reads the >3pt on-ink pairs against what the product on disk carries.
This is the pre-flight for the regen: the products are the number that has to move, but a 51-paper
batch should not start before the rule is seen to work on the one canvas that motivated it.

The rebuild goes through `cetz.convert` with no reference book, so an `\eqref` in a label comes out
`??` where the product carries `(12.1)` -- one character of width, which is why the pair count, not
the depth, is the reading.

  python _work/probe88e_cd_rebuilt_face.py
"""
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
sys.path.insert(0, WORK)
sys.path.insert(0, os.path.join(ROOT, "tools"))
import probe81_label_box_face as g  # noqa: E402
import probe84_control_face as C  # noqa: E402
import probe87_onink_mechanism as M  # noqa: E402
import probe87b_control_identity as I  # noqa: E402
from t2t import cetz  # noqa: E402

DEPTH = 3.0
CD_ENVS = ("tikzcd", "CD")


def main():
    canvases = g.canvases()
    for (stem, k), rows in sorted(M.face_canvases().items()):
        path, pics = C.pictures(stem)
        if not pics or k >= len(pics) or I.env_of(pics[k]) not in CD_ENVS:
            continue
        head, block = canvases[(stem, k)]
        rebuilt = cetz.convert(pics[k], refs=None)
        print("\n=== %s#%d  env=%s" % (stem[:46], k, I.env_of(pics[k])))
        for kind, canvas in (("product", block), ("rebuilt", rebuilt)):
            if not canvas:
                print("  %-8s refused" % kind)
                continue
            got = g.render(canvas, "88e", head)
            if not got:
                print("  %-8s typst refused" % kind)
                continue
            found, both = g.decide(got[2], *got[:2])
            deep = [t for t in both if t[0] > DEPTH]
            print("  %-8s on-ink %d pairs, %d over %.1fpt  %s"
                  % (kind, len(both), len(deep), DEPTH,
                     "  ".join("%.2f %r" % (t[0], t[3][:12]) for t in deep[:4])))
        print("  face rows from the census: %d" % len(rows))
    return 0


if __name__ == "__main__":
    sys.exit(main())
