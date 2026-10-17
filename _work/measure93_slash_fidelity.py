r"""#93 fidelity gauge: what does each slash emission put on the PAGE against real TikZ?

The law to pin is one sentence: Typst reads a `/` in maths as a **stacked fraction**, while TeX sets an
ordinary inline slash.  The half-sentence this file first attached -- that the denominator runs to the end
of the maths -- was refuted on the page by `_work/measure97_bar_scope.py` (轴 77): the bar takes the one
atom after the slash, scripts and group subscripts travelling with it (`_work/measure92_math_fidelity.py`
read `$E/2$` as two lines).  This measures that on the shapes the corpus actually ships -- read out of
`_work/m93_slash_sites2.tsv` -- because the damage grows with what follows the slash: `1/2` loses a
line break, while `R^2/d_{ij}^{2}` puts `d_(i j)^(...)` under the bar.

Candidate spellings, all of them the *literal* glyph: `"..."` around a slash, tight and spaced, and
`#sym.slash`.  A space next to a quoted atom is free in Typst maths (轴 69: tight and spaced set the
same line), so the two quoted forms must be read separately -- one of them is what the emitter will
write, and the gap column is what decides.

One page per case on BOTH sides (轴 74's instrument law: a shared page needs a sentinel and a span's
own maths can hold another case's sentinel).  Verdict: the LINES of glyphs must equal the control's,
and every ink gap must sit inside a hair of the control's.

  python _work/measure93_slash_fidelity.py > _work/m93_fidelity.txt
"""
import os
import re
import subprocess
import sys
import unicodedata

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TMP = os.path.join(ROOT, "_work", "_m93fid")

# (name, sentinel, author TeX maths, [(candidate label, Typst maths body), ...])
CASES = [
    # -- a bare ratio: the commonest shape (digit|digit is the single biggest context class).
    ("ratio-digits", "a", r"$1/2$",
     [("today", r"$a 1/2$"), ("str", r'$a 1"/"2$'), ("str-sp", r'$a 1 "/" 2$'),
      ("sym", r"$a 1 #sym.slash 2$")]),
    # -- a slash hanging off a subscript.
    ("ratio-script", "b", r"$b_3/4$",
     [("today", r"$b b_3/4$"), ("str", r'$b b_3"/"4$'), ("str-sp", r'$b b_3 "/" 4$')]),
    # -- quotient objects: letter/letter, and a symbol's name on the left.
    ("ratio-letters", "c", r"$A/k$",
     [("today", r"$c A/k$"), ("str", r'$c A"/"k$'), ("str-sp", r'$c A "/" k$')]),
    ("ratio-group", "d", r"$\mathbb{Z}^2\times\mathbb{Z}/\mathbb{Q}$",
     [("today", r"$d bb(Z)^2 times bb(Z)/bb(Q)$"),
      ("str", r'$d bb(Z)^2 times bb(Z)"/"bb(Q)$')]),
    # -- the severe family: a long tail after the slash, which TeX keeps on one line.
    ("ratio-long-tail", "e", r"$R^2/d_{ij}^{\,2}$",
     [("today", r"$e R^2/d_(i j)^(#h(0.1667em) 2)$"),
      ("str", r'$e R^2"/"d_(i j)^(#h(0.1667em) 2)$')]),
    ("ratio-exp", "f", r"$G^{-1/4}$",
     [("today", r"$f G^(-1/4)$"), ("str", r'$f G^(-1"/"4)$')]),
    # -- the two families 轴 74 parked: `L_*/3` (a `*` before the slash) and a leading `/b`.
    ("star-slash", "g", r"$L_*/3$",
     [("today", r"$g L_*/3$"), ("str", r'$g L_*"/"3$'), ("str-sp", r'$g L_* "/" 3$')]),
    ("leading-slash", "h", r"$x=/b$",
     [("today", r"$h x=/b$"), ("str", r'$h x="/"b$'), ("str-sp", r'$h x= "/" b$')]),
    # -- a real fraction stays a real fraction: `\frac` ships a `frac` call and no slash at all.
    ("frac-control", "i", r"$\frac{QH_j}{w}=G^{1/4}$",
     [("stacked", r'$i frac("QH"_j, w) =G^(1"/"4)$'),
      ("today", r'$i frac("QH"_j, w) =G^(1/4)$')]),
    # -- the shapes the emitter actually produces once the spaces around the slash are eaten:
    #    a Greek symbol's name, a bare ratio of digits, a quoted word touching the quoted slash
    #    (`"Lr""/"8` is two strings side by side, so it has to compile), a delimiter on the right,
    #    and a spacing call on the left of a slash.
    ("emit-greek", "j", r"$\beta/4$", [("emit", r'$j beta"/"4$')]),
    ("emit-pi", "k", r"$\pi/2$", [("emit", r'$k pi"/"2$')]),
    ("emit-quoted-word", "l", r"$Lr/8$", [("emit", r'$l "Lr""/"8$')]),
    ("emit-quoted-ks", "m", r"$f_i(s)=(-ks/2)_+$", [("emit", r'$m f_i(s)=(-"ks""/"2)_+$')]),
    ("emit-sqrt-left", "n", r"$\sqrt{\gamma}/2$", [("emit", r'$n sqrt( gamma )"/"2$')]),
    ("emit-paren-right", "o", r"$\ell/(2s)$", [("emit", r'$o ell"/"(2s)$')]),
    ("emit-mathbb-right", "p", r"$H/\mathbb{Z}H$", [("emit", r'$p H"/"bb(Z) H$')]),
]

