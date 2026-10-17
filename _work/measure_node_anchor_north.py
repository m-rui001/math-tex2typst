r"""Where does `anchor=north` put a framed node -- and can CeTz's `anchor:` say the same thing?

`_work/dump_canvas.py` caught a `\\node[…, anchor=north] at (7,-3.5)` with three lines of text emitted
as `content((7, -3.5), [#box(…)])` with **no** `anchor:`: the box straddles its point and its own
height, so it lands on the row of boxes above it.  The unframed branch of `emit_node` does pass
`anchor:`, so the question is what each engine does with it when the body is a laid-out `#box`.

Both sides draw the same node against two ruler lines crossing at its point and fitz reports the
rectangle's four edges relative to them.  pgf's law is the definition (`north` puts the north border
on the coordinate); what CeTz's `anchor:` does to a box is what decides whether the fix is one line
or a shift of our own.
"""
import os
import subprocess
import sys

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
HERE = os.path.dirname(os.path.abspath(__file__))

PGF = r"""\documentclass[tikz,border=10pt]{standalone}
\begin{document}
\begin{tikzpicture}[x=1cm,y=1cm]
  \draw[gray] (0,0) -- (4,0);
  \draw[gray] (2,-2) -- (2,2);
  \node[draw, minimum width=2cm, minimum height=1cm, %s] (a) at (2, 0) {B};
\end{tikzpicture}
\end{document}
"""

CETZ = r"""#import "@preview/cetz:0.5.0"
#set page(width: 90mm, height: 60mm, margin: 12mm)
#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  line((0, 0), (4, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  line((2, -2), (2, 2), stroke: (paint: rgb("#808080"), thickness: 0.4pt))
  %s
})
"""

# the same node spelled for our own canvas: a laid-out Typst box of the declared size
BOX = ('content((2, 0), [#box(width: 2cm, height: 1cm, inset: 0pt, stroke: 0.4pt)'
       '[#align(center + horizon)[B]]]%s)')

CASES = [("centre (none)", "", ""),
         ("north", "anchor=north", ', anchor: "north"'),
         ("south", "anchor=south", ', anchor: "south"'),
         ("east", "anchor=east", ', anchor: "east"'),
         ("north east", "anchor=north east", ', anchor: "north-east"')]


def run(dirpath, name, source, engine):
    """Compile `source` and hand back its PDF, deleting any stale output first."""
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
    """The node rectangle's four edges, relative to the ruler lines crossing at its point."""
    doc = fitz.open(pdf)
    rects, ry, rx = [], None, None
    for d in doc[0].get_drawings():
        for it in d["items"]:
            if it[0] == "l":
                if abs(it[1].x - it[2].x) < 1e-6:
                    rx = it[1].x
                else:
                    ry = (it[1].y + it[2].y) / 2
            elif it[0] == "re":
                rects.append(it[1])
    doc.close()
    if ry is None or rx is None or not rects:
        return None
    r = max(rects, key=lambda b: b.width * b.height)
    return (r.x0 - rx, r.x1 - rx, r.y0 - ry, r.y1 - ry)


def show(got):
    return "none" if got is None else "x[%+6.2f %+6.2f] y[%+6.2f %+6.2f] bp" % got


def main():
    tmp = os.path.join(HERE, "_na")
    os.makedirs(tmp, exist_ok=True)
    for i, (label, pgf_key, cetz_key) in enumerate(CASES):
        a = edges(run(tmp, "pgf%d" % i, PGF % pgf_key, "pdflatex"))
        body = CETZ % BOX % cetz_key
        b = edges(run(tmp, "cetz%d" % i, body, "typst"))
        print("%-14s pgf [%s]" % (label, show(a)))
        print("%-14s typ [%s]" % ("", show(b)))


if __name__ == "__main__":
    main()
