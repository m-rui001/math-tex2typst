"""Where does a `{` reach the page from a node's maths?

`Milnes-rationality…` Figure 1 prints `{Q}` under the box label: the author wrote
`A^n \\underline{\\mathbb{Q}}`, so a command whose name the pass drops appears to hand its braced
argument through with the braces still on. Each shape below is one way a command can meet an
argument; the emitted line is printed as the converter gives it, so the leaking stage is the one
whose spelling shows up.
"""
import pathlib
import sys

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "tools"))
from t2t import cetz  # noqa: E402

CASES = {
    "underline-mathbb": r"\node (a) at (0,0) {$A^n \underline{\mathbb{Q}}$};",
    "mathbb-alone": r"\node (a) at (0,0) {$A^n \mathbb{Q}$};",
    "underline-plain": r"\node (a) at (0,0) {$\underline{C}$};",
    "text-underbrace": r"\node (a) at (0,0) {$\underline{AB}_{i}$};",
    "hat": r"\node (a) at (0,0) {$\widehat{A}_{i}$};",
    "frac": r"\node (a) at (0,0) {$\frac{K}{K_0}$};",
    "operatorname": r"\node (a) at (0,0) {$\operatorname{Hom}(X,Y)$};",
    "text-mode": r"\node (a) at (0,0) {\underline{reduction}};",
}

for name, stmt in CASES.items():
    src = "\\begin{tikzpicture}" + stmt + "\\end{tikzpicture}"
    got = cetz.build(cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", src), 15.79))
    if got is None:
        print("%-16s refused" % name)
        continue
    line = [l.strip() for l in got.splitlines() if "content(" in l]
    print("%-16s %s" % (name, line[-1] if line else "(no content line)"))
