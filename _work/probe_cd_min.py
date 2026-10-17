r"""Print build_cd's canvas for a minimal two-line-cell diagram, to pin the test on measured text."""
import io
import pathlib
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

SRC = (r"\begin{tikzcd}[row sep=large]"
       r"\begin{gathered}\text{first line}\\ \text{second line}\end{gathered} \arrow[d] \\"
       r"\text{below}"
       r"\end{tikzcd}")
print(cetz.build_cd(SRC))
print("---- single-line control (must be unchanged) ----")
print(cetz.build_cd(r"\begin{tikzcd}A \arrow[r] B\end{tikzcd}"))
