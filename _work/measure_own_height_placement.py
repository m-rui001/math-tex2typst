r"""Does TikZ charge a placed node its OWN half-height when it hangs off a bare point?

The two placement tests that moved both hang a one-line node off a `coordinate` or a calc point,
where the converter used to charge the written gap alone. Loads the libraries the syntax needs
(`calc` for `$(A)!0.5!(B)$`, which silently misplaces the node without it -- the mistake this probe
made first) and reads every anchor of every node, so the centre can be compared with
`reference - gap - own half-height`.
"""
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, "_work", "sizecheck")
os.makedirs(OUT, exist_ok=True)
sys.stdout.reconfigure(errors="replace")

DOC = r"""\documentclass[10pt]{article}
\usepackage{tikz}
\usetikzlibrary{calc,positioning}
\newcount\cnt
\def\report#1{%
  \pgfextractx{\dimgx}{\pgfpointanchor{#1}{east}}%
  \pgfextractx{\dimgw}{\pgfpointanchor{#1}{west}}%
  \pgfextracty{\dimgn}{\pgfpointanchor{#1}{north}}%
  \pgfextracty{\dimgs}{\pgfpointanchor{#1}{south}}%
  \pgfextractx{\dimgc}{\pgfpointanchor{#1}{center}}%
  \pgfextracty{\dimgy}{\pgfpointanchor{#1}{center}}%
  \typeout{NODE #1 X=\the\dimgc\space Y=\the\dimgy\space N=\the\dimgn\space S=\the\dimgs
    \space E=\the\dimgx\space W=\the\dimgw}%
}
\begin{document}
\begin{tikzpicture}
  \coordinate (A) at (0,0);
  \coordinate (B) at (6,0);
  \coordinate (o) at (3,0);
  \node (n) at (0,-3) {N};
  \node (p) [below=1cm of o] {N};
  \node (r) [below=1cm of $(A)!0.5!(B)$] {N};
  \node (q) [below left=1cm and 2cm of n] {N};
  \report{n}\report{p}\report{r}\report{q}
\end{tikzpicture}
\end{document}
"""
tex = os.path.join(OUT, "placeown2.tex")
DOC = DOC.replace("\\dimgx", "\\dimen1").replace("\\dimgw", "\\dimen2").replace(
    "\\dimgn", "\\dimen3").replace("\\dimgs", "\\dimen4").replace(
    "\\dimgc", "\\dimen5").replace("\\dimgy", "\\dimen6")
open(tex, "w", encoding="utf-8").write(DOC)
subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", OUT, tex],
               capture_output=True)
log = open(os.path.join(OUT, "placeown2.log"), encoding="utf-8", errors="replace").read()
PT = 1 / 28.3465
rows = {}
for m in re.finditer(r"NODE (\S+) X=(-?[\d.]+)pt\s*Y=(-?[\d.]+)pt\s*N=(-?[\d.]+)pt\s*S=(-?[\d.]+)pt"
                     r"\s*E=(-?[\d.]+)pt\s*W=(-?[\d.]+)pt", log.replace("\n", " ").replace("  ", " ")):
    rows[m.group(1)] = [float(m.group(i)) * PT for i in range(2, 8)]
for nm, v in rows.items():
    x, y, north, south, east, west = v
    print("%-3s centre=(%7.4f, %7.4f) half-h=%7.4f half-w=%7.4f north=%7.4f south=%7.4f"
          % (nm, x, y, (north - south) / 2, (east - west) / 2, north, south))
if "p" in rows and "n" in rows:
    print("p: written gap 1cm below point o(3,0); o.south - gap - own half-h = %.4f, engine says %.4f"
          % (0 - 1.0 - (rows["p"][2] - rows["p"][3]) / 2, rows["p"][1]))
if "q" in rows and "n" in rows:
    own = (rows["q"][2] - rows["q"][3]) / 2
    ref = (rows["n"][2] - rows["n"][3]) / 2
    print("q: n.y - ref half-h - 1cm - own half-h = %.4f, engine says %.4f"
          % (rows["n"][1] - ref - 1.0 - own, rows["q"][1]))
