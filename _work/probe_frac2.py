import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import mathconv  # noqa: E402

CASES = [
    r"\frac a2\sqrt{\frac \tau{\log\tau}}",
    r"\frac1\mathrm i\partial_tK_D(a;0)",
    r"\frac{\tau\log\tau}{}",
    r"\frac{\|f(x)-f(y)\|_1}{\rho(x,y)}",
    r"\frac12",
    r"\frac\alpha\beta",
]
for tex in CASES:
    got, _, err = mathconv.convert_formulas([tex])
    print("%-38s clean=%-46s %s" % (tex[:36], mathconv.clean(tex)[:44],
                                    list(got.values())[0] if got else
                                    "REFUSE " + " ".join(err.split())[-60:]))
