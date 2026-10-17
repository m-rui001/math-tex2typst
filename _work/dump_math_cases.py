r"""What the KL flowchart box reaches the converter's output as, before and after the guard fix."""
import pathlib
import sys

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
from t2t import cetz  # noqa: E402

for tex in (r"P'_{u,b}", r"|E_b|_{g_b}^2", r"A \otimes_{kR} B",
            r"P_{y,b}=P'_{\iota(y),b'}"):
    print("%-30r -> %r" % (tex, cetz._math_body(tex)))

canvas = cetz.convert(r"\begin{tikzpicture}\node (a) at (0,0) "
                      r"{$P_{y,b}=P'_{\iota(y),b'}$};\end{tikzpicture}")
print("canvas:", canvas)
