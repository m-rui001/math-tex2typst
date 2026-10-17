r"""Re-measure this family's geometry from TeX and compare it with what cetz.py now computes.

Every case is compiled by pdflatex in the SAME tikzpicture that carries two reference axes reaching
10 picture units, so the path items are read back in the WRITTEN units (`pdfpaths.measure`). The
canvas works in those units too before its picture transform, which is affine, so a cubic piece
measured here is comparable with `cetz.smooth_curve` on the written knots directly.

A PDF curveto item reads (start, control 1, control 2, stop); a canvas bezier call is
(start, stop, control 1, control 2).

Run: python _work/pic-plot/meas/verify_family.py
"""
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from pdfpaths import measure, pieces  # noqa: E402
from t2t import cetz  # noqa: E402

TOL = 5e-4  # the reading is exact to the fifth decimal; anything larger is a different law
PDF_ORDER = (0, 2, 3, 1)  # pdf (start,c1,c2,stop) -> canvas order (start,stop,c1,c2)
fails = []


def report(name, ok, detail):
    print("%-14s %s%s" % (name, "OK  " if ok else "FAIL ", detail))
    if not ok:
        fails.append(name)


def worst_offset(got, want):
    """The largest coordinate difference between pdf pieces and computed pieces, point by point."""
    if len(got) != len(want):
        return 9.0, "%d pdf pieces vs %d computed" % (len(got), len(want))
    worst = 0.0
    for pdf, piece in zip(got, want):
        for k in range(4):
            p, q = pdf[k], piece[PDF_ORDER[k]]
            worst = max(worst, abs(p[0] - q[0]), abs(p[1] - q[1]))
    return worst, "%d pieces" % len(got)

def check_pieces(name, knots, tension=0.5, smooth="smooth"):
    """TeX's cubic pieces for `plot[%s]` on `knots` vs smooth_curve's.`""" % smooth
    body = r"\draw[blue,very thick] plot[%s%s] coordinates {%s};" % (
        smooth, "" if tension == 0.5 else ",tension=%g" % tension,
        " ".join("(%g,%g)" % p for p in knots))
    got = pieces("verify_" + name, body)
    worst, detail = worst_offset(got, cetz.smooth_curve(knots, tension))
    report(name, worst <= TOL, "%s, worst offset %.6f units" % (detail, worst))


K5 = [(0, 0), (1, 1), (2, 0), (3, 1), (4, 0)]
HONEY_A = [(-1.1, -0.7), (-0.7, -0.5), (-0.9, 0), (-0.3, 0.3), (0, 0),
           (0.5, 0.3), (0.2, 0.8), (0.8, 0.9), (1.1, 0.5)]
HONEY_B = [(-1.1, -1.5), (-0.5, -0.8), (-0.6, 0), (0.1, 0.1), (0.8, 0.35), (0.6, 0.9), (1.1, 1.4)]
AT_A = [(0, 0.8), (1, 1.15), (2, 0.9), (3, 1.35), (4, 1.0), (5, 1.2), (6, 0.9)]
AT_B = [(0, 2.7), (1, 2.35), (2, 2.55), (3, 2.1), (4, 2.45), (5, 2.3), (6, 2.7)]
AT_C = [(0, 0.6), (1, 0.9), (2, 0.75), (3, 1.05), (4, 0.8), (6, 0.65)]
AT_D = [(0, 3.45), (1, 3.1), (2, 3.3), (3, 3.0), (4, 3.25), (6, 3.4)]

check_pieces("p5_default", K5)
check_pieces("p5_tension1", K5, 1.0)
check_pieces("p5_tension2", K5, 2.0)
check_pieces("knots3", [(0, 0), (1, 1), (2, 0)])
# two knots have no interior knot to hold a support for, so TeX draws a straight line rather than a
# curveto; the single piece `smooth_curve` answers with is the same segment traced as a cubic
two = measure("verify_knots2", r"\draw[blue,very thick] plot[smooth] coordinates {(0,0) (1,1)};")
two_l = [it for col, kind, it in two if kind == "l" and col and col[2] == 1.0]
a, b, c1, c2 = cetz.smooth_curve([(0, 0), (1, 1)])[0]
# the two ends carry no support, so the one piece this knot pair produces is the straight segment
# itself with both controls on it -- the same stroke TeX draws as a plain line
report("knots2_line", len(two_l) == 1
       and max(abs(u - v) for p, q in ((two_l[0][0], a), (two_l[0][1], b), (c1, a), (c2, b))
               for u, v in zip(p, q)) <= TOL,
       "pdf line (%.4f,%.4f)->(%.4f,%.4f), computed piece %s" % (
           two_l[0][0][0], two_l[0][0][1], two_l[0][1][0], two_l[0][1][1],
           ["(%.4f,%.4f)" % p for p in (a, b, c1, c2)]))
check_pieces("honey_a", HONEY_A)
check_pieces("honey_b", HONEY_B)
check_pieces("at_a", AT_A)
check_pieces("at_b", AT_B)
check_pieces("at_c", AT_C)
check_pieces("at_d", AT_D)

