"""Which math environment or macro makes texmath give up? One variable at a time.

Prints the tail of pandoc's warning, where the unexpected token is named.
Run: python _work/probe_math_env.py
"""
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import mathconv  # noqa: E402

CASES = [
    ("split bare", r"\begin{split} a&=b,\\ c&=d. \end{split}"),
    ("aligned same", r"\begin{aligned} a&=b,\\ c&=d. \end{aligned}"),
    ("gathered", r"\begin{gathered} a=b,\\ c=d. \end{gathered}"),
    ("array l", r"\begin{array}{l} a=b,\\ c=d \end{array}"),
    ("array with text", r"\begin{array}{l} M_\ell\text{ is nonsingular for every }\ell,\\ x \end{array}"),
    ("cases", r"\begin{cases} gS,&g=1,\\ S,&g=0, \end{cases}"),
    ("Tr", r"\Tr e^{-bH}"),
    ("norm", r"\norm{P_jv_{b_j}}^2"),
    ("rank", r"\rank(\sum_\ell t_\ell M_\ell^{-1})\geq s+1"),
    ("supp", r"\supp H_0'"),
    ("E", r"\E[X_{V_i}X_{V_j}]"),
    ("Subset", r"A\Subset B"),
    ("upharpoonright", r"\cl_{M_i\upharpoonright P}(S_i)=P"),
    ("mathbin cdot", r"\mathbf S_j\mathbin\cdot\mathbf S_{j+1}"),
    ("hspace", r"a\hspace{35mm}=b"),
    ("ne", r"(i\ne j)"),
    ("text nested", r"\text{\text{WL-Equiv}}"),
    ("vrule", r"\mathbin{\vrule height 1.4ex depth -0.3ex width .07ex}"),
    ("ref in math", r"a+\ref{ord:support}"),
    ("substack", r"\sum_{\substack{u\succeq v\\|u|=j}} \lambda^{3(j-i)}"),
    ("amp amp", r"\begin{aligned} a&=b &&(i\ne j),\\ c&=d. \end{aligned}"),
    ("mathrm rm", r"e^{-b(H_n^{\rm per}+an\Id)}"),
]

for name, tex in CASES:
    converted, refused, err = mathconv.convert_formulas([tex])
    ok = not refused
    out = converted.get(0, "")
    print("%-16s %-6s %s" % (name, "OK" if ok else "REFUSE", out[:70]))
    if not ok:
        batch, skipped = mathconv.build_batch([tex], {})
        _o, e = mathconv.run_pandoc(batch)
        print("%34s%s" % ("", " ".join((e or "").split())[-230:]))
