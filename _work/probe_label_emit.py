r"""Read the lines a `label=` now draws, and check them against the measured law.

`_work/measure_label_offset.py` says TeX pins the label's own box (1pt of `inner sep` included) on the
point where the direction's ray leaves the parent, so the emitted pin should read the parent's
half-extent plus that 1pt: for `minimum size=6pt` and `above` the answer is 0.1058 + 0.0353 = 0.1411cm,
against the 0.1482cm the engine drew (the last 0.007 is TikZ's `outer sep`, which the converter never
measures). A node nobody sized keeps its point, and two `label=` keys on one node draw both texts --
which is what `opts` accumulating that key is for.
"""
import io
import pathlib
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

CASES = [
    r"\node[circle, inner sep=0pt, minimum size=6pt, fill=black, label=above:$f$] (v) at (0,0) {};",
    r"\node[circle, inner sep=0pt, minimum size=6pt, fill=black, label=left:{$p$}] (v) at (0,0) {};",
    r"\node[circle, inner sep=0pt, minimum size=6pt, fill=black, label=above left:{$x$}] (v) at (0,0) {};",
    r"\node[draw, minimum width=1.2cm, minimum height=8pt, label=above:$f$] (b) at (0,0) {};",
    r"\node[draw, minimum width=1.2cm, minimum height=8pt,"
    r" label={[shift={(0pt,0pt)}]above:$f$}] (b) at (0,0) {};",
    r"\node[circle, inner sep=0pt, fill=black, label=$f$] (v) at (0,0) {};",
    r"\node[circle, inner sep=0pt, minimum size=6pt, fill=black, label={above:$f$}]"
    r" (v) at (0,0) {};",
    r"\node[draw, minimum width=1.2cm, minimum height=8pt, label=above:$f$, label=below:$g$]"
    r" (b) at (0,0) {};",
    # the three preamble spellings the churn probe's LOST list turned up -- they came out of pictures
    # that USED to build, so each one is a figure that must keep building
    r"\node[circle, inner sep=0pt, minimum size=6pt, fill=black,"
    r" label={[xshift=2pt,yshift=1pt]above right:$0$}] (v) at (0,0) {};",
    r"\node[circle, inner sep=0pt, minimum size=6pt, fill=black,"
    r" label={[inner sep=3pt]right:$p$}] (v) at (0,0) {};",
    r"\node[circle, inner sep=0pt, minimum size=6pt, fill=black,"
    r" label={[label distance=3pt]left:$x$}] (v) at (0,0) {};",
    r"\node[draw, rounded corners, text width=2cm, label=right:{a long sentence here}]"
    r" (b) at (0,0) {title};",
]

for body in CASES:
    built = cetz.build(r"\begin{tikzpicture}" + body + r"\end{tikzpicture}")
    print("== %s" % " ".join(body.split())[:104])
    print(built if built is not None else "(refused)")
    print()
