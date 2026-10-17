r"""#45: on which node bodies does CeTz's `anchor:` stop working?

`_work/measure69_bottom_edge.py`'s anchor-law block reads `$\frac{a}{b}$` at y0=-8.65 y1=+10.29 for
`anchor=south`, `anchor=north` and no anchor alike -- the box stays centred on the point, so the anchor
never moved it -- while `$x_i^2$` and `Abg` both obey (south -19.39/-0.00, north +0.00/+19.39).  One
broken label is not a law and not a face, so this measures the constructs
`_work/probe45_anchor_tall_math.py` actually found in anchored nodes, each against its own pdflatex
control, and reports per construct whether the anchor moved the box.

Admissible reading: for `south` the box's bottom rule sits ON the ruler crossing (y1 = 0, pgf's own
number is -0.20 because pgf includes half the rule), for `north` the top rule does (y0 = 0), for
`west`/`east` the box clears the crossing entirely, and with no anchor the box is centred.  A row whose
three anchor readings are identical is a row where the anchor is dead.

The typst side reuses measure69's compiler and reader so there is one instrument, not two; only the pgf
template differs, because that one hardcodes `anchor=south`.
"""
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from t2t import cetz  # noqa: E402
from measure69_bottom_edge import compile_run, read  # noqa: E402

PGF = r"""\documentclass[tikz,border=10pt]{standalone}
\begin{document}
\begin{tikzpicture}[x=1cm,y=1cm]
  \draw[gray] (0,0) -- (4,0);
  \draw[gray] (2,-2) -- (2,2);
  \node[draw%s] (a) at (2, 0) {%s};
\end{tikzpicture}
\end{document}
"""

RULERS = r"\draw[gray] (0,0) -- (4,0); \draw[gray] (2,-2) -- (2,2);"

# anchor option as the converter's node key spells it, and as pgf spells it
ANCHORS = [("south", ", anchor=south"), ("north", ", anchor=north"),
           ("west", ", anchor=west"), ("none", "")]

LABELS = [
    ("plain", r"$x_i^2$"),
    ("prose", "Abg"),
    ("frac", r"$\frac{a}{b}$"),
    ("frac-real", r"$R_c'(t)=-\dfrac{q-1}{R_c(t)}$"),
    ("sqrt", r"$\sqrt{n(p,0)}$"),
    ("leftright", r"$2R+\left\|v-w\right\|_\infty$"),
    ("stackrel", r"$A \overset{f}{\to} B$"),
    ("limits", r"$\sum_{k=1}^{n} k$"),
    ("rows-math", r"$A_1$\\$B_2$"),
    ("rows-prose", r"Abg\\Cde"),
    ("rows-mixed", r"\textbf{Added}\\$\widetilde\alpha$ closed."),
]


def built(label, key):
    return cetz.HEADER + cetz.build(r"\begin{tikzpicture}" + RULERS
                                    + r"\node[draw" + key + r"] at (2,0) {" + label
                                    + r"};\end{tikzpicture}")


def show(got):
    if got is None:
        return "%34s none" % ""
    h, north, south, esc, band = got
    return "h=%6.2f y0=%+7.2f y1=%+7.2f esc=%+5.2f" % (
        h, north, south, esc if esc is not None else -99)


def main():
    tmp = os.path.join(HERE, "_45")
    os.makedirs(tmp, exist_ok=True)
    dead = []
    for slug, label in LABELS:
        rows = {}
        print("\n%-12s %s" % (slug, label[:60]))
        for name, pgfkey in ANCHORS:
            key = "" if name == "none" else ", anchor=" + name
            src = built(label, key)
            if not src:
                print("  %-6s build refused" % name)
                continue
            got = read(compile_run(tmp, "t45_%s_%s" % (slug, name), src))
            ctl = read(compile_run(tmp, "p45_%s_%s" % (slug, name),
                                   PGF % (pgfkey, label), tex=True))
            rows[name] = got
            print("  %-6s typst %s" % (name, show(got)))
            print("  %-6s pgf   %s" % ("", show(ctl)))
        live = [r for r in rows.values() if r]
        if len(live) > 1 and len({(round(r[1], 2), round(r[2], 2)) for r in live}) == 1:
            dead.append(slug)
            print("  --> ANCHOR DEAD: every reading identical")
    print("\nconstructs whose anchor never moves the box: %s" % (", ".join(dead) or "none"))


if __name__ == "__main__":
    main()
