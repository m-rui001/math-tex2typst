r"""Where does `label=above:$f$` land? Read it from TeX, not from a guess.

Nothing in the converter reads the `label=` key, and the parser census (`_work/probe_label_option.py`)
says 388 nodes reach it with one -- 385 of them on a node whose own brace group is empty, i.e. a dot
that exists only to carry the text. So the fix needs the numbers TeX uses:

* the gap between the parent node's BOUNDARY and the label's near edge (is it `outer sep`, is it
  `\labelsep`, is it zero?);
* whether a bare `label:$f$` (no side word, no colon) has a default direction;
* what a numeric angle means -- `label=90:` on a dot sits where `above:` does, and `45:` is a
  diagonal, which `SIDE_MOVE` has no entry for;
* whether a framed parent measures the gap from its frame or from its centre.

Each case prints, in pt: the parent's centre / north / east, and the label node's centre, north,
south, east, west. Naming the label (`label={[name=L]above:...}`) is legal TikZ and is what makes the
label's own anchors readable.
"""
import os
import re
import subprocess
import sys
import tempfile

CM = 28.3465
DOT = "circle,inner sep=0pt,minimum size=6pt,fill=black"
BOX = "draw,minimum width=1.2cm,minimum height=8pt"

CASES = [
    ("dot-above", DOT, r"label={[name=L]above:$f$}"),
    ("dot-below", DOT, r"label={[name=L]below:$f$}"),
    ("dot-left", DOT, r"label={[name=L]left:$f$}"),
    ("dot-right", DOT, r"label={[name=L]right:$f$}"),
    ("dot-bare", DOT, r"label={[name=L]$f$}"),
    ("dot-angle-90", DOT, r"label={[name=L]90:$f$}"),
    ("dot-angle-45", DOT, r"label={[name=L]45:$f$}"),
    ("dot-angle-0", DOT, r"label={[name=L]0:$f$}"),
    ("dot-above-left", DOT, r"label={[name=L]above left:$f$}"),
    ("dot-above-dist5", DOT, r"label={[name=L,distance=5mm]above:$f$}"),
    ("dot-above-x", DOT, r"label={[name=L]above:$xx_{12}$}"),
    ("box-above", BOX, r"label={[name=L]above:$f$}"),
    ("box-below", BOX, r"label={[name=L]below:$f$}"),
    ("box-right", BOX, r"label={[name=L]right:$f$}"),
    ("box-above-left", BOX, r"label={[name=L]above left:$f$}"),
    ("box-below-right", BOX, r"label={[name=L]below right:$f$}"),
    ("box-angle-135", BOX, r"label={[name=L]135:$f$}"),
    ("dot-above-sep0", DOT, r"label={[name=L,inner sep=0pt]above:$f$}"),
]

DOC = r"""\documentclass[10pt]{article}
\usepackage{tikz}
\begin{document}
\makeatletter
\newcommand{\measure}[3]{%
  \begin{tikzpicture}
    \node[#1,#3] (P) at (0,0) {};
    \pgfextractx{\dimen0}{\pgfpointanchor{P}{center}}%
    \pgfextracty{\dimen1}{\pgfpointanchor{P}{center}}%
    \pgfextracty{\dimen2}{\pgfpointanchor{P}{north}}%
    \pgfextractx{\dimen3}{\pgfpointanchor{P}{east}}%
    \pgfextractx{\dimen4}{\pgfpointanchor{L}{center}}%
    \pgfextracty{\dimen5}{\pgfpointanchor{L}{center}}%
    \pgfextracty{\dimen6}{\pgfpointanchor{L}{north}}%
    \pgfextracty{\dimen7}{\pgfpointanchor{L}{south}}%
    \pgfextractx{\dimen8}{\pgfpointanchor{L}{east}}%
    \pgfextractx{\dimen9}{\pgfpointanchor{L}{west}}%
    \typeout{MO,#2,\the\dimen0,\the\dimen1,\the\dimen2,\the\dimen3,\the\dimen4,%
             \the\dimen5,\the\dimen6,\the\dimen7,\the\dimen8,\the\dimen9,END}%
  \end{tikzpicture}%
}
\makeatother
%(body)s
\end{document}
"""


def main():
    body = [r"\measure{%s}{%s}{%s}" % (parent, name, lab) for name, parent, lab in CASES]
    with tempfile.TemporaryDirectory() as tmp:
        tex = os.path.join(tmp, "lab.tex")
        open(tex, "w", encoding="utf-8").write(DOC.replace("%(body)s", "\n".join(body)))
        r = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", tmp,
                            tex], capture_output=True)
        log = open(os.path.join(tmp, "lab.log"), encoding="utf-8", errors="replace").read()
    # TeX wraps a \typeout at 79 columns and the wrap can fall anywhere inside the payload --
    # between digits, or between the digits and the `pt` -- so every space in this line is a
    # breakpoint artifact, not a separator. The separators are commas.
    flat = re.sub(r"\s+", "", log)
    got = {}
    for m in re.finditer(r"MO,([a-z0-9-]+),((?:-?[\d.]+pt,){9}-?[\d.]+pt,END)", flat):
        got[m.group(1)] = [float(v.replace("pt", ""))
                           for v in m.group(2)[:-len(",END")].split(",")]
    if not got:
        print("no measurements; log tail:\n%s" % log[-2500:])
        print("rc=%s" % r.returncode)
        return
    print("%-16s %7s %7s | %7s %7s %7s %7s | %6s %6s" %
          ("case", "Ldx", "Ldy", "gap_up", "gap_dn", "gap_rt", "gap_lt", "Lhw", "Lhh"))
    for name, parent, lab in CASES:
        v = got.get(name)
        if not v:
            print("%-16s  (missing)" % name)
            continue
        pcx, pcy, pny, pex, lcx, lcy, lny, lsy, lex, lwx = v
        print("%-16s %7.4f %7.4f | %7.4f %7.4f %7.4f %7.4f | %6.4f %6.4f" % (
            name, (lcx - pcx) / CM, (lcy - pcy) / CM,
            (lsy - pny) / CM, (-pny - lny) / CM,
            (lwx - pex) / CM, (-pex - lex) / CM,
            (lex - lwx) / 2 / CM, (lny - lsy) / 2 / CM))
    print("\ncolumns in cm. Ldx/Ldy = label centre minus parent centre.")
    print("gap_up = label south - parent north (0 means touching);"
          " gap_dn = parent south - label north;")
    print("gap_rt = label west - parent east; gap_lt = parent west - label east.")
    print("Lhw/Lhh = the label node's own half-width / half-height"
          " (its inner sep 1pt and the text line live inside these).")


if __name__ == "__main__":
    main()
