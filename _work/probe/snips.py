"""Compile individual typst math snippets to see which forms Typst accepts."""

import os
import subprocess

SNIPPETS = {
    "align_raw": r"$ a &= b\ c &= d $",
    "align_aligned": r"$ aligned($a$ &= $b$, $c$ &= $d$) $",
    "align_amp_only": r"$ a & = b $",
    "setminus_bs": r"$ bb(R)^n \ { 0 } $",
    "setminus_named": r"$ bb(R)^n setminus { 0 } $",
    "substack": r"$ sum_(i in I) substack(i in I \ j in J) $",
    "underbrace_substack": r"$ underbrace(c_d, substack(i in I \ j in J)) $",
    "op_text": r"$ op{tr}(A) + {\"if\"} x + math.rm(wt) $",
    "operatorname_fn": r"$ operatorname{Lip}(C) $",
    "spacing": r"$ a negmedspace b thinspace c medspace d quad e qquad f $",
    "norm_bars": r"$ left \\| u \\| right|_(L^2) $",
    "lr_bars": r"$ lr(|| u ||)_{L^2} $",
    "abs": r"$ abs(a+b) $",
    "mat_paren": r"$ mat(delim: \"(\", 1, 0; 0, 1) $",
    "pmatrix": r"$ pmatrix(1, 0; 0, 1) $",
    "cases": r"$ cases(a &\"if\" x, b &\"else\") $",
    "greek": r"$ epsilon.alt phi.alt theta.alt varphi emptyset $",
    "arrows": r"$ a arrow.r.double.long b arrow.r^f c $",
    "xrightarrow": r"$ A arrow.r^{f} B $",
    "fonts": r"$ script(F) bb(R) frak(a) bold(A) boldsym(B) cal(F) $",
    "limits": r"$ integral_0^T sum_(i=1)^n prod_(j in J) bigcup_(k in K) $",
    "accents": r"$ hat(x) tilde(y) bar(z) mac(w) vec(v) dot(d) $",
    "frac": r"$ tfrac(1,2) frac(d f, d x) $",
    "le_ge": r"$ a lt.eq b gt.eq c eq.not d $",
    "ne_le": r"$ a != b $",
    "le_unicode": r"$ a ≤ b ≠ c ≥ d $",
    "times_circle": r"$ A times.circle B $",
    "otimes": r"$ A otimes B $",
    "dagger": r"$ A^dagger $",
    "langle": r"$ langle a, b rangle $",
    "subsup_braces": r"$ x_(i,j)^(1) $",
    "deg_sub": r"$ deg_\"wt\" A_i $",
    "deg_sub_text": r"$ deg_({\"wt\"}) A_i $",
    "text_mode": r"$ \text{note} $",
    "hbox_text": r"$ text(\"on\") $",
    "bigglr": r"$ bigl( x bigr) $",
    "middle": r"$ left| x middle| y right| $",
    "tag_literal": r"$ x = y \quad \"(star)\" $",
    "overbrace": r"$ overbrace(a+b)^(\"note\") $",
    "colon": r"$ f: X -> Y $",
    "backslash_space": r"$ A \\ B $",
    "brace_group": r"$ { 0 } $",
    "dots": r"$ a_1 + dots + a_n $",
    "ldots": r"$ a, b, ldots, c $",
    "vdots": r"$ mat(1; vdots; n) $",
    "binom": r"$ binom(n, k) $",
    "hat_wide": r"$ widehat(A B) $",
    "subeq": r"$ a = b \quad (3a) $",
    "aligned_env": r"$ aligned(a &= b, c &= d) $",
    "gathered": r"$ gathered(a = b, c = d) $",
    "sgn_split": r"$ a = b + c \quad d $",
    "math_italic_ident": r"$ \\deg_{\\rm wt} $",
}


def run(name, body):
    path = "E:/math/_work/probe/_snip.typ"
    src = "#set page(width: 16cm, height: auto, margin: 1cm)\n" + body + "\n"
    with open(path, "w", encoding="utf-8") as fh:
        fh.write(src)
    p = subprocess.run(["typst", "compile", path, "E:/math/_work/probe/_snip.pdf"],
                       capture_output=True, text=True, encoding="utf-8")
    msg = (p.stderr or "").strip().splitlines()
    first = ""
    for line in msg:
        if line.startswith("error:"):
            first = line
            break
    return p.returncode, first


for name, body in SNIPPETS.items():
    code, msg = run(name, body)
    print(("OK   " if code == 0 else "FAIL ") + name.ljust(20), msg[:90])
