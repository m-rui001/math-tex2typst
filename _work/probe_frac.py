import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import mathconv  # noqa: E402

CASES = [
    r"\frac12",
    r"\frac1{x}",
    r"\frac{1}{2}",
    r"\frac{1}\mathrm{i}",
    r"\frac{1}{\mathrm{i}}",
    r"\frac{\mathrm{i}}{2}",
    r"H_D(a)-H_D(0)=\frac{1}{\mathrm{i}}\partial_tK_D(a;0)",
    r"H_D(a)-H_D(0)=\frac1\mathrm i\partial_tK_D(a;0)",
    r"\sqrt2",
    r"\sqrt{2}",
    r"a\binom12b",
    r"{\text{-}}",
    r"\int_{B_r}{\text{-}}\,u\,dv",
    r"\int {\text{-}}",
]
for tex in CASES:
    got, _, err = mathconv.convert_formulas([tex])
    print("%-46s %s" % (tex[:44], list(got.values())[0] if got else
                        "REFUSE " + " ".join(err.split())[-90:]))
