"""What the maths pass makes of a symbol path and of the same word written as prose."""
import pathlib
import sys

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "tools"))
from t2t import cetz  # noqa: E402

for tex in [r"\mathrm{curve}", r"\curvearrowleft", r"\alpha_r", r"\infty",
            r"\mathbb P^1_{\mathrm{curve}}\times\mathbb P^1_{\mathrm{normal}}",
            r"\cup\setminus\mapsto", r"\Downarrow_x"]:
    print("%-62s -> %s" % (tex, cetz._math_body(tex)))
