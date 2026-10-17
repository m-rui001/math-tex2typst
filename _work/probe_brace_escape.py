r"""What the node-label maths path emits for a script group that carries escaped braces."""
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

for src in (r"c_{\{k,j\}}", r"c_{\{k,j'\}}", r"\1_{\{v\}}", r"x_{i+1}", r"a_{0}",
            r"x_{12}", r"N_{e,0}", r"z_a^{c_1}", r"c_{\{}", r"q_{[n]}", r"d_{\{i\ge 1\}}"):
    print("%-24s -> %s" % (src, cetz._math_body(src)))
