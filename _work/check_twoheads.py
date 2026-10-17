r"""Does a tikzcd arrow with 'two heads' now draw, and is the double tip in the canvas?

The corpus refused these for the mark we had not compiled; the gate is a real typst
compile, so a canvas that comes back means the drawing is valid, not merely built.
"""
import io
import pathlib
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

DIAGRAMS = [
    r"""\begin{tikzcd}
W_L \arrow[r,"\varphi"] \arrow[d,two heads,"\rho_P"'] \\
V
\end{tikzcd}""",
    r"""\begin{tikzcd}
A \arrow[r,two heads] B \arrow[l,two heads] C
\end{tikzcd}""",
    r"""\begin{tikzcd}
X \arrow[rr,two heads,"\pi"] \arrow[dr] & & Y \arrow[dl,two heads] \\
& Z &
\end{tikzcd}""",
]
for d in DIAGRAMS:
    got = cetz.convert(d)
    print("draws=%-5s double=%-5s  %s" % (bool(got), bool(got and ">>" in got),
                                          (got or "").replace("\n", " ")[:120]))

# the paper whose display is still quoted in the corpus
src = next((ROOT / "typst").glob("The-Bogomolov-Pop*/main.typ"))
text = src.read_text(encoding="utf-8", errors="replace")
print("\nquoted tikzcd left in %s: %d" % (src.parent.name[:40], text.count("begin{tikzcd}")))
