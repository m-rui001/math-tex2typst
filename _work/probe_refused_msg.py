"""Print pandoc's whole complaint for the shapes the residue still holds.

Run: python _work/probe_refused_msg.py
"""
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import mathconv  # noqa: E402

CASES = {
    "aligned && + nested text": r"\begin{aligned} p_z&=-\frac{a}{z^2} &&\text{in Case \text{(i)}}, \\ p_z&=-\frac{eB}{w} &&\text{in Case \text{(ii)}}. \end{aligned}",
    "array cells with \( \)": r"\begin{array}{cl} i & \(A_i(t,q)\) \hline 0 & \(q-t\in W_1\), or \(\mathcal{A}(t)\) and no trial; \end{array}",
    "array + strut rule": r"\begin{array}{c|c|c} \text{assumed}& \text{error}&\text{growth} \hline 0<d<\overline{\delta}_N(t_0)&\min(a/2,ad/2)&1+d/2\rule{0pt}{13pt} 2\varepsilon<\overline{\delta}_N(t_0)& \min(a/2)&1+\varepsilon/2 \end{array}",
    "unbraced overset": r"X_t\overset\mathrm{law}=tX_1",
    "split with bigr pipes": r"\begin{split} |p(W_b)-\Delta_{h_t}\bigl(d_{0,j}+(1+s)k_1\bigr)\bigr| \le C (\delta_1\delta_2)^{-c_3}. \end{split}",
    "bigl tbinom bigr": r"R'_L(b) =\exp\bigl(-\lambda'_L\tbinom{b}{j} V\bigr) R_L(b) \exp\bigl(-m_L\tbinom{b}{j} V\bigr).",
    "display inside math": r"Writing \[ d=\frac{D_0+D_1}{3},\qquad f=\frac{D_0+\zeta D_1}{3}, \] the operator is \mathcal{L} u =36\bigl(a\bigr)",
    "ref inside math": r"(\ref{ib:affine-expansion}.1)",
    "quad glue": r"L-(K_{f^{-1}U}+C_U)\quad \text{$f$-nef over }U.",
    "hookarrow actualtext": r"B^1\HookArrowActualText{\lhook\joinrel\longrightarrow} F_*\Omega",
    "mathactualtext boldone": r"|\Delta_{h_t}k_1|\le C e^\rho\delta_1^{-3} \mathord{\MathActualText{D835DFCF}{\mathbf1}}_{\{\chi_1=1\}}.",
}

for name, src in CASES.items():
    out, err = mathconv.run_pandoc(mathconv.build_batch([src], {})[0])
    ok = 0 in mathconv._parse_spans(out)
    print("=== %s -> %s" % (name, "OK" if ok else "REFUSED"))
    print("    clean: %s" % " ".join(mathconv.clean(src, {}).split())[:200])
    if not ok:
        print("    err:   %s" % " ".join((err or "").split())[:400])
