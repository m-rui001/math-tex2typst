r"""Check mathconv.bake_refs on corpus formulas that carry cross-references.

Run: python _work/probe_refs.py   (from the repo root)
"""
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))
from t2t import mathconv

REFS = {
    "eq:add-available-congruences": ("2.3", "Equation"),
    "l:lt:score": ("4.1", "Equation"),
    "prop:embedded-cost": ("3.2", "Proposition"),
    "loc:paired": ("2.1", "Lemma"),
    "Birkar2023": (7, ""),
    "eq:hard-port-condition": ("5.4", "Equation"),
}

CASES = [
    r"F_U=\{z:\text{the rule in \eqref{l:lt:score} selects }U\}\subseteq U.",
    r"u_\nu-f_\nu(a)=0\quad(1\leq\nu\leq b), \qquad u_\nu'-f_\nu'(aR)=0\quad\text{in type \eqref{loc:paired}}",
    r"\mathbb{E}_{\mathbf{a}}\mathcal{V}(J,\mathbf{a}) \geq\sum_{S,\omega} \mathbf{1}_{\{\text{conditions }\eqref{res:survival}\text{ hold}\}}",
    r"\operatorname{vol}(\overline{A})\ge M^{-n} \qquad\text{\citep[Corollary~1.4]{Birkar2023}}.",
    r"\begin{aligned} P&\le C_P\ell Q+D_P, &&\text{by Proposition~\ref{prop:embedded-cost}},\\ V&\le C_A\ell Q \end{aligned}",
    r"\mathcal{A}=\sum_{\substack{u\text{ in the port boxes}\\ \text{satisfying }\eqref{eq:hard-port-condition}}} 2^{-|u|}",
    r"I_{\eqref{no:such-label}}+1",
    r"T(x)\in\{H_1(x),\ldots,H_4(x)\}\quad\text{for \(\nu\)-almost every }x\in B.",
    r"\{x:\text{there is a \(\delta>0\) with }|x-q|<\delta\}",
]

for tex in CASES:
    cleaned = mathconv.clean(tex, REFS)
    got, missing, err = mathconv.convert_formulas([tex], REFS)
    tag = "OK " if not missing else "REFUSE"
    print("%s src: %s" % (tag, tex[:70]))
    print("     clean: %s" % cleaned[:110])
    print("     typst: %s" % (list(got.values())[0][:110] if got else "(none)"))
    if missing and err:
        print("     err: %s" % err.strip().splitlines()[-1][:120])
    print()
