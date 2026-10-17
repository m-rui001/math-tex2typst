r"""Price a node's own label vertically at \\small, the size the corpus's flowcharts set.

`_work/measure_node_vertical_ink.py` did the law at 10/11/12pt through the document class; the
Turn-Based flowchart that `test_a_node_sized_by_its_own_text_stands_tall_enough_to_be_stepped_over`
pins instead writes `[font=\\small]`, and cmr9 is not a scaled cmr10 -- its glyphs keep their own
heights and its baseline skip is the 11pt TeX keeps at that size. So the same two parts are read
here at \\small: TeX's `\\ht\\box0 + \\dp\\box0` for the ink, and what the node adds as `inner sep`.
"""
import io
import os
import re
import subprocess
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "pic-vertical-ink-small")
os.makedirs(OUT, exist_ok=True)

LABELS = [
    ("P", "P"), ("T", "T"), ("one", "one"), ("x", "x"), ("Readout", "Readout"),
    ("$x_i^2$", "$x_i^2$"), ("$KX_1(D)$", "$KX_1(D)$"),
    ("one\\\\[3pt]two\\\\three\\\\four\\\\five\\\\six",
     "one\\\\[3pt]two\\\\three\\\\four\\\\five\\\\six"),
]

TEMPLATE = r"""\documentclass[10pt]{article}
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


def run(opts):
    tag = opts.replace("=", "").replace("innersep", "i") or "plain"
    name = "small-%s.tex" % (re.sub(r"[^A-Za-z0-9-]", "", tag) or "plain")
    body = "\n".join(r"""\begin{tikzpicture}
  \node[%s] (n%d) at (0,0) {%s};
  \report{n%d}{%d}{{\small %s}}
\end{tikzpicture}""" % (opts, i, tex, i, i, tex)
                    for i, (_, tex) in enumerate(LABELS))
    open(os.path.join(OUT, name), "w", encoding="utf-8").write(TEMPLATE.replace("@BODY@", body))
    subprocess.run(["pdflatex", "-interaction=nonstopmode", name], cwd=OUT,
                   capture_output=True, text=True)
    log = open(os.path.join(OUT, name[:-4] + ".log"), encoding="utf-8", errors="replace").read()
    got = {}
    for i, ht, dp, n, s in re.findall(
            r"GOT (\d+) HT=([\d.]+)pt ?DP=([\d.]+)pt ?N=([\d.]+)pt ?S=([\d.]+)pt", log):
        got[int(i)] = tuple(float(v) for v in (ht, dp, n, s))
    return got


plain = run("font=\\small")
tight = run("font=\\small,inner sep=0pt")
print("=== font=\\small (cmr9, 9pt / 11pt baseline) ===")
print("%-42s %7s %7s %8s %8s | %7s %7s" % ("label", "ht", "dp", "total", "tot0", "ink/em", "sep/em"))
for i, (name, _) in enumerate(LABELS):
    if i not in plain or i not in tight:
        print("%-44s  (no reading)" % name)
        continue
    ht, dp, n, s = plain[i]
    ht0, dp0, n0, s0 = tight[i]
    print("%-42s %7.4f %7.4f %8.4f %8.4f | %7.4f %7.4f"
          % (name, ht, dp, n + s, n0 + s0, (ht + dp) / 9.0, (n + s - n0 - s0) / 2 / 9.0))
