r"""Measure how wide a TikZ node's own label is, in pgf's eyes, and where its border sits.

`_clip_to_border` stops a line at the node's border, and for a node whose box the author never fixed
the converter has no half-width to stop at -- so the arrow runs to the centre and its head prints
inside the letters (the three witnesses: Novikov p14's square, BSD p16's diamond, Factor-Two p14).
pgf does have that width: it is the text box TeX measured plus `inner sep` on each side. So pdflatex
answers, per label, the text box (`\setbox0=\hbox`), the node's border-to-border extent and its
centre-to-east / centre-to-north distances -- the estimator we ship has to reproduce those.

`\typeout` cannot read `let` registers (they live inside the path), so the geometry comes from
`\pgfpointdiff`/`\pgfextractx` inside a macro instead.
"""
import io
import os
import re
import subprocess
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "pic-label-ink")
os.makedirs(OUT, exist_ok=True)

LABELS = [
    r"$U_+$", r"$U_-$", r"$U_f$", r"$U_s$", r"$U$", r"$X$", r"$X^+$", r"$D_n$", r"$D_{n+1}$",
    r"$KX_1(B)$", r"$K_1(C^*(D))$", r"$K_1(C^*(X))$", r"$Y\times Y$", r"$\mathcal{P}(Y)$",
    r"$v=r$", r"$t\in[2,5]$", r"$\beta$", r"$e_{\mathrm{Roe}}$", r"$\Phi_*$",
    "an annulus", "Sections 3--6", "Readout", "cut", "Preparation",
]

# Built with placeholders because every `%` in a LaTeX prefix is a format character to `%`.
one = (
    "\\begin{tikzpicture}\n"
    "  \\setbox0=\\hbox{@L@}\\typeout{TEXT @I@ W=\\the\\wd0}\n"
    "  \\node (a) at (0,0) {@L@};\n"
    "  \\report{a}{@I@}\n"
    "\\end{tikzpicture}\n"
)
body = "".join(one.replace("@L@", lab).replace("@I@", str(i)) for i, lab in enumerate(LABELS))

head = (
    "\\documentclass[11pt]{article}\n"
    "\\usepackage{amsmath,amssymb}\n"
    "\\usepackage{tikz}\n"
    "\\makeatletter\n"
    "\\newcommand\\report[2]{%\n"
    "  \\pgfextractx{\\dimen0}{\\pgfpointdiff{\\pgfpointanchor{#1}{south west}}{\\pgfpointanchor{#1}{north east}}}%\n"
    "  \\pgfextracty{\\dimen2}{\\pgfpointdiff{\\pgfpointanchor{#1}{south west}}{\\pgfpointanchor{#1}{north east}}}%\n"
    "  \\pgfextractx{\\dimen4}{\\pgfpointdiff{\\pgfpointanchor{#1}{center}}{\\pgfpointanchor{#1}{east}}}%\n"
    "  \\pgfextracty{\\dimen6}{\\pgfpointdiff{\\pgfpointanchor{#1}{center}}{\\pgfpointanchor{#1}{north}}}%\n"
    "  \\typeout{NODE #2 W=\\the\\dimen0 H=\\the\\dimen2 E=\\the\\dimen4 N=\\the\\dimen6}}\n"
    "\\makeatother\n"
    "\\begin{document}\n"
)
tex = head + body + "\\end{document}\n"

with open(os.path.join(OUT, "label_ink.tex"), "w", encoding="utf-8") as fh:
    fh.write(tex)
subprocess.run(["pdflatex", "-interaction=nonstopmode", "label_ink.tex"], cwd=OUT,
               capture_output=True, text=True)
log = open(os.path.join(OUT, "label_ink.log"), encoding="utf-8", errors="replace").read()

rows = {}
for kind, i, rest in re.findall(r"(NODE|TEXT) (\d+) ([^\r\n]*)", log):
    rows.setdefault(int(i), {})[kind] = dict(
        (k, float(v)) for k, v in re.findall(r"([WHEND])=([-\d.]+)pt", rest))

print("%-20s %7s %7s | %7s %7s %7s | %6s %6s %5s"
      % ("label", "text W", "node W", "east-c", "north-c", "node H", "W-text", "pt/glyph", "glyph"))
for i, lab in enumerate(LABELS):
    t = rows.get(i, {}).get("TEXT", {})
    n = rows.get(i, {}).get("NODE", {})
    g = len(re.sub(r"[^A-Za-z0-9+*()=,\[\]]", "", lab))
    if not n:
        print("%-20s  (no reading)" % lab)
        continue
    print("%-20s %7.3f %7.3f | %7.3f %7.3f %7.3f | %6.3f %6.3f %5d"
          % (lab, t.get("W", 0.0), n.get("W", 0.0), n.get("E", 0.0), n.get("N", 0.0),
             n.get("H", 0.0), n.get("W", 0.0) - t.get("W", 0.0),
             n.get("W", 0.0) / g if g else 0.0, g))
print("\ninner sep default at 11pt = 0.3333em = %.4fpt; two sides = %.4fpt"
      % (11 * 0.3333, 2 * 11 * 0.3333))
