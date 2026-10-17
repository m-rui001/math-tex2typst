r"""#92 end-to-end gauge: the 29 refused labels, NEW emission vs the author's own TikZ.

`_work/measure92_math_forms.py` asked whether a candidate compiles and `_work/
measure92_math_fidelity.py` distilled each family's glyph geometry; this reads the two sides
through the SAME door the batch uses.  For every site listed by `_work/probe92_refused_sites.py`
(`_work/m92_sites.txt`) the author's own `$...$` span is put in a one-node `tikzpicture` and run
twice: through pdflatex, and through `cetz.build` + `typst` at Typst's default 10pt against TeX's
article 10pt.  Both pages are read back as the lines they carry -- glyph sequence and every ink
gap -- so a stacked fraction, a dropped slash or a charged boundary space shows as a number
instead of as a claim.

Three BASELINE spans are not refusals: `$E/2$` (a slash the guard already passes, whose Typst
shape is a fraction and must be compared as pre-existing, not as this round's change) and
`$W_{s}$`, `$12$` (spelling the emitter already ships), so a difference in a subscript's kern or
in a digit's box is attributed to the engines rather than to the new pass.

  python _work/probe92_sites_fidelity.py > _work/m92_fidelity_e2e.txt
"""
import os
import re
import subprocess
import sys
import unicodedata

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, ROOT)
sys.path.insert(0, os.path.join(ROOT, "tools"))
TMP = os.path.join(ROOT, "_work", "_m92e2e")
SITES = os.path.join(ROOT, "_work", "m92_sites.txt")


def fold(text):
    out = unicodedata.normalize("NFKD", text)
    return "".join(c for c in out
                   if unicodedata.combining(c) == 0 and not (0xFE00 <= ord(c) <= 0xFE0F))


def lines(pdf):
    """[(glyph string, [ink gaps])] for one page, in y order; leading/trailing spaces dropped."""
    doc = fitz.open(pdf)
    out = []
    for block in doc[0].get_text("rawdict")["blocks"]:
        for line in block.get("lines", []):
            chars = [(fold(c["c"]), fitz.Rect(c["bbox"]))
                     for sp in line["spans"] for c in sp["chars"]]
            chars = [(c, r) for c, r in chars if c.strip()]
            if not chars:
                continue
            out.append((line["bbox"][1], "".join(c for c, _r in chars),
                        [round(chars[k + 1][1].x0 - chars[k][1].x1, 2)
                         for k in range(len(chars) - 1)]))
    doc.close()
    return [(s, g) for _y, s, g in sorted(out)]


def read_sites():
    """[(family, paper, author span)] in the order `probe92_refused_sites.py` printed them."""
    rows, fam, paper = [], "", ""
    for raw in open(SITES, encoding="utf-8"):
        if raw.startswith("== "):
            fam = raw[3:].split(":")[0].strip()
        elif raw.startswith("        author"):
            rows.append((fam, paper, raw.split("author", 1)[1].strip()))
        elif raw.startswith("   ") and not raw.startswith("        "):
            paper = raw.strip()
    return rows


def tex_page(name, span):
    tex = os.path.join(TMP, name + ".tex")
    pdf = os.path.join(TMP, name + ".pdf")
    open(tex, "w", encoding="utf-8").write(
        r"\documentclass[10pt]{article}\pagestyle{empty}\usepackage{tikz}\begin{document}"
        r"\begin{tikzpicture}[x=1cm]\node at (0,0) {$SPAN$};\end{tikzpicture}"
        r"\end{document}\n".replace("SPAN", span))
    subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", TMP, tex],
                   cwd=TMP, capture_output=True)
    return lines(pdf) if os.path.exists(pdf) else [("pdflatex failed", [])]


def typ_page(name, span):
    """The canvas a one-node picture with this label now builds, and the page it compiles to.

    Whether the span travelled as maths or as the guard's quoted fallback is read off the GUARD's
    own verdict -- a spy records it, because a page cannot tell them apart (a Typst string and a
    math letter come back as the same characters from the text layer) and the emission's first
    character cannot either: `\operatorname{Morse}(M)-...` legitimately opens with a quoted word
    the same way the fallback does.
    """
    from t2t import cetz
    verdict = []
    real = cetz.math_safe

    def spy(tex):
        got = real(tex)
        verdict.append(got)
        return got

    cetz.math_safe = spy
    try:
        cetz._math_body(span)
    finally:
        cetz.math_safe = real
    leg = "math" if verdict and verdict[0] else "QUOTED"
    pic = r"\begin{tikzpicture}\node at (0,0) {$%s$};\end{tikzpicture}" % span
    canvas = cetz.build(cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", pic), 15.79))
    pdf = os.path.join(TMP, name + ".pdf")
    if canvas is None:
        return leg, [("<no canvas>", [])]
    open(os.path.join(TMP, name + ".typ"), "w", encoding="utf-8").write(
        cetz.HEADER + "#set page(width: 300pt, height: 120pt, margin: 20pt)\n" + canvas)
    if os.path.exists(pdf):
        os.remove(pdf)
    r = subprocess.run(["typst", "compile", "--diagnostic-format", "short",
                        os.path.join(TMP, name + ".typ"), pdf],
                       capture_output=True, text=True, encoding="utf-8", errors="replace")
    if not os.path.exists(pdf):
        return leg, [("<FAILED %s>" % ((r.stderr or "").strip().splitlines() or ["?"])[0][:60], [])]
    return leg, lines(pdf)


def main():
    os.makedirs(TMP, exist_ok=True)
    rows = read_sites()
    print("sites read: %d" % len(rows))
    tally, seen = {}, set()
    for i, (fam, paper, span) in enumerate(rows):
        key = (fam, span)
        if key in seen:
            continue
        seen.add(key)
        name = "s%02d" % i
        ctl = tex_page(name, span)
        leg, typ = typ_page(name, span)
        verdict = check(ctl, typ, leg)
        tally[verdict] = tally.get(verdict, 0) + 1
        print("\n%-4s %-10s $%s$" % (verdict, fam, span))
        print("     tex  %s" % fmt(ctl))
        print("     typ  %s" % fmt(typ))
    print("\n== distinct sites %d   %s" % (len(seen), tally))
    for span in (r"E/2", r"W_{s}", r"12", r"a_{0}b", r"\#A"):
        name = "base" + re.sub(r"\W", "", span)
        ctl = tex_page(name, span)
        leg, typ = typ_page(name, span)
        print("\n%s BASELINE $%s$\n     tex  %s\n     typ  %s"
              % (check(ctl, typ, leg), span, fmt(ctl), fmt(typ)))
    return 0


def fmt(rows):
    return " | ".join("%-16s %s" % (s, g) for s, g in rows)


def check(ctl, typ, leg):
    if any(s.startswith("<") for s, _g in typ):
        return "FAIL"
    if leg == "QUOTED":
        return "QUOTED"
    return "==" if [s for s, _g in typ] == [s for s, _g in ctl] else "!="


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
