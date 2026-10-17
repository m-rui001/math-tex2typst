r"""How tall is a node's own label, and where does its centre sit in that height?

#73 fixed the horizontal axis (a node nobody sized gets its half-width from the ink); the vertical
twin is still open: `_text_height` answers 0.1830cm for a one-line label while pdflatex puts the
same node at 0.2678cm for a bare `T` and 0.3978cm for `$F_{1,+}^{+,+}$`. A vertical arrow drawn to
such a node therefore stops short of the real box and prints its head inside the letters.

This gauge asks TeX for the two half-extents separately -- north above the centre and south below
it -- because TeX's box is NOT symmetric: the baseline sits inside it with an ascender above and a
descender below, and a sub/superscript moves each of those on its own. Comparing N+S with what
`_text_height` returns prices the law in the same units the converter uses.
"""
import io
import os
import re
import subprocess
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "pic-node-height")
os.makedirs(OUT, exist_ok=True)

LABELS = [
    "T", "Readout", "cut", "mapsto", "p_{\\mathrm{good}}", "one\\two",
    "$x_i^2$", "$F_{1,+}^{+,+}$", "$KX_1(D)$", "$E+u_0$", "$\\phi_H^1$",
    "$\\{\\ell^2\\}$", "$\\int_0^1 f$+", "Reset",
]

body = "\n".join(r"""\begin{tikzpicture}
  \node (n%d) at (0,0) {%s};
  \report{n%d}{%d}
\end{tikzpicture}""" % (i, lab, i, i) for i, lab in enumerate(LABELS))

tex = r"""\documentclass[11pt]{article}
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
""".replace("@BODY@", body)

open(os.path.join(OUT, "height.tex"), "w", encoding="utf-8").write(tex)
subprocess.run(["pdflatex", "-interaction=nonstopmode", "height.tex"], cwd=OUT,
               capture_output=True, text=True)
log = open(os.path.join(OUT, "height.log"), encoding="utf-8", errors="replace").read()

got = {}
for i, n, s in re.findall(r"GOT (\d+) N=([\d.]+)pt ?S=([\d.]+)pt", log):
    got[int(i)] = (float(n), float(s))

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(
    os.path.abspath(__file__))), "tools"))
from t2t import cetz  # noqa: E402

PT = 1.0 / 28.3465
print("label                    TeX north  TeX south   TeX total   ours    diff(pt)")
for i, lab in enumerate(LABELS):
    if i not in got:
        print("%-24s  (no reading)" % lab)
        continue
    north, south = got[i]
    ours = cetz._text_height({}, None, lab) / cetz.UNITS["pt"]
    print("%-24s %10.4f %10.4f %10.4f %8.4f %9.4f"
          % (lab, north, south, north + south, ours, north + south - ours))
print("\ncurrent constants: INNER_SEP=%r TEX_LINE_HEIGHT_PT[11]=%r NODE_BODY_SIZE_PT=%r"
      % (cetz.INNER_SEP, cetz.TEX_LINE_HEIGHT_PT.get(11), cetz.NODE_BODY_SIZE_PT))
print("half-extent asymmetry (north - south) is what a centred box must split:")
for i, lab in enumerate(LABELS):
    if i in got:
        print("  %-24s north %.4f south %.4f" % (lab, got[i][0], got[i][1]))
