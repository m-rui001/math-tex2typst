r"""#94 channel gauge: does pandoc's own Typst writer put the escaped punctuation on the page faithfully?

The 12 canvas maths that still carry a slash after #93 all look like TeX source gone raw --
`$R Gamma_v \( \[ X \/ G \] \, Lambda_m \)$`, `$H^3 \( G_3 \, pi_0 hat(B)^square.stroked.tiny \) \[ 1 \/ p \] .$`
(`_work/m93_product_after.txt`).  Two readings were open: an untouched channel is搬运 TeX source onto the
page, or pandoc's Typst writer **escaped** the real punctuation of a formula that TeX also prints as ink.
The shipped sources settle it: line 508 of `_work/flat/A-rational-obstruction-...tex` reads
`R\Gamma_v([X/G],\Lambda_m)` -- parens, brackets, slash and comma are all ink in TeX too.

So this gauge does not hand-write a Typst body.  It feeds the author's TeX through `mathconv.run_pandoc`
(the same pandoc the pipeline calls) and puts WHAT PANDOC EMITTED on the page, against a pdflatex control
of the same fragment.  Three columns per case: the emitted string (is it the shipped shape?), whether a
bare `/` survives in it (that is #93's rule's face), and the page reading (glyph sequence + ink gaps vs
the control).

  python _work/measure94_channel.py > _work/m94_channel.txt
"""
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from tools.t2t import mathconv  # the pipeline's own pandoc call

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import measure93_slash_fidelity as ruler  # one ruler: lines()/control()/compile_()/fmt() are #93's

TMP = os.path.join(os.path.dirname(os.path.abspath(__file__)), "_m94chan")
ruler.TMP = TMP

# author TeX, written so pandoc's latex reader sees it (the papers' own macros are already expanded --
# \mathbb{Z} for \Z, \operatorname{holim} for \holim -- because that is the state the converter receives)
FRAGS = [
    ("quot-stack", r"$R\Gamma_v([X/G],\Lambda_m)$"),
    ("quot-stack-prime", r"$R\Gamma_v([X'/G'],\Lambda_m).$"),
    ("cohom-z", r"$H^3(G_3,\mathbb{Z}_p)[1/p]$"),
    ("cohom-hat", r"$H^3(G,\pi_0\widehat{B}^{\square})[1/p].$"),
    ("arrow-label", r"${[f/\varphi]}^{(*)}$"),
    ("tensor-eta", r"$R\Gamma\!(P_n,R\Gamma_c\!(\mathcal{X}/U,\mathcal{A})\otimes^{\leftarrow}\eta)$"),
    ("holim-tail", r"$\pi_{-3}L_0\operatorname{holim}_\ell L_1(T/p^\ell).$"),
    ("prose-bracket", r"$\mathbb{Z}[1/p]$"),
    ("fixed-points", r"$\bigl((\widehat{B}^{\square})^{hG}\bigr)(*)$"),
    ("leading-slash", r"$/\mu_{r,\mathrm{diag}}$"),
]


def emitted(math):
    """pandoc's Typst for one inline maths, as the pipeline would see it."""
    out, _err = mathconv.run_pandoc(
        "\\documentclass{article}\\begin{document}\nX " + math + "\n\\end{document}\n")
    found = re.findall(r"\$[^$\n]*\$", out)
    return found[-1] if found else "NO MATH OUT: %r" % out[:200]


def main():
    os.makedirs(TMP, exist_ok=True)
    for name, math in FRAGS:
        body = emitted(math)
        print("\n== %-16s TeX %s" % (name, math))
        print("   pandoc emits   %s" % body)
        print("   bare `/` in what pandoc emits: %d (these are the shapes #93's rule owns)"
              % len(re.findall(r"(?<!\\)/", body)))
        ctrl = ruler.control(name, "q", math)
        print("   %-10s            %s" % ("CONTROL", ruler.fmt(ctrl)))
        got = ruler.compile_(os.path.join(TMP, name + ".typ"),
                             ruler.PRE + "#text(size: 10pt)[q %s]\n" % body)
        if isinstance(got, list):
            print("   %-10s FAILED   %s" % ("EMITTED", got))
            continue
        typ = ruler.lines(got, "q")
        match = "==" if [s for _m, s, _g in typ] == [s for _m, s, _g in ctrl] else "!="
        print("   %-10s %-4s lines=%d %s" % ("EMITTED", match, len(typ), ruler.fmt(typ)))
    return 0


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