PRE = "#set page(width: 30cm, height: 4cm, margin: 0.5cm)\n"


def fold(text):
    out = unicodedata.normalize("NFKD", text)
    return "".join(c for c in out
                   if unicodedata.combining(c) == 0 and not (0xFE00 <= ord(c) <= 0xFE0F))


def lines(pdf, sent):
    """[(is-main, glyph string, [ink gaps])] for one page, in y order, sentinel line flagged."""
    doc = fitz.open(pdf)
    out = []
    for block in doc[0].get_text("rawdict")["blocks"]:
        for line in block.get("lines", []):
            chars = [(fold(c["c"]), fitz.Rect(c["bbox"]))
                     for sp in line["spans"] for c in sp["chars"]]
            chars = [(c, r) for c, r in chars if c.strip()]
            if not chars:
                continue
            rest = [k for k, (c, _r) in enumerate(chars) if c == sent]
            main = bool(rest)
            if main:
                chars = chars[rest[0] + 1:]
            seq = "".join(c for c, _r in chars).replace(" ", "")
            gaps = [round(chars[k + 1][1].x0 - chars[k][1].x1, 3)
                    for k in range(len(chars) - 1)]
            out.append((line["bbox"][1], main, seq, gaps))
    doc.close()
    return [(m, s, g) for _y, m, s, g in sorted(out)]


def compile_(path, body):
    pdf = path[:-4] + ".pdf"
    if os.path.exists(pdf):
        os.remove(pdf)
    open(path, "w", encoding="utf-8").write(body)
    r = subprocess.run(["typst", "compile", "--diagnostic-format", "short", path, pdf],
                       capture_output=True, text=True, encoding="utf-8", errors="replace")
    return pdf if os.path.exists(pdf) else (r.stderr or "").strip().splitlines()[:1]


def control(name, sent, math):
    tex = os.path.join(TMP, name + ".tex")
    pdf = os.path.join(TMP, name + ".pdf")
    open(tex, "w", encoding="utf-8").write(
        r"\documentclass[10pt]{article}\pagestyle{empty}\usepackage{tikz}\begin{document}"
        r"\begin{tikzpicture}[x=1cm]\node[font=\fontsize{10}{12}\selectfont] at (0,0) "
        r"{\LABEL};\end{tikzpicture}\end{document}\n"
        .replace("\\LABEL", sent + " " + math))
    subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", TMP, tex],
                   cwd=TMP, capture_output=True)
    return lines(pdf, sent) if os.path.exists(pdf) else [("pdflatex failed", [], [])]


def fmt(rows):
    return " | ".join("%-14s %s" % (s, [round(v, 2) for v in g]) for _m, s, g in rows)


def main():
    os.makedirs(TMP, exist_ok=True)
    for name, sent, math, cands in CASES:
        ctrl = control(name, sent, math)
        print("\n== %s   TeX %s" % (name, math))
        print("   %-10s            %s" % ("CONTROL", fmt(ctrl)))
        print("   lines on the control page: %d" % len(ctrl))
        for label, body in cands:
            got = compile_(os.path.join(TMP, "%s-%s.typ" % (name, label)),
                           PRE + "#text(size: 10pt)[%s]\n" % body)
            if isinstance(got, list):
                print("   %-10s FAILED   %s" % (label, got))
                continue
            typ = lines(got, sent)
            match = "==" if [s for _m, s, _g in typ] == [s for _m, s, _g in ctrl] else "!="
            dmax = ""
            if match == "==" and any(g for _m, _s, g in typ):
                pairs = [(x, y) for (_m1, _s, gx), (_m2, _s2, gy) in zip(typ, ctrl)
                         for x, y in zip(gx, gy)]
                dmax = "   max|dgap| %.3f" % (max(abs(x - y) for x, y in pairs) if pairs else 0)
            print("   %-10s %-4s lines=%d %s%s"
                  % (label, match, len(typ), fmt(typ), dmax))
    return 0


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
