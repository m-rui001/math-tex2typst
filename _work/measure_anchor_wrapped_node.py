r"""Does an `anchor=north` on a MULTI-LINE `text width` node land on pgf's box?

The #62 node that opened the round is three lines tall (`quantitative-lower-bounds…` p9: the
13.42cm-wide banner over a row of cards), so the shift the anchor has to produce is half a *wrapped*
paragraph, not half a letter. Typst only lands it if it breaks the same number of lines TeX does, so
this reads the rectangle's top edge AND its height: equal heights mean the wrap agrees and the
comparison of the top edges is a comparison of the anchors alone.

Both sides draw the same node between two rulers crossing at its coordinate, as
`_work/measure_node_anchor_north.py` does for a one-letter body. The Typst side does not hand-write
`content(...)`: it runs `cetz.build` on the very source the gauge gives pdflatex, so the spelling
under test is the one the converter ships.
"""
import os
import re
import subprocess
import sys

import fitz

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")

from t2t import cetz  # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))

TEXT = ("After the side report, the visible count and the hidden count are fixed, and "
        "the left term equals the visible count plus a binomial draw.")

# the rulers are drawn by the same picture, so they land in the same canvas coordinates
DECL = r"\draw[gray] (0,0) -- (6,0);\draw[gray] (3,-3) -- (3,3);"
NODE = r"\node[draw, text width=5cm, align=center, font=\small, %s] at (3, 0) {%s};"

PGF = (r"\documentclass[tikz,border=10pt]{standalone}\begin{document}"
       r"\begin{tikzpicture}[x=1cm,y=1cm]" + DECL + NODE + r"\end{tikzpicture}"
       r"\end{document}\n")

# `cetz.build` ships the `#cetz.canvas(...)` block but not the import, so the gauge adds the page
CASES = [("centre (none)", ""),
         ("north", "anchor=north"),
         ("south", "anchor=south"),
         ("west", "anchor=west"),
         ("east", "anchor=east")]


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
                                    .decode("utf-8", "replace")[:400]))
    return pdf


def edges(pdf):
    """The node rectangle against the rulers, and the number of text lines it holds."""
    if not os.path.exists(pdf):
        return None
    doc = fitz.open(pdf)
    page = doc[0]
    ry = rx = best = None
    for d in page.get_drawings():
        for it in d["items"]:
            if it[0] == "l":
                if abs(it[1].x - it[2].x) < 1e-6:
                    rx = it[1].x
                else:
                    ry = (it[1].y + it[2].y) / 2
            elif it[0] == "re" and it[1].width > 40 and it[1].height > 10:
                best = it[1] if best is None or it[1].get_area() > best.get_area() else best
    if best is None:
        doc.close()
        return None
    lines = [w for w in page.get_text("words")
             if best.x0 - 1 <= w[0] and w[2] <= best.x1 + 1]
    rows = len({round((w[1] + w[3]) / 2) for w in lines})
    doc.close()
    if rx is None or ry is None:
        return None
    # fitz's y grows downward; report against the rulers so a north shift reads as the box
    # hanging below the horizontal rule
    return (best.x0 - rx, best.x1 - rx, ry - best.y1, best.y0 - ry, best.height, rows)


def main():
    tmp = os.path.join(HERE, "_aw")
    os.makedirs(tmp, exist_ok=True)
    for i, (label, key) in enumerate(CASES):
        a = edges(run(tmp, "pgf%d" % i, PGF % (key, TEXT), "pdflatex"))
        src = r"\begin{tikzpicture}[x=1cm,y=1cm]" + DECL + (NODE % (key, TEXT)) + \
              r"\end{tikzpicture}"
        built = cetz.build(cetz.strip_envelope(src))
        if built is None:
            print("%-14s cetz.build refused the picture" % label)
            continue
        body = ('#import "@preview/cetz:0.5.0"\n'
                '#set page(width: 120mm, height: 90mm, margin: 12mm)\n'
                + built)
        open(os.path.join(tmp, "cetz%d.typ" % i), "w", encoding="utf-8").write(body)
        b = edges(run(tmp, "cetz%d" % i, body, "typst"))
        f = lambda g: ("none" if g is None else
                       "x[%+6.2f %+6.2f] y[%+6.2f %+6.2f] h%6.2f lines %d" % g)
        print("%-14s pgf   %s" % (label, f(a)))
        print("%-14s typst %s" % ("", f(b)))
        if label == "north":
            line = [ln for ln in built.splitlines() if "content(" in ln][-1].strip()
            print("%-14s emitted %s" % ("", line[-140:]))


if __name__ == "__main__":
    main()
