r"""Does CeTz's `anchor:` move a round frame it draws itself, or only a Typst `box`?

#62 hands the anchor to every branch of `emit_node` that hangs a node off its point, and one of them is
the circle drawn around a node's own words (`frame: "circle"` plus CeTz's `padding:`).  The measurement
so far only covered a laid-out `#box` (`_work/measure_node_anchor_north.py`), so this checks the
engine-drawn frame: the same `B` padded into a circle, against rulers crossing at its point, in both
engines.  The circle's box is read out of the drawing items because fitz reports a round path as
beziers, not as a rectangle.
"""
import os
import subprocess
import sys

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
HERE = os.path.dirname(os.path.abspath(__file__))

# pgf's default inner sep is 0.33354em and the test node is at the 9pt body size our nodes render at
PGF = r"""\documentclass[tikz,border=10pt]{standalone}
\usetikzlibrary{positioning}
\begin{document}
\begin{tikzpicture}[x=1cm,y=1cm,font=\small]
  \draw[gray] (0,0) -- (4,0);
  \draw[gray] (2,-2) -- (2,2);
  \node[circle, draw, %s] (a) at (2, 0) {B};
\end{tikzpicture}
\end{document}
"""

CETZ = r"""#import "@preview/cetz:0.5.0"
#set page(width: 90mm, height: 60mm, margin: 12mm)
#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  line((0, 0), (4, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  line((2, -2), (2, 2), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  content((2, 0), [#text(size: 9pt)[B]], frame: "circle", padding: 0.1179cm, stroke: (thickness: 0.4pt)%s)
})
"""

CASES = [("centre", "", ""),
         ("north", "anchor=north", ', anchor: "north"'),
         ("south", "anchor=south", ', anchor: "south"'),
         ("east", "anchor=east", ', anchor: "east"'),
         ("north east", "anchor=north east", ', anchor: "north-east"')]


def run(dirpath, name, source, engine):
    suffix = ".tex" if engine == "pdflatex" else ".typ"
    path = os.path.join(dirpath, name + suffix)
    open(path, "w", encoding="utf-8").write(source)
    pdf = os.path.join(dirpath, name + ".pdf")
    if os.path.exists(pdf):
        os.remove(pdf)
    args = ([engine, "-interaction=nonstopmode", name + suffix] if engine == "pdflatex"
            else [engine, "compile", path, pdf])
    err = subprocess.run(args, cwd=dirpath, capture_output=True).stderr
    if not os.path.exists(pdf):
        print("!! %s failed: %s" % (engine, err.decode("utf-8", "replace")[:300]))
    return pdf


def edges(pdf):
    """The circle's four edges against the rulers, read from the drawing that is neither ruler."""
    doc = fitz.open(pdf)
    ry, rx, cand = None, None, None
    for d in doc[0].get_drawings():
        r = d["rect"]
        if r.width < 2 or r.height < 2:
            for it in d["items"]:
                if it[0] == "l":
                    if abs(it[1].x - it[2].x) < 1e-6:
                        rx = it[1].x
                    else:
                        ry = (it[1].y + it[2].y) / 2
            continue
        # the node's own rule, grey for pgf and black in the canvas; the rulers are grey hairlines
        if r.width > 60:
            continue
        cand = r if cand is None or r.get_area() > cand.get_area() else cand
    doc.close()
    if rx is None or ry is None or cand is None:
        return None
    return (cand.x0 - rx, cand.x1 - rx, cand.y0 - ry, cand.y1 - ry)


def main():
    tmp = os.path.join(HERE, "_ca")
    os.makedirs(tmp, exist_ok=True)
    for i, (label, pgf_key, cetz_key) in enumerate(CASES):
        a = edges(run(tmp, "pgf%d" % i, PGF % pgf_key, "pdflatex"))
        b = edges(run(tmp, "cetz%d" % i, CETZ % cetz_key, "typst"))
        f = lambda g: "none" if g is None else "x[%+6.2f %+6.2f] y[%+6.2f %+6.2f] w%.2f h%.2f" % (
            g[0], g[1], g[2], g[3], g[1] - g[0], g[3] - g[2])
        print("%-10s pgf  %s" % (label, f(a)))
        print("%-10s typst %s" % ("", f(b)))


if __name__ == "__main__":
    main()
