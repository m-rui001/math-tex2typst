import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import mathconv  # noqa: E402

CASES = {
    "frac-i": r"H_D(a)-H_D(0)=\frac1\mathrm i\partial_tK_D(a;0)",
    "fint": (r"\begin{aligned} \int_{B_r}\mathchoice{{\setbox0=\hbox{$\displaystyle\int$}"
             r"\vcenter{\hbox{$\textstyle-$}}\kern-.5\wd0}}"
             r"{{\setbox0=\hbox{$\textstyle\int$}\vcenter{\hbox{$\scriptstyle-$}}\kern-.5\wd0}}"
             r"{{\setbox0=\hbox{$\scriptstyle\int$}\vcenter{\hbox{$\scriptscriptstyle-$}}"
             r"\kern-.5\wd0}}{{\setbox0=\hbox{$\scriptscriptstyle\int$}"
             r"\vcenter{\hbox{$\scriptscriptstyle-$}}\kern-.5\wd0}}\,u\,dv \end{aligned}"),
}

for name, tex in CASES.items():
    got, missing, err = mathconv.convert_formulas([tex])
    print("%-8s %s" % (name, "OK  -> %s" % list(got.values())[0] if got else "REFUSE"))
    if not got:
        print("   clean: %s" % mathconv.clean(tex))
        print("   err  : %s" % " ".join(err.split())[:400])
