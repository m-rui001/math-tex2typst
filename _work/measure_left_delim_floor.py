r"""Price a `\left ... \right` node label whose body is SHORTER than the delimiter.

`_work/node_glyph_heights.txt` only ever caught `\left` around a tall body, where the stretch law
already answers what pdflatex does. TeX's other half is a floor: the delimiter is never shrunk
below its own sized glyph, so `\left(x\right)` stands as tall as `\left(\frac{1}{2}\right)` even
though its body is a 0.431em x-height. Without that floor a vertical arrow into such a node stops
inside the parenthesis -- the same print-in-the-ink defect #74 is about. Each label is set in a
bare `\node` at 10, 11 and 12pt and at `\small`, and the box is read as center->north +
center->south in ems of the document size.
"""
import io
import os
import re
import subprocess
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "pic-left-floor")
os.makedirs(OUT, exist_ok=True)

LABELS = [
    r"$\left(x\right)$", r"$\left(a\right)$", r"$\left\{u\right\}$", r"$\left|q\right|$",
    r"$\left(x^{2}\right)$", r"$\left(\frac{1}{2}\right)$", r"$\left(\sum_i a\right)$",
    r"$\left(x\right)y$", r"$\left(\int_0^1 f\right)$", r"$\left\{\frac{1}{2}\right\}$",
    r"map to $\left(x\right)$",
]

TEMPLATE = r"""\documentclass[@SIZE@pt]{article}
\usepackage{amsmath,amssymb}
\usepackage{tikz}
\makeatletter
\newcommand\report[2]{%
  \pgfextracty{\dimen6}{\pgfpointdiff{\pgfpointanchor{#1}{center}}{\pgfpointanchor{#1}{north}}}%
  \pgfextracty{\dimen8}{\pgfpointdiff{\pgfpointanchor{#1}{south}}{\pgfpointanchor{#1}{center}}}%
  \typeout{GOT #2 N=\the\dimen6 S=\the\dimen8}}
\makeatother
\begin{document}
@BODY@
\end{document}
"""


def run(size, opts, tag):
    body = "\n".join(r"""\begin{tikzpicture}
  \node%s (n%d) at (0,0) {%s};
  \report{n%d}{%d}
\end{tikzpicture}""" % (opts, i, tex, i, i) for i, tex in enumerate(LABELS))
    name = "l%d-%s.tex" % (size, tag)
    open(os.path.join(OUT, name), "w", encoding="utf-8").write(
        TEMPLATE.replace("@SIZE@", str(size)).replace("@BODY@", body))
    subprocess.run(["pdflatex", "-interaction=nonstopmode", name], cwd=OUT,
                   capture_output=True, text=True)
    log = open(os.path.join(OUT, name[:-4] + ".log"), encoding="utf-8", errors="replace").read()
    got = {}
    for i, n, s in re.findall(r"GOT (\d+) N=([\d.]+)pt ?S=([\d.]+)pt", log):
        got[int(i)] = (float(n), float(s))
    return got


print("%-34s %9s %9s %9s %9s" % ("label", "10pt/em", "11pt/em", "12pt/em", "small/em"))
reads = [run(size, "", "plain") for size in (10, 11, 12)] + [run(10, "[font=\\small]", "small")]
for i, tex in enumerate(LABELS):
    cols = []
    for size, got in zip((10, 11, 12, 10), reads):
        if i not in got:
            cols.append("  --  ")
            continue
        n, s = got[i]
        cols.append("%9.4f" % ((n + s) / size))
    print("%-34s %s" % (tex, " ".join(cols)))
