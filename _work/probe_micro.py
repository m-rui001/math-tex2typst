r"""Which micro-constructs does the production math pipeline survive?"""
import re
import sys

sys.path.insert(0, "tools")
from t2t import mathconv  # noqa: E402

CASES = [
    ('overline-unbraced', r'\overline\mathbb D'),
    ('overline-braced', r'\overline{\mathbb D}'),
    ('widehat-unbraced', r"\widehat\mathcal T_s'"),
    ('widehat-braced', r'\widehat{\mathcal T}_s'),
    ('sf', r'(\mathsf A+\mathsf R)'),
    ('rm-space', r'{\rm tr}\,p'),
    ('cal', r'\mathcal W_{ab}'),
    ('widetilde-cal', r'\widetilde{\cal W}_{ab}'),
    ('lhook-joinrel', r'\lhook\joinrel\longrightarrow'),
    ('hookrightarrow', r'\hookrightarrow'),
    ('substack', r'\sum_{\substack{u\succeq v\\|u|=j}}'),
    ('stackrel', r'\sum_{\stackrel{a}{b}}'),
    ('psmallmatrix', r'\begin{psmallmatrix}1&2\\3&4\end{psmallmatrix}'),
    ('smallmatrix', r'\begin{smallmatrix}1&2\\3&4\end{smallmatrix}'),
    ('eqref', r'\eqref{eq:x}'),
    ('hspace', r'\hspace{12mm}'),
    ('bigl', r'\bigl(m_0b\bigr)'),
    ('hphantom', r'\hphantom{XX}'),
    ('pipe-norm', r'\|P_n a\|\le \|b\|'),
    ('cases-text', r'\begin{cases}(ih)^d,&\text{all }d\text{ marks}\\0&\text{else}\end{cases}'),
    ('cases-dollar', r'\begin{cases}(ih)^d,&\text{all $d$ marks}\\0&\text{else}\end{cases}'),
    ('array-bracketed', r'\begin{array}[b]{c|l@{\qquad}c|l}n&a\\2&\texttt{++}\end{array}'),
    ('array-bars', r'\begin{array}{c|cc}n&a\\2&3\end{array}'),
    ('double-brackets', r'E[[\eta,H_{\mathrm{rest}}]]'),
    ('operatorname-sup', r'\operatorname{End}^0_{\overline\mathbb Q}(A)'),
    ('backslash', r'\mathbb Q\backslash G(\mathbb A)'),
    ('qedhere', r'z\ne0.\qedhere'),
    ('iid-channels', r'\begin{aligned} a&=\mathbb E_{\mathrm{iid\ channels}} b\end{aligned}'),
    ('split', r'\begin{split}(n-1)!\|\ell\|^2\sum_iw_i^2\end{split}'),
    ('align-text-math', r'\begin{align}A_{ab}(\alpha,\beta)=0 \quad\text{if $\alpha\cap\beta=\emptyset$}\end{align}'),
    ('mathchoice', r'Cr^{-1}\left(\mathchoice{{\setbox0=\hbox{$\displaystyle\int$}\vcenter{\hbox{$\int$}}}{\int}{\int}{\int}\right)'),
    ('begingroup-array', r'\begin{equation}\begingroup \setlength{\arraycolsep}{4pt} \begin{array}{cc}1&2\end{array}\endgroup\end{equation}'),
    ('CD', r'\begin{CD} L @>{P}>> M \end{CD}'),
]

for name, tex in CASES:
    got, missing, err = mathconv.convert_formulas([tex])
    clean, skipped = mathconv.build_batch([tex])
    if got:
        print("%-18s OK     %s" % (name, re.sub(r"\s+", " ", list(got.values())[0])[:60]))
    else:
        why = "skipped($)" if skipped else " " + " ".join(err.split())[:70]
        print("%-18s REFUSE %s" % (name, why))
