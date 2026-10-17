r"""Read the emitted loop against the numbers pdflatex wrote down for the same statements.

`_work/pic-shapes/measure_loop.py` dumps pgf's own control points for five loop shapes; this builds
the same picture through the emitter and prints the `bezier`/`content` calls side by side, so the
law is priced on the page before any of it ships.
"""
import io
import re
import sys

sys.path.insert(0, "E:/math/tools")
from t2t import cetz  # noqa: E402

# pgf's readings, in canvas cm, from _work/pic-shapes/loop98b.txt, written in the order the emitter
# puts them: `bezier(start, end, control-from-start, control-from-end)`
WANT = {
    "coord_loop_above": ((0, 0), (0, 0), (-0.1294, 0.4830), (0.1294, 0.4830)),
    "coord_loop": ((0, 0), (0, 0), (0.3536, 0.3536), (-0.3536, 0.3536)),
    "coord_loop_below": ((0, 0), (0, 0), (0.1294, -0.4830), (-0.1294, -0.4830)),
    "coord_loop_left": ((0, 0), (0, 0), (-0.4830, -0.1294), (-0.4830, 0.1294)),
    "coord_loop_right": ((0, 0), (0, 0), (0.4830, 0.1294), (0.4830, -0.1294)),
    "textnode_loop_above": ((-0.0654, 0.2443), (0.0654, 0.2443),
                             (-0.1949, 0.7272), (0.1949, 0.7272)),
    "textnode_loop_right": ((0.2590, 0.0694), (0.2590, -0.0694),
                            (0.7419, 0.1988), (0.7419, -0.1988)),
    "circle_loop_above": ((-0.1053, 0.3932), (0.1053, 0.3932),
                          (-0.2754, 1.0280), (0.2754, 1.0280)),
    "box_loop_above": ((-0.1090, 0.4070), (0.1090, 0.4070),
                       (-0.2852, 1.0644), (0.2852, 1.0644)),
    "circle_loop_above_l4": ((-0.1053, 0.3932), (0.1053, 0.3932),
                             (-0.1904, 0.7106), (0.1904, 0.7106)),
}
# a rectangle's border anchor sits half the pgf rule (0.0070cm) OUTSIDE the ink box the emitter
# measures -- every clipped segment shares that gap and this round does not touch it -- and a loop
# reads it twice over: once in the anchor and once through the control distance, which is 8 x 0.39 x
# the chord, so the 0.0070 becomes 0.0184.  That one case is priced against its own known cause; the
# rest of the table answers at the emitter's own %.4g precision.
TOL = 0.0075
GAP = {"box_loop_above": (0.019, "0.0070cm 1/2-rule border gap, amplified by looseness 8")}

CASES = {
    "coord_loop_above": r"\draw (0,0) to[loop above] (0,0);",
    "coord_loop": r"\draw (0,0) to[loop] (0,0);",
    "coord_loop_below": r"\draw (0,0) to[loop below] (0,0);",
    "coord_loop_left": r"\draw (0,0) to[loop left] (0,0);",
    "coord_loop_right": r"\draw (0,0) to[loop right] (0,0);",
    "textnode_loop_above": r"\node (R) at (0,0) {$R$}; \draw[->] (R) to[loop above] (R);",
    "textnode_loop_right": r"\node (R) at (0,0) {$R$}; \draw[->] (R) to[loop right] (R);",
    "circle_loop_above": r"\node[slot] (six) at (0,0) {$6$}; \draw (six) to[loop above] (six);",
    "box_loop_above": r"\node[box] (six) at (0,0) {$6$}; \draw (six) to[loop above] (six);",
    "circle_loop_above_l4": r"\node[slot] (six) at (0,0) {$6$}; "
                            r"\draw (six) to[loop above,looseness=4] (six);",
}

STYLE = ("x=1cm,y=1cm,"
         "slot/.style={circle,minimum size=8mm,inner sep=2pt,font=\\small},"
         "box/.style={rectangle,minimum size=8mm,inner sep=2pt,font=\\small}")

PAIR = re.compile(r"\((-?[\d.]+), (-?[\d.]+)\)")


def main():
    out = io.open("E:/math/_work/label98_loop_build.txt", "w", encoding="utf-8", newline="\n")
    worst = 0.0
    errs = {}
    for name, body in CASES.items():
        canvas = cetz.build(r"\begin{tikzpicture}[%s]%s\end{tikzpicture}" % (STYLE, body))
        got = None
        for line in canvas.splitlines():
            if line.strip().startswith("bezier"):
                got = tuple(tuple(map(float, p)) for p in PAIR.findall(line.split("stroke:")[0]))
                break
        if got is None:
            out.write("%-22s NO BEZIER  %s\n" % (name, canvas.strip()))
            continue
        want = WANT[name]
        err = max(abs(g - w) for gp, wp in zip(got, want) for g, w in zip(gp, wp))
        errs[name] = err
        tol, why = GAP.get(name, (TOL, ""))
        if name not in GAP:
            worst = max(worst, err)
        out.write("%-22s %s err %.4f%s\n     got  %s\n     want %s\n"
                  % (name, "ok" if err <= tol else "FAIL", err,
                     "  (tol %.4f: %s)" % (tol, why) if name in GAP else "", got, want))
    out.write("worst %.4f cm over %d cases at tolerance %.4f\n"
              % (worst, len(CASES) - len(GAP), TOL))
    out.write("priced gap: %s\n\n" % ", ".join(
        "%s err %.4f <= %.4f (%s)" % (k, errs.get(k, float("nan")), GAP[k][0], GAP[k][1])
        for k in GAP))
    # the two papers' own statements, in full, so the label's landing point can be read off the same
    # page the pdflatex control draws
    for stem, body in (("Finite-algebraic-envelopes",
                        r"\node (L) at (3,0) {$L$}; \draw[->] (L) to[loop above] node[above] {$b_L$} (L);"),
                       ("Arithmetic-classification",
                        r"\node (z) at (0,0) {$z$}; \draw[->] (z) edge[loop above] node {$0$} (z);")):
        out.write("== %s\n%s\n" % (stem, cetz.build(
            r"\begin{tikzpicture}[x=1cm,y=1cm,>=Stealth]%s\end{tikzpicture}" % body)))
    out.close()
    print("worst %.4f cm over %d cases; gap %s"
          % (worst, len(CASES) - len(GAP),
             " ".join("%s %.4f" % (k, errs.get(k, float("nan"))) for k in GAP)))


if __name__ == "__main__":
    main()
