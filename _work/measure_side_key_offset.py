r"""Where does a node written `above=20pt` actually land? Read it from the engine.

The converter treats `above` / `below` / `left` / `right` as an anchor only when the word stands
alone (`SIDE_ANCHOR`, bare option), and `_node_shift` moves a node only for `xshift` / `yshift`
(`MOVES`). A side key that carries a dimension -- the spelling an edge label uses,
`\draw (a) -- node[above=20pt] {$t$} (b)` -- is therefore neither anchored nor shifted, and the
label prints on top of the line it labels.

pdflatex answers the three numbers the fix needs: how far the node's centre moves for
`above=20pt` (is it 20pt, or 20pt plus the node's own half-height, or plus `outer sep`?), what a
bare `above` moves by, and whether the anchor point is where the coordinate says.
"""
import os
import re
import subprocess
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(errors="replace")

CM = 28.3465
CASES = [
    ("above-20pt", "draw,above=20pt"),
    ("above-0pt", "draw,above=0pt"),
    ("above-bare", "draw,above"),
    ("below-20pt", "draw,below=20pt"),
    ("right-1cm", "draw,right=1cm"),
    ("left-1cm", "draw,left=1cm"),
    ("above-20pt-sep0", "draw,above=20pt,outer sep=0pt"),
    ("above-20pt-anchor-north", "draw,above=20pt,anchor=north"),
    ("above-2em", "draw,above=2em"),
]

DOC = r"""\documentclass[10pt]{article}
\usepackage{tikz}
\begin{document}
\makeatletter
\newcommand{\measure}[2]{%
  \begin{tikzpicture}
    \node[#1] (a) at (0,0) {ab};
    \pgfextracty{\dimen0}{\pgfpointanchor{a}{center}}%
    \pgfextracty{\dimen1}{\pgfpointanchor{a}{north}}%
    \typeout{MO #2 \the\dimen0\space \the\dimen1}%
  \end{tikzpicture}%
}
\makeatother
\measure{draw}{reference}
%(body)s
\end{document}
"""


def main():
    with tempfile.TemporaryDirectory() as tmp:
        body = "\n".join(r"\measure{%s}{%s}" % (opt, name) for name, opt in CASES)
        tex = os.path.join(tmp, "mo.tex")
        open(tex, "w", encoding="utf-8").write(DOC.replace("%(body)s", body))
        r = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", tmp,
                            tex], capture_output=True)
        log = open(os.path.join(tmp, "mo.log"), encoding="utf-8", errors="replace").read()
        out = {}
        for m in re.finditer(r"MO (\S+) (-?[\d.]+)pt(-?[\d.]+)pt", log.replace("\n", " ")):
            out[m.group(1)] = (float(m.group(2)), float(m.group(3)))
        ref = out.get("reference")
        print("reference: centre=%s north=%s pt" % ref if ref else "no reference")
        for name, opt in CASES:
            v = out.get(name)
            if v is None or ref is None:
                print("%-26s  (missing)" % name)
                continue
            print("%-26s centre+%7.3fcm  north+%7.3fcm   [%s]"
                  % (name, (v[0] - ref[0]) / CM, (v[1] - ref[1]) / CM, opt))
        if r.returncode:
            print("(pdflatex rc=%d)" % r.returncode)


if __name__ == "__main__":
    main()
