"""Do \multicolumn, \hline and a row break inside an array really block texmath?

Each case goes through the same clean + batch call the pipeline uses; the warning is
printed raw, with the column pandoc's caret points at.
Run: python _work/probe_array.py
"""
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import mathconv  # noqa: E402

CASES = [
    ("array hline", "\\begin{array}{cl} i & A_i(t,q) \\\\ \\hline 0 & q-t \\end{array}"),
    ("array multicolumn", "\\begin{array}{c|c|cc} x\\text{ interval} & y & \\multicolumn{2}{c}{z} \\\\ 1 & 2 & 3 & 4 \\end{array}"),
    ("array text cells", "\\begin{array}{l} M_\\ell\\text{ is nonsingular} \\\\ x \\end{array}"),
    ("aligned frac", "\\begin{aligned} p_z&=-\\frac{a(F_i^2+\\delta^2)}{z^2} -\\frac{(1-v^2)/2}{z^2}\\\\ q&=c \\end{aligned}"),
    ("aligned long", "\\begin{aligned} a&=b,\\\\ c&=d,\\\\ e&=f \\end{aligned}"),
    ("aligned text", "\\begin{aligned} C_{p,j}(h_p)&:=\\frac{1}{N(p)}\\sum_{y} \\chi(y) \\\\ \\intertext{and} d&=e \\end{aligned}"),
    ("tbinom", "\\mathbb{E}X<(1+\\tbinom{m}{2})d_0"),
    ("dbinom", "\\dbinom{n}{k}"),
    ("xmapsto", "v\\ \\xmapsto{\\ W_g\\ }\\ \\xi"),
    ("cr in substack", "\\sum_{\\substack{\\sigma\\subset\\Delta\\cr \\dim\\sigma=a}} H^s"),
    ("displaybreak", "\\begin{aligned} \\displaybreak a&=b \\end{aligned}"),
    ("tag nested", "\\begin{aligned} a&=b \\end{aligned}\\tag{\\(\\ast_{\\mathrm{adj}}\\)}"),
    ("mathactualtext", "\\mathbb{R}^{N} =\\MathActualText{2A01005F} x"),
    ("boldone", "K^{-1},\\qquad \\boldone,\\qquad T^{1,0}M"),
    ("longhook", "B^1\\longhookrightarrowactual F_*\\Omega"),
    ("vrule", "\\|C\\mathbin{\\vrule height 1.4ex depth -0.3ex width .07ex}D\\|"),
    # the rewrites clean() is about to make, tested in their target form
    ("multicolumn flat", "\\begin{array}{c|c|cc} x\\text{ interval} & y & z & \\\\ 1 & 2 & 3 & 4 \\end{array}"),
    ("intertext as text", "\\begin{aligned} a&=b \\\\ \\text{and} \\\\ c&=d \\end{aligned}"),
    ("overset mapsto", "v\\ \\overset{W_g}{\\mapsto}\\ \\xi"),
    ("tag depth two", "\\begin{aligned} a&=b \\end{aligned}"),
    ("cr as rowbreak", "\\sum_{\\substack{\\sigma\\subset\\Delta\\\\ \\dim\\sigma=a}} H^s"),
    ("binom plain", "\\mathbb{E}X<(1+\\binom{m}{2})d_0"),
]

for name, tex in CASES:
    batch, skipped = mathconv.build_batch([tex], {})
    out, err = mathconv.run_pandoc(batch)
    spans = mathconv._parse_spans(out)
    ok = 0 in spans and not skipped
    print("%-18s %-6s %s" % (name, "OK" if ok else "REFUSE", spans.get(0, "")[:56]))
    if not ok:
        tail = (err or "").splitlines()
        print("    " + " | ".join(x.strip() for x in tail[-3:] if x.strip())[:220])
