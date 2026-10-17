r"""#92 fidelity gauge: what does each candidate emission put on the PAGE against real TikZ?

`_work/measure92_math_forms.py` asked Typst "does it compile, what characters" and won three
laws (bare `#` switches to code, a letter fused to a digit is one identifier, `*/` and `//` are
comments).  Its readings were all **display** maths -- a `$...$` alone in a paragraph -- and that
matters here: Typst draws `/` as a stacked fraction in display maths and as a slash in inline
maths, while a node label reaches CeTz as `[... $...$ ...]`.  So every candidate is re-read the
way the emitter sends it, and against a pdflatex control of the AUTHOR's own spelling at 10pt.

One page per case on BOTH sides, because a shared page needs a sentinel to find its row and a
row's own maths can contain another case's sentinel (`$A\#_p B$` holds both `a` and `p`).  The
sentinel letter opens each maths anyway -- it names the main line, and a stacked fraction puts its
numerator and denominator on LINES, so a page's reading is the list of its lines.

Verdict per candidate: the line strings must match the control's, and every ink gap must sit
inside a hair of the control's -- a boundary Typst charges for and TeX does not is exactly the
defect this gauge exists to catch.  Two baselines attribute a difference that is NOT the
candidate's: `$W_{s}$` (a grouped subscript the live guard already passes) and `$E/2$` (a slash it
already ships tight), so a subscript kern or Typst's own slash shape shows up on both sides.

  python _work/measure92_math_fidelity.py > _work/m92_fidelity.txt
"""
import os
import re
import subprocess
import sys
import unicodedata

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TMP = os.path.join(ROOT, "_work", "_m92fid")

# (name, sentinel, author TeX maths, [(candidate label, Typst maths body), ...])
CASES = [
    # -- ① a literal hash: 10 sites / 5 papers.  `F_\#` is a pushforward: the script's atom IS
    #    the character, so the escape has to survive being hung under a subscript.
    ("hash-script", "q", r"$F_\#A$",
     [("esc", r"$q F_\#A$"), ("str", r'$q F_"#"A$'), ("sym", r"$q F_#sym.hash A$")]),
    ("hash-plain", "w", r"$\#A$",
     [("esc", r"$w \#A$"), ("str", r'$w "#"A$'), ("sym", r"$w #sym.hash A$")]),
    ("hash-sup", "e", r"$\#^q$",
     [("esc", r"$e \#^q$"), ("str", r'$e "#"^(q)$'), ("sym", r"$e #sym.hash ^q$")]),
    ("hash-connect", "r", r"$A\#_p B$",
     [("esc", r"$r A\#_p B$"), ("str", r'$r A"#"_(p) B$'), ("sym", r"$r A#sym.hash _(p) B$")]),
    # -- ② a letter fused to a digit: 13 sites / 6 papers, in both shapes.
    ("fused-script", "t", r"$W_{s0}$",
     [("space", r"$t W_(s 0)$"), ("str0", r'$t W_(s"0")$'), ("grp", r"$t W_(s0)$")]),
    ("fused-top", "y", r"$l1$",
     [("space", r"$y l 1$"), ("str1", r'$y l"1"$')]),
    ("fused-power", "u", r"$n2^n$",
     [("space", r"$u n 2^n$"), ("str2", r'$u n"2"^n$'), ("grp", r"$u n(2)^n$")]),
    ("fused-digitrun", "i", r"$x_{ab12}$",
     [("space", r"$i x_(a b 1 2)$"), ("mix", r'$i x_(a b"12")$')]),
    # -- ③ `X_*` touching a division slash: 4 sites / 3 papers.
    ("star-slash", "o", r"$L_*/3$",
     [("space", r"$o L_* / 3$"), ("sym", r"$o L_* #sym.slash 3$"),
      ("str", r'$o L_*"/"3$'), ("div", r"$o L_* #sym.div.slash 3$")]),
    ("star-slash-half", "p", r"$L_*/2$",
     [("space", r"$p L_* / 2$"), ("sym", r"$p L_* #sym.slash 2$"),
      ("str", r'$p L_*"/"2$')]),
    # -- a plain slash, tight (what the emitter ships today) and spaced (the candidate form for
    #    the comment family), against TeX's inline slash.  Both stacked, both in two LINES: Typst
    #    reads `/` in a canvas as a FRACTION over the one atom that follows it (轴 77), so
    #    the question is what spells the slash GLYPH, and what it costs.
    ("inline-slash", "a", r"$E/2$",
     [("tight", r"$a E/2$"), ("space", r"$a E / 2$"), ("sym", r"$a E #sym.slash 2$"),
      ("str", r'$a E"/"2$'), ("div", r"$a E #sym.div.slash 2$")]),
    # -- a grouped subscript with nothing new in it: attributes the horizontal kern a script
    #    takes under its base to the engines, not to a hash or a boundary.
    ("script-baseline", "d", r"$W_{s}$", [("paren", r"$d W_(s)$")]),
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
    return lines(pdf, sent) if os.path.exists(pdf) else [("pdflatex failed", [])]


def fmt(rows):
    return " | ".join("%-12s %s" % (s, [round(v, 2) for v in g]) for s, g in rows)


def main():
    os.makedirs(TMP, exist_ok=True)
    for name, sent, math, cands in CASES:
        ctrl = [(s, g) for _m, s, g in control(name, sent, math)]
        print("\n== %s   TeX %s" % (name, math))
        print("   %-9s         %s" % ("CONTROL", fmt(ctrl)))
        for label, body in cands:
            got = compile_(os.path.join(TMP, "%s-%s.typ" % (name, label)),
                           PRE + "#text(size: 10pt)[%s]\n" % body)
            if isinstance(got, list):
                print("   %-9s FAILED   %s" % (label, got))
                continue
            typ = [(s, g) for _m, s, g in lines(got, sent)]
            match = "==" if [s for s, _g in typ] == [s for s, _g in ctrl] else "!="
            dmax = ""
            if match == "==" and any(g for _s, g in typ):
                pairs = [(x, y) for (_s, gx), (_s, gy) in zip(typ, ctrl) for x, y in zip(gx, gy)]
                dmax = "   max|dgap| %.3f" % max(abs(x - y) for x, y in pairs)
            print("   %-9s %-4s %s%s" % (label, match, fmt(typ), dmax))
    return 0


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
