"""Do a `\draw`'s invoked styles refuse a picture, and is a second subpath a separate cause?

`translate_statement` merges the style table into a node's options and never into a `\draw`'s, so a
flowchart that declares `edge/.style={->,thick}` and writes `\draw[edge]` is read as an unknown bare
key. These cases separate that from the other two suspects in the blamed list: a `node[...]` inside a
`\path ... edge` invoking a style, and one `\draw` carrying two `(--)` subpaths.
"""
import pathlib
import sys

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "tools"))
from t2t import cetz  # noqa: E402

CASES = {
    "draw+style": r"\begin{tikzpicture}[edge/.style={->,thick,blue}] (0,0) -- (1,1);"
                  r"\draw[edge] (0,1) -- (1,0);\end{tikzpicture}",
    "draw-inlined": r"\begin{tikzpicture}[edge/.style={->,thick,blue}] (0,0) -- (1,1);"
                    r"\draw[->,thick,blue] (0,1) -- (1,0);\end{tikzpicture}",
    "node+style": r"\begin{tikzpicture}[note/.style={font=\small}] \node (a) at (0,0) {A};"
                  r"\path (a) edge node[left,note] {red} (1,0);\end{tikzpicture}",
    "node-inlined": r"\begin{tikzpicture}[note/.style={font=\small}] \node (a) at (0,0) {A};"
                    r"\path (a) edge node[left,font=\small] {red} (1,0);\end{tikzpicture}",
    "two-subpaths": r"\begin{tikzpicture} \draw (0,0) -- (1,1) (2,0) -- (3,1);\end{tikzpicture}",
    "ellipse-style": r"\begin{tikzpicture}[cap/.style={draw=black,thick}]"
                     r"\draw[cap] (0,0) ellipse (1.0 and 0.37);\end{tikzpicture}",
}

for name, src in CASES.items():
    core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", src), 15.79)
    got = cetz.build(core)
    print("%-14s %s" % (name, "BUILT" if got else "refused"))
    if got:
        print("       %s" % " | ".join(l.strip() for l in got.splitlines()[2:-1])[:200])
