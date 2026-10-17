"""What curve does the corpus's own looseness spelling come out as?

One picture with the author's options, one without, so the factor is read against the 0.39 the
tangent already ships with -- and against pdflatex's 1.9499 chord-ratio from measure_looseness.py.
"""
import sys

sys.path.insert(0, "tools")
from t2t import cetz  # noqa: E402

CASES = {
    "plain": r"\begin{tikzpicture}[x=1cm,y=1cm]\draw (0,0) to[out=135,in=45] (2,0);\end{tikzpicture}",
    "l5": r"\begin{tikzpicture}[x=1cm,y=1cm]\draw (0,0) to[out=135,in=45,looseness=5] (2,0);"
          r"\end{tikzpicture}",
    "l0.5": r"\begin{tikzpicture}[x=1cm,y=1cm]\draw (0,0) to[looseness=0.5,out=135,in=45] (2,0);"
            r"\end{tikzpicture}",
    "bend+l5": r"\begin{tikzpicture}[x=1cm,y=1cm]\draw (0,0) to[bend left=45,looseness=5] (2,0);"
               r"\end{tikzpicture}",
    "corpus": r"\begin{tikzpicture}[x=1cm,y=1cm]\draw (0,0) to[out=135,in=45,looseness=5] (2,0);"
              r"\node at (1,0) {n};\end{tikzpicture}",
}
for name, pic in CASES.items():
    got = cetz.build(pic)
    line = next((ln.strip() for ln in (got or "").splitlines() if "bezier" in ln), "-none-")
    print("%-8s %s" % (name, line[:120]))
