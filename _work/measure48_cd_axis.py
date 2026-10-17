r"""Which way does OUR canvas point -- is CeTz's y up or down, and does that put our CD labels on
tikz-cd's side of the arrow?

`measure48_cd_bend.py` reads tikz-cd itself: a plain label hangs to the LEFT of travel (above a
rightward arrow), a `'` swaps it to the right, a `bend left` bulges left, and a hook's barb curls left.
Our converter had each of those on the opposite side, which is either a real inversion in `build_cd` or
an artifact of a probe assuming the canvas y grows upward.  The two are told apart here by drawing our
own canvas with Typst and reading the page back: on the page there is no ambiguity about which way is
up, and no basis question either -- every number below is a distance from the arrow's own line, on that
line's own side convention.

Printed in PDF points with y GROWING DOWNWARD, so "above on the page" is a smaller number.  A cell's
letter reaches the page as a mathematical glyph (A is U+1D434), so names are compared after NFKD.
"""
import io
import math
import os
import subprocess
import sys
import unicodedata

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace", newline="")
from t2t import cetz  # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))
TMP = os.path.join(HERE, "_m48axis")
HEAD = ('#import "@preview/cetz:0.5.0"\n'
        '#set page(width: 12cm, height: 8cm)\n')


def drawn_page(canvas, name):
    os.makedirs(TMP, exist_ok=True)
    tex = os.path.join(TMP, name + ".typ")
    open(tex, "w", encoding="utf-8").write(HEAD + canvas + "\n")
    subprocess.run(["typst", "compile", "--root", ROOT, name + ".typ"], cwd=TMP, capture_output=True)
    doc = fitz.open(os.path.join(TMP, name + ".pdf"))
    page = doc[0]
    segs, cubics = [], []
    for d in page.get_drawings():
        for item in d["items"]:
            if item[0] == "l" and len(d["items"]) == 1:
                segs.append(((item[1].x, item[1].y), (item[2].x, item[2].y)))
            elif item[0] == "c":
                cubics.append([(p.x, p.y) for p in item[1:]])
    words = [(unicodedata.normalize("NFKD", w[4]), fitz.Rect(w[:4]))
             for w in page.get_text("words")]
    doc.close()
    return segs, cubics, words


def centre(box):
    return ((box.x0 + box.x1) / 2, (box.y0 + box.y1) / 2)


def side(point, a, b):
    """Which side of the travel a -> b the page puts `point`, and how far: LEFT or RIGHT, pt."""
    vx, vy = b[0] - a[0], b[1] - a[1]
    n = math.hypot(vx, vy)
    if not n:
        return "--", 0.0
    cross = (point[0] - a[0]) * (vy / n) - (point[1] - a[1]) * (vx / n)
    # on a y-DOWN page a positive cross product of that shape is the LEFT of travel
    return ("LEFT" if cross > 0 else "RIGHT"), abs(cross)


def cubic_at(c, t):
    u = 1 - t
    return tuple(u ** 3 * c[0][i] + 3 * u * u * t * c[1][i] + 3 * u * t * t * c[2][i]
                 + t ** 3 * c[3][i] for i in (0, 1))


def main():
    body = ('[row sep=1.7cm,column sep=2cm]A \\arrow[r,"f"] \\arrow[dr,bend left=30,"g"] '
            '\\\\ & B')
    core = cetz.strip_envelope("\\begin{tikzcd}" + body + "\\end{tikzcd}")
    canvas = cetz.build_cd(core)
    print("== the canvas build_cd emits for `A ->[f] \\ar[dr,bend left=30,'g'] ; row 2 has B`")
    print(canvas)
    segs, cubics, words = drawn_page(canvas, "axis")
    print("== the page it draws (PDF points, y grows DOWN)")
    for txt, r in words:
        print("   ink    %-4s centre (%.2f, %.2f)" % (txt, centre(r)[0], centre(r)[1]))
    for p, q in segs:
        print("   line   (%.2f, %.2f) -> (%.2f, %.2f)  length %.2f"
              % (p[0], p[1], q[0], q[1], math.hypot(q[0] - p[0], q[1] - p[1])))
    for c in cubics:
        print("   cubic  (%.2f, %.2f) -> (%.2f, %.2f)  chord %.2f"
              % (c[0][0], c[0][1], c[3][0], c[3][1], math.hypot(c[3][0] - c[0][0],
                                                                c[3][1] - c[0][1])))
    if not segs:
        print("   nothing drawn -- the canvas did not compile")
        return
    shaft = next(((p, q) for p, q in segs if abs(p[1] - q[1]) < 0.5), None)
    f = next((r for txt, r in words if txt == "f"), None)
    if shaft and f:
        where, d = side(centre(f), *shaft)
        print("   horizontal arrow `->` carries `f` on the %s, %.2fpt (%.3fcm) off its shaft"
              % (where, d, d * 0.0352778))
    if cubics:
        c = max(cubics, key=lambda s: math.hypot(s[3][0] - s[0][0], s[3][1] - s[0][1]))
        apex = cubic_at(c, 0.5)
        where, d = side(apex, c[0], c[3])
        print("   `bend left=30` bulges to the %s of travel, %.2fpt (%.3fcm) at its middle"
              % (where, d, d * 0.0352778))
        g = next((r for txt, r in words if txt == "g"), None)
        if g:
            # the label's side is read against the curve's own tangent at the apex, as on page
            dx, dy = c[3][0] - c[0][0], c[3][1] - c[0][1]
            n = math.hypot(dx, dy)
            where, d = side(centre(g), apex, (apex[0] + dx / n, apex[1] + dy / n))
            print("              its label `g` hangs on the %s of the curve, %.3fcm from the apex"
                  % (where, d * 0.0352778))
    a = next((r for txt, r in words if txt == "A"), None)
    b = next((r for txt, r in words if txt == "B"), None)
    if a and b:
        print("   row order: A centre y %.2f, B centre y %.2f -> %s"
              % (centre(a)[1], centre(b)[1],
                 "A above B (tikzcd's order)" if centre(a)[1] < centre(b)[1]
                 else "A BELOW B (flipped)"))


if __name__ == "__main__":
    main()
