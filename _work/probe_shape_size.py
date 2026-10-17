r"""Does a shaped node (`circle`, `ellipse`, `rectangle`) carry the size its author declared?

#39 covers the nodes Typst draws as a `#box(`; a `circle` node is drawn as a CeTz shape instead, and a
shape takes its radius from somewhere else entirely. `\node[draw,circle,minimum size=9mm] (k) {$k$}`
from The-Factor-Two-Hardness-Threshold is the case in point: the width census called the paper
"readable" and the stub diff did not touch it, so one of the two paths must be dropping the measure.
Prints the built canvas for a few declared shapes so the emitted geometry can be read against the
declaration (pdflatex oracle: a `minimum size=9mm` circle is a 9mm disc, content centred).
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)

CASES = [
    r"\node[draw,circle,minimum size=9mm,fill=blue!8] (k) at (0,0) {$k$};",
    r"\node[draw,circle,minimum width=1cm] (k) at (0,0) {$k$};",
    r"\node[draw,ellipse,minimum size=1cm] (k) at (0,0) {$k$};",
    r"\node[draw,rectangle,minimum size=1cm] (k) at (0,0) {$k$};",
    r"\node[draw,circle,inner sep=0pt,minimum size=6pt] (k) at (0,0) {};",
]
for body in CASES:
    built = cetz.build(r"\begin{tikzpicture}" + body + r"\end{tikzpicture}")
    print("== %s" % body)
    print(built or "(refused)")

print("\n-- corpus: how many shaped nodes name a size?")
SHAPE = re.compile(r"\\node\s*\[([^\]]*)\]")
hits = 0
papers = set()
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = path.read_text(encoding="utf-8", errors="replace")
    for pic in PIC.findall(text):
        for opts in SHAPE.findall(pic):
            if re.search(r"\b(circle|ellipse|rectangle)\b", opts) and re.search(
                    r"minimum (size|width|height)|text width", opts):
                hits += 1
                papers.add(path.stem)
print("nodes: %d over %d papers" % (hits, len(papers)))
