r"""Where does `below left=12mm and -12mm of t` put a node whose boxes are sized by their words?

`placed_at` charges the reference's half-width and the placed node's own on every axis it moves. The
corpus test asserted the horizontal at exactly 12mm -- which is what that axis does when both boxes are
points -- and #73 gave a text-sized node a half-width, so the same statement now reads 0.6685cm. Only
pdflatex says which of the two is TikZ's answer: the numbers are the placed node's CENTRE, per axis,
against `t` at the origin, together with its half-extents so the law can be checked term by term.
"""
import io
import os
import re
import subprocess
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "pic-positioned-width")
os.makedirs(OUT, exist_ok=True)

CASES = [
    "below left=12mm and -12mm of t",
    "below left=12mm and 12mm of t",
    "left=12mm of t",
    "right=12mm of t",
    "below=12mm of t",
]

body = "\n".join(r"""\begin{tikzpicture}
  \node (t) at (0,0) {T};
  \node[%s] (n) {N};
  \report{n}{%d}
  \report{t}{%d}
\end{tikzpicture}""" % (opt, i, 100 + i) for i, opt in enumerate(CASES))

tex = r"""\documentclass[11pt]{article}
\usepackage{amsmath,amssymb}
\usepackage{tikz}
\makeatletter
\newcommand\report[2]{%
  \pgfextractx{\dimen0}{\pgfpointanchor{#1}{center}}%
  \pgfextracty{\dimen2}{\pgfpointanchor{#1}{center}}%
  \pgfextractx{\dimen4}{\pgfpointdiff{\pgfpointanchor{#1}{center}}{\pgfpointanchor{#1}{east}}}%
  \pgfextracty{\dimen6}{\pgfpointdiff{\pgfpointanchor{#1}{center}}{\pgfpointanchor{#1}{north}}}%
  \typeout{GOT #2 X=\the\dimen0 Y=\the\dimen2 E=\the\dimen4 N=\the\dimen6}}
\makeatother
\usetikzlibrary{positioning}
\begin{document}
@BODY@
\end{document}
""".replace("@BODY@", body)

open(os.path.join(OUT, "positioned_width.tex"), "w", encoding="utf-8").write(tex)
subprocess.run(["pdflatex", "-interaction=nonstopmode", "positioned_width.tex"], cwd=OUT,
               capture_output=True, text=True)
log = open(os.path.join(OUT, "positioned_width.log"), encoding="utf-8", errors="replace").read()

got = {}
for i, x, y, e, n in re.findall(
        r"GOT (\d+) X=(-?[\d.]+)pt ?Y=(-?[\d.]+)pt ?E=(-?[\d.]+)pt ?N=(-?[\d.]+)pt", log):
    got[int(i)] = tuple(float(v) / 28.3465 for v in (x, y, e, n))

print("%-36s %8s %8s %7s %7s" % ("option", "x cm", "y cm", "hw", "hh"))
for i, opt in enumerate(CASES):
    if i not in got:
        print("%-36s  (no reading)" % opt)
        continue
    print("%-36s %8.4f %8.4f %7.4f %7.4f" % ((opt,) + got[i]))
ref = [v for k, v in got.items() if k >= 100]
if ref:
    print("\nt (a bare {T} at the origin): hw=%.4f hh=%.4f" % (ref[0][2], ref[0][3]))
sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(
    os.path.abspath(__file__))), "tools"))
from t2t import cetz
print("cetz node_size({}, IDENT, 'N') = %s   'T' = %s"
      % (cetz.node_size({}, cetz.IDENT, "N"), cetz.node_size({}, cetz.IDENT, "T")))
