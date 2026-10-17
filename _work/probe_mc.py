import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import mathconv  # noqa: E402

A = r"Cr^{-1}\left(\mathchoice{{\setbox0=\hbox{$\displaystyle\int$}\vcenter{\hbox{$\int$}}}{\int}{\int}{\int}\right)"
B = r"\mathchoice{{\setbox0=\hbox{$\displaystyle\int$}\vcenter{\hbox{$\int$}}}{\int}{\int}{\int}}"
C = r"\frac1\mathrm i"
D = r"\mathchoice{\int}{\int}{\int}{\int}"

print("mc(B)  :", mathconv.mathchoice(B))
print("mc(D)  :", mathconv.mathchoice(D))
print("clean(A):", mathconv.clean(A))
print("clean(C):", mathconv.clean(C))
