r"""Confirm the measured law for pgf's `smooth` spline, and that it also covers sampled plots.

Control cases, each differing from the next in exactly one feature:
  * two, three and four knots (does an end knot carry a support?),
  * one coordinate added to the end of the list (does the previous piece change?),
  * knots at irregular spacing and height (is the law anything but the neighbour vector?),
  * `tension=1` instead of the default (the scale `\pgfsetplottension` applies),
  * a value written on `smooth` itself,
  * `plot[smooth,domain=,samples=]` (does the handler see sampled points the same way?),
  * a sampled plot without `smooth` (straight pieces, and how many).

Run: python _work/pic-plot/meas/measure_law.py
"""
import math
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from pdfpaths import measure  # noqa: E402

T_DEFAULT = 0.2775 * 0.5


def predicted(pts, t=T_DEFAULT):
    """(start, control 1, control 2, stop) per piece -- the order a PDF curveto item lists them."""
    n = len(pts)

    def move(p, d, k):
        return (p[0] + k * d[0], p[1] + k * d[1])
    out = []
    for i in range(n - 1):
        a, b = pts[i], pts[i + 1]
        c1 = a if i == 0 else move(a, (b[0] - pts[i - 1][0], b[1] - pts[i - 1][1]), t)
        c2 = b if i + 2 == n else move(b, (pts[i + 2][0] - a[0], pts[i + 2][1] - a[1]), -t)
        out.append((a, c1, c2, b))
    return out


def curves(name, plot, extra=""):
    """The cubic segments and the straight segments of the drawn (non-axis) path, in picture units."""
    paths = [(col, kind, pts) for col, kind, pts in measure(name, plot, extra)
             if not (col and abs(col[0]) < 0.05 and abs(col[1] - 0.6) < 0.05)]
    return ([pts for _, kind, pts in paths if kind == "c"],
            [pts for _, kind, pts in paths if kind == "l"])


def cmp(name, plot, pts, t=T_DEFAULT, extra=""):
    got, lines = curves(name, plot, extra)
    want = predicted(pts, t)
    ok = len(got) == len(want) and all(
        abs(a - b) < 2e-4 for seg, exp in zip(got, want) for p, q in zip(seg, exp)
        for a, b in zip(p, q))
    print("%-16s %2d curves, %2d lines  match=%s" % (name, len(got), len(lines), ok))
    if not ok:
        for seg, exp in zip(got, want):
            print("   measured ", [" (%.4f,%.4f)" % p for p in seg])
            print("   predicted", [" (%.4f,%.4f)" % p for p in exp])
        for l in lines:
            print("   line     ", [" (%.4f,%.4f)" % p for p in l])
    return got


if __name__ == "__main__":
    p4 = [(0, 0), (1, 1), (2, 0), (3, 1)]
    p5 = p4 + [(4, 0)]
    p6 = p4 + [(4, 0), (5, 0.5)]
    p_irr = [(0.2, 0.3), (1.7, 2.4), (3.2, 1.1), (4.4, 2.9), (6.1, 0.8), (7.9, 2.2)]
    honey = [(-1.1, -0.7), (-0.7, -0.5), (-0.9, 0), (-0.3, 0.3), (0, 0),
             (0.5, 0.3), (0.2, 0.8), (0.8, 0.9), (1.1, 0.5)]
    smooth = r"\draw[blue,very thick] plot[smooth] coordinates %s;"
    coords = lambda pts: "{%s}" % " ".join("(%g,%g)" % p for p in pts)  # noqa: E731

    cmp("law_2", smooth % coords([(0, 0), (1, 1)]), [(0, 0), (1, 1)])
    cmp("law_3", smooth % coords([(0, 0), (1, 1), (2, 0)]), [(0, 0), (1, 1), (2, 0)])
    cmp("law_p4", smooth % coords(p4), p4)
    cmp("law_p5", smooth % coords(p5), p5)
    cmp("law_p6", smooth % coords(p6), p6)
    cmp("law_irr", smooth % coords(p_irr), p_irr)
    cmp("law_honey", smooth % coords(honey), honey)
    cmp("law_tension", r"\draw[blue,very thick] plot[smooth,tension=1] coordinates "
        "{(0,0) (1,1) (2,0) (3,1) (4,0)};", p5, t=0.2775 * 1.0)
    cmp("law_smoothvalue", r"\draw[blue,very thick] plot[smooth=2] coordinates "
        "{(0,0) (1,1) (2,0) (3,1) (4,0)};", p5)

    # does the spline reach its own first and last knot, and how does a path join it?
    join = (r"\draw[blue,very thick] (-1,-1) -- (0,0) plot[smooth] coordinates "
            r"{(1,1) (2,0) (3,1)} -- (4,0);")
    curved, lines = curves("sm_after", join)
    print("sm_after lines:", [" (%.3f,%.3f)->(%.3f,%.3f)" % (l[0] + l[1]) for l in lines])
    for c in curved:
        print("sm_after curve:", [" (%.3f,%.3f)" % p for p in c])

    # a sampled function plot: 70 samples joined by straight pieces, none by a curve
    fn = r"\draw[blue,line width=1.1pt] plot[domain=-2.2:2.2,samples=70] " \
         r"({5+\x},{5+.23*tanh(1.35*\x)});"
    curved, lines = curves("fn70", fn)
    print("samples=70 -> %d line pieces, %d curve pieces" % (len(lines), len(curved)))
    first, last = lines[0][0], lines[-1][-1]
    print("  ends (%.4f, %.4f) (%.4f, %.4f)" % (first + last))
    print("  first y-5 = %.6f  0.23*tanh(-2.97) = %.6f" % (first[1] - 5, 0.23 * math.tanh(-2.97)))
    print("  step=%.6f  4.4/69=%.6f" % (lines[1][0][0] - lines[0][0][0], 4.4 / 69))

    # does `smooth` run the samples through the same curveto handler?
    fns = r"\draw[blue,very thick] plot[smooth,domain=0:2,samples=5] (\x,{1+0.4*\x*\x});"
    got, lines = curves("smooth_samples", fns)
    knots = [(0.5 * i, 1 + 0.4 * (0.5 * i) ** 2) for i in range(5)]
    print("smooth samples=5 -> %d curves, %d lines" % (len(got), len(lines)))
    ok = all(abs(a - b) < 2e-4 for seg, exp in zip(got, predicted(knots))
             for p, q in zip(seg, exp) for a, b in zip(p, q))
    print("  match=%s" % ok)
