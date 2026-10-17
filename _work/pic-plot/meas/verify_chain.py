r"""Two behaviours the emitter relies on, measured rather than assumed.

`sm_join`: TeX starts a `plot[smooth]` as its own subpath, so the point the path stood on before is
   left unjoined -- if a line were drawn to the spline, the canvas must not draw one either.
`scope_smooth`: `smooth` written on the `\draw` instead of on the `plot` still curves, so reading it
   from the statement's option list is what TeX does.

Run: python _work/pic-plot/meas/verify_chain.py
"""
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from pdfpaths import measure  # noqa: E402

KNOTS = r"{(6,3) (7,4) (8,3) (9,4)}"

# 1. the join: does a stroke run from (5,3), where the path stood, to the spline's first knot (6,3)?
drawn = measure("verify_sm_join",
                r"\draw[red,very thick] (4,4) -- (5,3) plot[smooth] coordinates " + KNOTS + ";")
red = [(k, p) for col, k, p in drawn if col and abs(col[0] - 1.0) < 0.05 and col[2] < 0.05]
lines = [p for k, p in red if k == "l"]
# the one line TeX leaves behind is (4,4)--(5,3); a second line starting there would be the join
joined = any(abs(a[0] - 5.0) < 1e-3 and abs(a[1] - 3.0) < 1e-3 and
             abs(b[0] - 6.0) < 1e-3 and abs(b[1] - 3.0) < 1e-3 for a, b in lines)
print("stroke items:", [k for k, _ in red])
print("line items:", [["(%.3f,%.3f)" % q for q in p] for p in lines])
print("sm_join      %s -- the path point (5,3) is %s to the spline" %
      ("OK  " if not joined and len(lines) == 1 else "FAIL",
       "NOT joined" if not joined else "joined"))

# 2. `smooth` on the \draw rather than on the plot
drawn = measure("verify_scope_smooth",
                r"\draw[blue,very thick,smooth] plot coordinates " + KNOTS + ";")
c = [(k, p) for col, k, p in drawn if col and col[2] == 1.0 and k == "c"]
print("scope_smooth %s -- %d cubic pieces" % ("OK  " if len(c) == 3 else "FAIL", len(c)))
for _, p in c:
    print("      ", ["(%.4f,%.4f)" % q for q in p])

# 3. tension=0 collapses every support, so the spline is the knot polyline itself
drawn = measure("verify_tension0",
                r"\draw[blue,very thick] plot[smooth,tension=0] coordinates " + KNOTS + ";")
strokes0 = [(k, p) for col, k, p in drawn if col and col[2] == 1.0]
knots = [(6, 3), (7, 4), (8, 3), (9, 4)]


def near(p, q):
    return abs(p[0] - q[0]) < 1e-3 and abs(p[1] - q[1]) < 1e-3


# a line piece is knot to knot; a curveto is allowed only if both of its controls sit on their own
# end, which is the same straight stroke written another way
ok = len(strokes0) == 3 and all(
    near(p[0], knots[i]) and near(p[-1], knots[i + 1])
    and (kind == "l" or (kind == "c" and near(p[1], p[0]) and near(p[2], p[3])))
    for i, (kind, p) in enumerate(strokes0))
print("tension0     %s -- %d pieces %s" % ("OK  " if ok else "FAIL", len(strokes0),
                                           [(k, ["(%.3f,%.3f)" % q for q in p])
                                            for k, p in strokes0]))

# 4. `tension=` written on the `\draw` rather than on the `plot`: the emitter reads plot options off
#    the statement too (as it already does for `domain=`), so this has to be the same curve
drawn = measure("verify_scope_tension",
                r"\draw[blue,very thick,tension=1] plot[smooth] coordinates " + KNOTS + ";")
c = [p for col, k, p in drawn if col and col[2] == 1.0 and k == "c"]
first = c and abs(c[0][2][0] - 6.445) < 1e-3 and abs(c[0][2][1] - 4.0) < 1e-3
print("scope_tension %s -- %d pieces, first piece %s (tension=1 puts c2 at 6.445,4)"
      % ("OK  " if len(c) == 3 and first else "FAIL", len(c),
         ["(%.4f,%.4f)" % q for q in c[0]] if c else "-"))
