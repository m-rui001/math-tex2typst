"""Where does bib-item LaTeX survive: pandoc's reader or our post-processing?

Run: python _work/probe_bib.py
"""
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import mathconv  # noqa: E402

ITEMS = [
    r"\emph{On the Eisenbud--Green--Harris conjecture}, J. Algebra 2015.",
    r"\href{https://arxiv.org/abs/1212.2653}{arXiv:1212.2653}.",
    r"Proc. Amer. Math. Soc. \textbf{143} (2015), no.~1, 105--115.",
    r"Author, \emph{Book title}, 2nd ed., Springer, 2020.",
    r"See \cite{foo} for \textit{italic} and \textsc{sc} text.",
    r"A paper with math $x^2 + y^2$ and \textrm{rm} letters.",
]
got = mathconv.convert_prose_batch(ITEMS)
for i, src in enumerate(ITEMS):
    print("-" * 70)
    print("IN :", src)
    print("OUT:", got.get(i, "<missing>"))
