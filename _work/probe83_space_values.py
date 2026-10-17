r"""How much ink does pandoc's Typst spelling of a TeX space command actually move?

pandoc's typst writer answers `\!` with `#h(-1em)` and `\;` with `#h(0em)`. TeX prices those at -3mu and
+5mu with 18mu = 1em, i.e. -0.1667em and +0.2778em. This probe measures the **page** consequence: set
`A<space>B` three ways in Typst (pandoc's spelling, TeX's value, and a control with no space at all) and
in pdflatex, and read the gap between the two glyphs' ink.

  python _work/probe83_space_values.py

Nothing here decides the fix; it only says what each spelling is worth in points.
"""
import os
import subprocess
import sys
import unicodedata

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TMP = os.path.join(ROOT, "_work", "_m83")
os.makedirs(TMP, exist_ok=True)

CASES = [
    ("pandoc \\!", "$A #h(-1em) B$"),
    ("tex \\! = -0.1667em", "$A #h(-0.1667em) B$"),
    ("no space", "$A B$"),
    ("pandoc \\;", "$A #h(0em) B$"),
    ("tex \\; = 0.2778em", "$A #h(0.2778em) B$"),
    ("pandoc \\enspace", "$A #h(0em) B$"),
    ("tex \\enspace = 0.5em", "$A #h(0.5em) B$"),
    ("pandoc \\, (thin)", "$A thin B$"),
    ("tex \\, = 0.1667em", "$A #h(0.1667em) B$"),
    ("pandoc \\: (med)", "$A med B$"),
    ("tex \\: = 0.2222em", "$A #h(0.2222em) B$"),
]


def chars(pdf):
    """Every glyph box on page 1 as (char, x0, x1) -- words are no use here, both engines glue `A\\!B`
    into one text run, and the whole question is where the two glyphs sit relative to each other."""
    doc = fitz.open(pdf)
    out = [(c["c"], c["bbox"][0], c["bbox"][2])
           for b in doc[0].get_text("rawdict")["blocks"] if b.get("lines")
           for l in b["lines"] for s in l["spans"] for c in s["chars"] if c["c"].strip()]
    doc.close()
    return out


def pair_gap(glyphs):
    # Typst sets maths italic letters to the mathematical-alphanumeric block (U+1D434 for A), so the
    # character has to be folded back to its base letter before it can match the pdflatex side.
    fold = lambda c: unicodedata.normalize("NFKD", c)[0] if c.isalpha() else c
    a = [g for g in glyphs if fold(g[0]) == "A"]
    b = [g for g in glyphs if fold(g[0]) == "B"]
    if not a or not b:
        return None, ["no A/B pair: %r" % (glyphs,)]
    return min(g[1] for g in b) - max(g[2] for g in a), None


def typst_gap(body, name, size=11.0):
    src = '#set page(width: 6cm, height: 2cm, margin: 0cm)\n#set text(size: %spt)\n%s\n' % (size, body)
    typ = os.path.join(TMP, name + ".typ")
    pdf = os.path.join(TMP, name + ".pdf")
    open(typ, "w", encoding="utf-8").write(src)
    r = subprocess.run(["typst", "compile", typ, pdf], capture_output=True, text=True)
    if r.returncode:
        return None, r.stderr.strip().splitlines()[:1]
    return pair_gap(chars(pdf))


def pdflatex_gap(body, name):
    tex = ("\\documentclass[11pt]{article}\\usepackage{amsmath}\\pagestyle{empty}\n"
           "\\begin{document}\n%s\n\\end{document}\n" % body)
    path = os.path.join(TMP, name + ".tex")
    open(path, "w", encoding="utf-8").write(tex)
    r = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", TMP, path],
                       capture_output=True, text=True, cwd=TMP)
    pdf = os.path.join(TMP, name + ".pdf")
    if not os.path.exists(pdf):
        return None, (r.stdout or "").strip().splitlines()[-2:]
    return pair_gap(chars(pdf))


def main():
    print("%-24s %-14s %-14s" % ("case", "typst gap pt", "pdflatex gap pt"))
    for i, (label, body) in enumerate(CASES):
        tex_src = {"pandoc \\!": "$A\\!B$", "tex \\! = -0.1667em": "$A\\!B$",
                   "no space": "$AB$", "pandoc \\;": "$A\\;B$", "tex \\; = 0.2778em": "$A\\;B$",
                   "pandoc \\enspace": "$A\\enspace B$", "tex \\enspace = 0.5em": "$A\\enspace B$",
                   "pandoc \\, (thin)": "$A\\,B$", "tex \\, = 0.1667em": "$A\\,B$",
                   "pandoc \\: (med)": "$A\\:B$", "tex \\: = 0.2222em": "$A\\:B$"}[label]
        tg, terr = typst_gap(body, "t%d" % i)
        pg, perr = pdflatex_gap(tex_src, "p%d" % i)
        print("%-24s %-14s %-14s   %s"
              % (label, "%.3f" % tg if tg is not None else "ERR " + str(terr),
                 "%.3f" % pg if pg is not None else "ERR " + str(perr), tex_src))
    return 0


if __name__ == "__main__":
    sys.exit(main())
