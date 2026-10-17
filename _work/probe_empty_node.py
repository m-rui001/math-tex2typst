r"""Why does an empty shaped node refuse, and which of the two halves is at fault?

`_work/probe_shape_size.py` handed back `(refused)` for `\node[draw,circle,inner sep=0pt,minimum
size=6pt] (k) at (0,0) {};` -- a dot, the commonest way to draw a vertex in a graph figure. A refusal
in a real picture means the canvas is dropped, so the shape of the failure matters more than the
count. Peeling one option at a time shows which one the converter cannot carry.
"""
import io
import pathlib
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

CASES = [
    r"\node[draw,circle,inner sep=0pt,minimum size=6pt] (k) at (0,0) {};",
    r"\node[draw,circle,minimum size=6pt] (k) at (0,0) {};",
    r"\node[draw,circle,inner sep=0pt] (k) at (0,0) {};",
    r"\node[draw,circle] (k) at (0,0) {};",
    r"\node[draw] (k) at (0,0) {};",
    r"\node[draw,circle] (k) at (0,0) { };",
    r"\node[draw,circle,minimum size=6pt] (k) at (0,0) {$k$};",
    r"\node (k) at (0,0) {};",
    r"\fill (0,0) circle (2pt);",
]
for body in CASES:
    src = r"\begin{tikzpicture}" + body + r"\end{tikzpicture}"
    built = cetz.build(src)
    print("== %-58s -> %s" % (body[:58], (built or "REFUSED").replace("\n", " ")[:150]))
