"""Show clean() output and pandoc's complaint for the biggest refusal classes."""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import mathconv  # noqa: E402

TeXSTR = re.compile(r'"((?:[^"\\]|\\.)*)"')
MAC = re.compile(r"\\[A-Za-z@]+")

CASES = [
    ("text-with-math", r"\text{when $B$ is a square in }R"),
    ("text-with-math2", r"\{\text{labels of the two edges of $\mathcal C$ incident to $v$}\}"),
    ("rm-space", r"(({\rm tr}\,p)^2/8-{ \rm tr}(p^2)/4)\ell_\mu\ell_\nu"),
    ("cal-space", r"(\mathcal A_j)^{\beta_j}=\mathcal N, \qquad (\mathcal A_j)^\sigma \ \text{has mass}"),
    ("array-booktabs", r"\begin{array}{c@{\qquad}ccc} \toprule &a&z_i&b\\ \midrule \text{original degree} &1\end{array}"),
    ("mathchoice", r"Cr^{-1}\left(\mathchoice{{\setbox0=\hbox{$\displaystyle\int$}\vcenter{\hbox{$\int$}}}{\int}{\int}{\int}\right)"),
    ("mkern", r"G=\mathop{\mathchoice{\mkern2mu\int\mkern-15mu-\mkern7mu}{\int}{\int}{\int}}"),
    ("norm-langle", r"JPJ-j\langle \phi'(h^1)s\rangleI"),
    ("le-norm", r"0\le\pi(x)\le\left\lVert{x}\right\rVertq"),
    ("frac-i", r"H_D(a)-H_D(0)=\frac1\mathrm i\partial_tK_D(a;0)"),
    ("xrightarrow", r"\begin{gathered} Z_F\xrightarrow{\ U_{\Delta}\ }Z_{F,\mathrm{ntw}} \end{gathered}"),
    ("eqref", r"\eqref{eq:add-available-congruences}"),
    ("ref-star", r"(\ref*{geo:secants})"),
]

for name, tex in CASES:
    got, missing, err = mathconv.convert_formulas([tex])
    cleaned = mathconv.clean(tex)
    if got:
        print("%-16s OK" % name)
        continue
    print("%-16s REFUSE\n   in : %s\n   out: %s\n   err: %s"
          % (name, tex[:110], cleaned[:110], " ".join(err.split())[:150]))
