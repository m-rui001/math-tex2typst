r"""Where does CeTz's `anchor:` stop knowing a `#box`'s extent?

`_work/measure_node_anchor_north.py` put a 2cm x 1cm declared-size box on pgf to 0.2bp for north,
south, east and north-east, and `_work/measure_anchor_wrapped_node.py` found north still exact for a
four-line box that declares only `width:` -- but SOUTH sitting on the wrong side of the point (its top
edge 7.5pt BELOW the coordinate, where pgf has the whole box above it). So the parity has a boundary,
and the two candidate ingredients are the ones this matrix separates:

  * does the box declare a `height:`, or does Typst grow it from the words?
  * is the body one line, or four?

Every cell draws the same two rulers crossing at the node's coordinate and reads the drawn rectangle
against them in fitz, on the pgf side and on the side our own `cetz.build` emits.
"""
import os
import subprocess
import sys

import fitz

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")

from t2t import cetz  # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))

LONG = ("After the side report, the visible count and the hidden count are fixed, and "
        "the left term equals the visible count plus a binomial draw.")
DECL = r"\draw[gray] (0,0) -- (6,0);\draw[gray] (3,-3) -- (3,3);"

PGF = (r"\documentclass[tikz,border=10pt]{standalone}\begin{document}"
       r"\begin{tikzpicture}[x=1cm,y=1cm]" + DECL +
       r"\node[draw, %s, align=center, font=\small, %s] at (3, 0) {%s};\end{tikzpicture}"
       r"\end{document}\n")

# (label, the text-width/size part of the TikZ options, the body, whether it wraps)
BODIES = [("1 line", "count plus a draw", 1),
          ("4 lines", LONG, 4)]
SIZES = [("width only", "text width=5cm"), ("width+height", "text width=5cm, minimum height=1.6cm")]
ANCHORS = [("none", ""), ("north", "anchor=north"), ("south", "anchor=south")]


def run(dirpath, name, source, engine):
    suffix = ".tex" if engine == "pdflatex" else ".typ"
    path = os.path.join(dirpath, name + suffix)
    open(path, "w", encoding="utf-8").write(source)
    pdf = os.path.join(dirpath, name + ".pdf")
    if os.path.exists(pdf):
        os.remove(pdf)
    args = ([engine, "-interaction=nonstopmode", name + suffix] if engine == "pdflatex"
            else [engine, "compile", path, pdf])
    proc = subprocess.run(args, cwd=dirpath, capture_output=True)
    if not os.path.exists(pdf):
        print("!! %s failed: %s" % (engine, (proc.stderr or proc.stdout)
                                    .decode("utf-8", "replace")[:300]))
    return pdf


def edges(pdf):
    """(top, bottom) of the drawn rectangle relative to the horizontal ruler, in fitz's
    downward-y sense: negative top means the edge is ABOVE the coordinate."""
    if not os.path.exists(pdf):
        return None
    doc = fitz.open(pdf)
    page = doc[0]
    ry = best = None
    for d in page.get_drawings():
        for it in d["items"]:
            if it[0] == "l" and abs(it[1].x - it[2].x) > 1e-6:
                ry = (it[1].y + it[2].y) / 2
            elif it[0] == "re" and it[1].width > 40 and it[1].height > 10:
                best = it[1] if best is None or it[1].get_area() > best.get_area() else best
    doc.close()
    if ry is None or best is None:
        return None
    return (best.y0 - ry, best.y1 - ry, best.height)


def main():
    tmp = os.path.join(HERE, "_ax")
    os.makedirs(tmp, exist_ok=True)
    n = 0
    for (blabel, body, rows) in BODIES:
        for (slabel, size) in SIZES:
            for (alabel, anchor) in ANCHORS:
                src = PGF % (size, anchor, body)
                a = edges(run(tmp, "pgf%d" % n, src, "pdflatex"))
                pic = (r"\begin{tikzpicture}[x=1cm,y=1cm]" + DECL +
                       (r"\node[draw, %s, align=center, font=\small, %s] at (3, 0) {%s};"
                        % (size, anchor, body)) + r"\end{tikzpicture}")
                built = cetz.build(cetz.strip_envelope(pic))
                typ = None
                if built:
                    doc = ('#import "@preview/cetz:0.5.0"\n'
                           '#set page(width: 120mm, height: 90mm, margin: 12mm)\n' + built)
                    typ = edges(run(tmp, "cetz%d" % n, doc, "typst"))
                f = lambda g: ("none" if g is None else
                               "top %+6.2f bottom %+6.2f h %5.2f" % g)
                print("%-7s %-11s %-6s pgf   %s" % (blabel, slabel, alabel, f(a)))
                print("%-7s %-11s %-6s typst %s   (pgf wants %d rows)"
                      % ("", "", "", f(typ), rows))
                n += 1


if __name__ == "__main__":
    main()
