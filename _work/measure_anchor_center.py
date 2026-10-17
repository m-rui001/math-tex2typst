r"""Does an anchored node sit OFFSET from the coordinate it names, and by how much?

`_named_box_entry` records a node's CENTRE in the name table, which is the coordinate stepped back
along the anchor's own direction by the box's half-extent there -- `anchor=west` at (2.7, 0) puts the
centre east of 2.7cm, not on it. The converter only had that reading for Typst, which lays the body
out and moves it by its own measure; the table, and every line drawn to `(a.west)`, read the
coordinate as the centre while the labels had no width to step by. pdflatex answers the centre per
option, together with the half-extents so the step can be checked term by term.
"""
import io
import os
import re
import subprocess
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "pic-anchor-center")
os.makedirs(OUT, exist_ok=True)

CASES = [
    ("", "centred, nothing pinned"),
    ("anchor=west", "west on the coordinate"),
    ("anchor=north", "north on the coordinate"),
    ("anchor=north east", "corner on the coordinate"),
    ("above", "bare side word: south pinned, no move"),
    ("above=20pt", "south pinned 20pt above the coordinate"),
]

body = "\n".join(r"""\begin{tikzpicture}
  \coordinate (t) at (0,0);
  \node[%s] (n) at (3cm, 1cm) {$F_{1,+}^{+,+}$};
  \report{n}{%d}
\end{tikzpicture}""" % (opt, i) for i, (opt, _) in enumerate(CASES))

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

open(os.path.join(OUT, "anchor_center.tex"), "w", encoding="utf-8").write(tex)
subprocess.run(["pdflatex", "-interaction=nonstopmode", "anchor_center.tex"], cwd=OUT,
               capture_output=True, text=True)
log = open(os.path.join(OUT, "anchor_center.log"), encoding="utf-8", errors="replace").read()

got = {}
for i, x, y, e, n in re.findall(
        r"GOT (\d+) X=(-?[\d.]+)pt ?Y=(-?[\d.]+)pt ?E=(-?[\d.]+)pt ?N=(-?[\d.]+)pt", log):
    got[int(i)] = tuple(float(v) / 28.3465 for v in (x, y, e, n))

CM3, CM1 = 3.0, 1.0
print("%-22s %-30s %8s %8s | %8s %8s" % ("option", "meaning", "centre x", "centre y",
                                         "step x", "step y"))
sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(
    os.path.abspath(__file__))), "tools"))
from t2t import cetz
DOT = chr(92) + "draw"
for i, (opt, why) in enumerate(CASES):
    if i not in got:
        print("%-22s %-30s  (no reading)" % (opt or "(none)", why))
        continue
    x, y, e, n = got[i]
    # what the name table records, read back through the anchor `(n.center)` resolves to
    canvas = cetz.build(r"\begin{tikzpicture}\node[" + opt + r"] (n) at (3cm, 1cm) "
                        r"{$F_{1,+}^{+,+}$};" + DOT + " (n.center) -- (0,0);\end{tikzpicture}")
    ours = re.findall(r"line\(\((-?[\d.]+), (-?[\d.]+)\)", canvas or "")
    print("%-22s %-30s %8.4f %8.4f | %8.4f %8.4f   cetz records %s (hw=%.4f hh=%.4f)"
          % (opt or "(none)", why, x, y, x - CM3, y - CM1, ours[0] if ours else None, e, n))