# does a written value on `smooth` itself move the curve? TeX says no (law_smoothvalue), so the
# emitter must keep tension at its default -- re-measured here against tension=0.5
body = r"\draw[blue,very thick] plot[smooth=2] coordinates {%s};" % " ".join(
    "(%g,%g)" % p for p in K5)
worst, detail = worst_offset(pieces("verify_smoothvalue", body), cetz.smooth_curve(K5, 0.5))
report("smoothvalue", worst <= TOL, "%s, worst offset %.6f units" % (detail, worst))

# `smooth` on a sampled function: does TeX curve through the samples with the same law?
fn_body = r"\draw[blue,very thick] plot[smooth,domain=0:2,samples=5] (\x,{1+0.4*\x*\x});"
fn_knots = [(i * 0.5, 1 + 0.4 * (i * 0.5) ** 2) for i in range(5)]
worst, detail = worst_offset(pieces("verify_fn_smooth", fn_body), cetz.smooth_curve(fn_knots))
report("fn_smooth", worst <= TOL, "%s, worst offset %.6f units" % (detail, worst))

# the refused hard-sphere plot: 70 samples of `tanh` joined by straight pieces
plot = r"\draw[blue,line width=1.1pt] plot[domain=-2.2:2.2,samples=70] ({5+\x},{5+.23*tanh(1.35*\x)});"
drawn = measure("verify_fn70", plot)
lines = [it for col, kind, it in drawn if kind == "l" and col and col[2] == 1.0]
curves = [it for col, kind, it in drawn if kind == "c" and col and col[2] == 1.0]
pts = [it[0] for it in lines] + [lines[-1][1]] if lines else []
report("fn70_count", len(lines) == 69 and len(pts) == 70,
       "%d pdf line items -> %d knots" % (len(lines), len(pts)))
report("fn70_straight", not curves, "%d cubic pieces (none expected)" % len(curves))
if len(pts) == 70:
    lo, hi, n = -2.2, 2.2, 70
    # the knots the emitter must produce, read from its own reader rather than hand-fed
    got = cetz.plot_points(r" plot[domain=-2.2:2.2,samples=70] "
                           r"({5+\x},{5+.23*tanh(1.35*\x)});", 0, {}, cetz.IDENT,
                           {"domain": "-2.2:2.2", "samples": "70"})
    if got is None:
        report("fn70_points", False, "plot_points refused the operand")
    else:
        em, worst = list(got[0]), 0.0
        for p, q in zip(pts, em):
            worst = max(worst, abs(p[0] - q[0]), abs(p[1] - q[1]))
        report("fn70_points", worst <= TOL and len(em) == 70,
               "worst sample offset %.6f units over %d emitted knots" % (worst, len(em)))
        steps = [pts[i + 1][0] - pts[i][0] for i in range(69)]
        report("fn70_step", max(abs(s - (hi - lo) / 69) for s in steps) <= 1e-4,
               "first step %.6f, last %.6f, (hi-lo)/(n-1) = %.6f"
               % (steps[0], steps[-1], (hi - lo) / 69))
        # TeX's own tanh, read off the first sample rather than trusted from python
        report("fn70_tanh", abs((pts[0][1] - 5) / 0.23 - cetz.math.tanh(1.35 * -2.2)) <= TOL,
               "TeX tanh(-2.97) = %.6f, python %.6f"
               % ((pts[0][1] - 5) / 0.23, cetz.math.tanh(-2.97)))

# `smooth cycle` follows a different law (its end knots keep a support), so it stays refused
cycle = [(0, 0), (1, 1), (2, 0), (1, -1)]
cyc = pieces("verify_cycle", r"\draw[blue,very thick] plot[smooth cycle] coordinates {%s};"
             % " ".join("(%g,%g)" % p for p in cycle))
open_pieces = cetz.smooth_curve(cycle)
worst, detail = worst_offset(cyc, open_pieces)
report("cycle_differs", len(cyc) == 4 and worst > TOL,
       "%s, worst offset %.6f units -> refused on purpose" % (detail, worst))
got = cetz.plot_points(r" plot[smooth cycle] coordinates {(0,0) (1,1) (2,0) (1,-1)};",
                       0, {}, cetz.IDENT, {})
report("cycle_refused", got is None, "plot_points returns %r" % (got,))

# a chain: the point the path stood on before a `smooth` plot must not be joined to it
chain = measure("verify_chain",
                r"\draw[red,very thick] (4,4) -- (5,3) plot[smooth] coordinates "
                r"{(6,3) (7,4) (8,3) (9,4)};", "")
chain_c = [it for col, kind, it in chain if kind == "c" and col and abs(col[0] - 1.0) < 0.05]
report("chain_pieces", len(chain_c) == 3, "%d cubic pieces for 4 knots" % len(chain_c))
got = cetz.plot_points(r" plot[smooth] coordinates {(6,3) (7,4) (8,3) (9,4)};", 0, {},
                       cetz.IDENT, {})
worst, detail = worst_offset(chain_c, got[2])
report("chain_law", worst <= TOL, "%s, worst offset %.6f units" % (detail, worst))

print("\n%d failures: %s" % (len(fails), fails))
