r"""Measure what TeX puts on the page for a node body's `\\( ... \\)` vs `$ ... $` maths.

pdflatex + fitz: the fonts and glyphs each span reaches are the evidence that the plain-TeX
delimiter opens maths, and that a line break `\\\\` followed by `(i)` is prose -- the two facts
NODE_MATH relies on. Runs in the sandbox directory and prints one line per case.
"""
import sys
import subprocess
from pathlib import Path

import fitz

# Greek letters and minus signs reach the console as UTF-8, never as the shell's code page
sys.stdout.reconfigure(encoding="utf-8", errors="replace")

HERE = Path(__file__).resolve().parent
PREAMBLE = r"""\documentclass[tikz,border=2pt]{standalone}
\begin{document}
\begin{tikzpicture}[font=\small]
"""
POSTAMBLE = r"\end{tikzpicture}" + "\n" + r"\end{document}" + "\n"

CASES = {
    # the paper's own legend line, plain-TeX delimiter
    "nm_paren": r"\node (a) at (0,0) {\(D(D-1)\) terms};",
    # the same content through the dollar delimiter
    "nm_dollar": r"\node (a) at (0,0) {$D(D-1)$ terms};",
    "nm_greek_paren": r"\node (a) at (0,0) {mean in \([\alpha-\eta,\alpha+\eta]\)};",
    "nm_greek_dollar": r"\node (a) at (0,0) {mean in $[\alpha-\eta,\alpha+\eta]$};",
    # a line break immediately followed by a bracketed note: prose, not maths
    "nm_rowbreak": r"\node (a) at (0,0) {Nested pairs\\(i) terms};",
    # a line break, whitespace, then real inline maths
    "nm_rowbreak_math": r"\node (a) at (0,0) {Nested pairs\\ (i)\((i+1)\) terms};",
}


def build(name, body):
    tex = PREAMBLE + body + "\n" + POSTAMBLE
    d = HERE / ("nm_" + name)
    d.mkdir(exist_ok=True)
    src = d / "c.tex"
    src.write_text(tex, encoding="utf-8")
    subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory",
                    str(d), src.name], cwd=d, capture_output=True)
    doc = fitz.open(str(d / "c.pdf"))
    out = []
    for block in doc[0].get_text("dict")["blocks"]:
        for line in block.get("lines", []):
            for span in line["spans"]:
                out.append((span["font"], span["text"]))
    doc.close()
    return out


for name, body in CASES.items():
    print("== %s" % name)
    for font, text in build(name, body):
        print("   %-28s %r" % (font, text))
