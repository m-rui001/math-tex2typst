"""What the emitter now places for a picture whose head sets `node distance`.

Feeds a source picture through `cetz.build` and prints the `content(` lines of the two nodes, so the
gap the head value buys can be read against the pdflatex numbers in `_work/m100_nd_probe.log`
(`node distance=13mm and 36mm` -> 36mm = 102.430pt edge to edge, 13mm = 36.989pt).

  python _work/probe100d_place_check.py
"""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz  # noqa: E402

CASES = {
    "head two-axis": r"""\begin{tikzpicture}[>=Stealth,node distance=13mm and 36mm]
\node (x) {$X$};
\node[right=of x] (v) {$V$};
\node[above=of x] (e) {$E^*$};
\node[above right=of x] (w) {$W$};
\end{tikzpicture}""",
    "head single": r"""\begin{tikzpicture}[node distance=2cm]
\node (x) {$X$};
\node[right=of x] (v) {$V$};
\end{tikzpicture}""",
    "no head": r"""\begin{tikzpicture}
\node (x) {$X$};
\node[right=of x] (v) {$V$};
\end{tikzpicture}""",
    "statement wins": r"""\begin{tikzpicture}[node distance=13mm and 36mm]
\node (x) {$X$};
\node[right=2cm of x] (v) {$V$};
\end{tikzpicture}""",
    "head unparseable": r"""\begin{tikzpicture}[node distance=1cm 2cm 3cm]
\node (x) {$X$};
\node[right=of x] (v) {$V$};
\end{tikzpicture}""",
}


def main():
    for name, pic in CASES.items():
        out = cetz.build(pic)
        print("=== %s" % name)
        if out is None:
            print("   refused")
            continue
        print(out)
    return 0


if __name__ == "__main__":
    sys.exit(main())
