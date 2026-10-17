r"""Which Typst name prints the glyph the LaTeX author wrote, for the symbols Typst has deprecated.

Two authorities, one table. pdflatex prints `\triangleleft` and friends and fitz reads the codepoint off
the page -- that is what the author wanted. Typst prints each candidate name and fitz reads that
codepoint too. A rename is only a cleanup where the two codepoints agree; where they differ the
deprecated name is the correct one and the warning has to be lived with (or the symbol has to be found
under a third name).

The candidates are not guessed: `lt.tri`/`gt.tri` are the spellings `_work/probe_deprecated_symbols.py`
found in the products, Typst's own hint supplies `lt.closed`/`gt.closed`/`tack.rr`, and the `.eq`
decorations are the same substitution tried on the decorated names, because the hint only ever names the
base symbol and `lt.tri.eq` (U+22B4) is a different glyph from `lt.closed` (U+22B2).
"""
import os
import pathlib
import subprocess
import sys

import fitz

OUT = pathlib.Path(__file__).resolve().parent
TMP = OUT / "symglyphs"
sys.stdout.reconfigure(encoding="utf-8", errors="replace")

TEX = [r"\triangleleft", r"\trianglelefteq", r"\triangleright", r"\trianglerighteq",
       r"\models", r"\vDash", r"\blacktriangleleft", r"\blacktriangleright", r"\sqsubseteq"]
TYP = ["lt.tri", "lt.closed", "lt.tri.eq", "lt.closed.eq", "lt.eq.tri",
       "gt.tri", "gt.closed", "gt.tri.eq", "gt.closed.eq", "gt.eq.tri",
       "tack.r.double", "tack.rr", "tack.r.double.long", "tack.l.double", "tack.ll",
       "triangle.l.filled", "triangle.r.filled", "subset.eq", "square.stroked.tiny"]


def read_lines(pdf):
    if not os.path.exists(pdf):
        return []
    doc = fitz.open(pdf)
    rows = [ln.strip() for p in doc for ln in p.get_text().splitlines() if ln.strip()]
    doc.close()
    return rows


def cp(s):
    return " ".join("U+%04X" % ord(c) for c in s if not c.isspace()) or "-"


def main():
    TMP.mkdir(parents=True, exist_ok=True)
    tex = TMP / "texglyphs.tex"
    tex.write_text(r"\documentclass{article}" "\n" r"\usepackage{amssymb}" "\n"
                   r"\usepackage[paperwidth=3in,paperheight=8in,margin=6pt]{geometry}" "\n"
                   r"\begin{document}" "\n"
                   + "".join("\\[%s\\]\\par\n" % c for c in TEX)
                   + r"\end{document}" "\n", encoding="utf-8")
    subprocess.run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error",
                    "-output-directory", str(TMP), str(tex)],
                   capture_output=True, text=True, encoding="utf-8", errors="replace")
    print("LaTeX (pdflatex + fitz):")
    for cmd, row in zip(TEX, read_lines(TMP / "texglyphs.pdf")):
        print("  %-22s %-6s %s" % (cmd, row, cp(row)))

    print("\nTypst (one compile per name, so an unknown one cannot hide the rest):")
    for name in TYP:
        one = TMP / ("one-%s.typ" % name)
        one.write_text("#set page(width: 200pt, height: auto, margin: 6pt)\n$%s$\n" % name,
                       encoding="utf-8")
        r = subprocess.run(["typst", "compile", str(one), str(TMP / ("one-%s.pdf" % name))],
                           capture_output=True, text=True, encoding="utf-8", errors="replace")
        rows = read_lines(TMP / ("one-%s.pdf" % name))
        note = next((ln for ln in (r.stderr or "").splitlines()
                     if ln.startswith(("error", "warning"))), "")
        print("  %-22s %-6s %-14s %s" % (name, rows[0] if rows else "-",
                                         cp(rows[0]) if rows else "-", note))


if __name__ == "__main__":
    main()
