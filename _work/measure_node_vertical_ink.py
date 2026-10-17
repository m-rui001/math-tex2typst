r"""Price a node's own label vertically: the content box and the `inner sep` apart, at three sizes.

#74 is the vertical twin of #73. `_text_height` answers 10.3748pt for every one-line label -- it
takes 2*INNER_SEP plus TEX_LINE_HEIGHT_PT's one-line row read at 10pt, while the papers are 11pt --
where pdflatex puts a bare `T` at 15.1817pt and `$F_{1,+}^{+,+}$` at 22.5512pt (`total` is
center->north plus center->south, and those two come out *equal* for every label measured, so a
centred Typst box only needs the total). A vertical arrow drawn to such a node stops short of the
real box and prints its head inside the letters.

To write a law instead of a table of answers, the two parts have to be separated: TeX's own
`\ht\box0 + \dp\box0` for the label is the ink, and what the node adds on top of it is `inner sep`.
Each is printed in ems of the document's size, at 10pt/11pt/12pt, so a shape's price is the same
number whatever the size is -- which is the only way the converter can carry it.
"""
import io
import os
import re
import subprocess
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "pic-vertical-ink")
os.makedirs(OUT, exist_ok=True)

LABELS = [
    ("T", "T"), ("Readout", "Readout"), ("cut", "cut"), ("mapsto", "mapsto"),
    ("Reset", "Reset"), ("x", "x"), ("q", "q"), ("typical", "typical"),
    ("$x_i^2$", "$x_i^2$"), ("$F_{1,+}^{+,+}$", "$F_{1,+}^{+,+}$"),
    ("$KX_1(D)$", "$KX_1(D)$"), ("$E+u_0$", "$E+u_0$"),
    ("$\\phi_H^1$", "$\\phi_H^1$"), ("$\\{\\ell^2\\}$", "$\\{\\ell^2\\}$"),
    ("$\\int_0^1 f$", "$\\int_0^1 f$"), ("$\\frac{1}{2}$", "$\\frac{1}{2}$"),
    ("$a+b$", "$a+b$"), ("$y_1$", "$y_1$"), ("$e^x$", "$e^x$"),
    ("$\\mathcal{F}$", "$\\mathcal{F}$"), ("$\\overline{u}$", "$\\overline{u}$"),
    ("$H^1(X,\\mathcal{L})$", "$H^1(X,\\mathcal{L})$"),
    ("two\\\\three", "two\\\\three"), ("a\\\\b\\\\c", "a\\\\b\\\\c"),
]

TEMPLATE = r"""\documentclass[@SIZE@pt]{article}
\usepackage{amsmath,amssymb}
\usepackage{tikz}
\newdimen\measHT
\newdimen\measDP
\makeatletter
\newcommand\report[3]{%
  \setbox0\hbox{#3}%
  \measHT=\ht0 \measDP=\dp0 %
  \pgfextracty{\dimen6}{\pgfpointdiff{\pgfpointanchor{#1}{center}}{\pgfpointanchor{#1}{north}}}%
  \pgfextracty{\dimen8}{\pgfpointdiff{\pgfpointanchor{#1}{south}}{\pgfpointanchor{#1}{center}}}%
  \typeout{GOT #2 HT=\the\measHT DP=\the\measDP N=\the\dimen6 S=\the\dimen8}}
\makeatother
\begin{document}
@BODY@
\end{document}
"""


def run(size, opts):
    tag = opts.replace("=", "").replace("pt", "") or "default"
    body = "\n".join(r"""\begin{tikzpicture}
  \node[%s] (n%d) at (0,0) {%s};
  \report{n%d}{%d}{%s}
\end{tikzpicture}""" % (opts, i, tex, i, i, tex) for i, (_, tex) in enumerate(LABELS))
    name = "v%d-%s.tex" % (size, tag)
    open(os.path.join(OUT, name), "w", encoding="utf-8").write(
        TEMPLATE.replace("@SIZE@", str(size)).replace("@BODY@", body))
    subprocess.run(["pdflatex", "-interaction=nonstopmode", name], cwd=OUT,
                   capture_output=True, text=True)
    log = open(os.path.join(OUT, name[:-4] + ".log"), encoding="utf-8", errors="replace").read()
    got = {}
    for i, ht, dp, n, s in re.findall(
            r"GOT (\d+) HT=([\d.]+)pt ?DP=([\d.]+)pt ?N=([\d.]+)pt ?S=([\d.]+)pt", log):
        got[int(i)] = tuple(float(v) for v in (ht, dp, n, s))
    return got


for size in (10, 11, 12):
    plain = run(size, "")
    tight = run(size, "inner sep=0pt")
    print("\n=== documentclass[%dpt] ===" % size)
    print("%-22s %7s %7s %8s %8s | %7s %7s %7s %7s"
          % ("label", "ht", "dp", "total", "tot0", "ink/em", "sep/em", "tot/em", "tot0/em"))
    for i, (name, _) in enumerate(LABELS):
        if i not in plain or i not in tight:
            print("%-24s  (no reading)" % name)
            continue
        ht, dp, n, s = plain[i]
        ht0, dp0, n0, s0 = tight[i]
        print("%-22s %7.4f %7.4f %8.4f %8.4f | %7.4f %7.4f %7.4f %7.4f"
              % (name, ht, dp, n + s, n0 + s0, (ht + dp) / size,
                 (n + s - n0 - s0) / 2 / size, (n + s) / size, (n0 + s0) / size))
