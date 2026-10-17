r"""Dump the vector path items pdflatex actually emits for a TikZ drawing, in picture cm.

Two reference axes are drawn inside the SAME picture and reach exactly (10,10), so the page->picture
affine is read off them: a `smooth` curve bulges past its own coordinates and a page bounding box
would silently shift every reading.

Run:  python _work/pic-plot/meas/pdfpaths.py <name> <tikz body> [<picture options>]
"""
import subprocess
import sys
from pathlib import Path

import pymupdf as fitz

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
PDFCM = 72 / 2.54  # page points in one PDF centimetre

TEMPLATE = (r"\documentclass[tikz,border=0pt]{standalone}" "\n"
            r"\usepackage{tikz}" "\n"
            # the papers' own picture options are replayed verbatim, and `>=Latex` is an
            # arrows.meta tip rather than a core one
            r"\usetikzlibrary{arrows.meta}" "\n"
            r"\begin{document}" "\n"
            r"\begin{tikzpicture}[x=1cm,y=1cm{extra}]" "\n"
            r"\draw[green!60!black,line width=0.4pt] (0,0)--(10,0)(0,0)--(0,10);" "\n"
            r"{plot}" "\n"
            r"\end{tikzpicture}" "\n"
            r"\end{document}" "\n")


def compile_tex(name, body_plot, extra=""):
    src = HERE / (name + ".tex")
    src.write_text(TEMPLATE.replace("{plot}", body_plot).replace("{extra}", extra),
                   encoding="utf-8")
    proc = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error",
                           "-output-directory", str(HERE), str(src)],
                          capture_output=True, text=True, cwd=str(REPO))
    if proc.returncode != 0:
        print(proc.stdout[-4000:])
        raise SystemExit("compile failed: " + name)
    return HERE / (name + ".pdf")


def strokes(pdf):
    """(stroke colour, item kind, page points) for every line/curveto item on page 1."""
    doc = fitz.open(str(pdf))
    out = []
    for path in doc[0].get_drawings():
        for item in path["items"]:
            if item[0] == "l":
                out.append((path.get("color"), "l", [(p.x, p.y) for p in item[1:3]]))
            elif item[0] == "c":
                out.append((path.get("color"), "c", [(p.x, p.y) for p in item[1:5]]))
    doc.close()
    return out


def items(name, body_plot, extra=""):
    """The two reference axes' origin and page position, and every stroked item in page points."""
    allst = strokes(compile_tex(name, body_plot, extra))
    axis = [p for col, _, pts in allst if col and abs(col[1] - 0.6) < 0.05 for p in pts]
    return (min(p[0] for p in axis), max(p[1] for p in axis)), allst


def measure(name, body_plot, extra=""):
    """-> [(colour, kind, points in PICTURE UNITS from the origin)]

    The axes reach 10 picture units each, so their page length says how many points a unit occupies:
    a `smooth` curve bulges past its own coordinates and a page bounding box would silently shift
    every reading, while `scale=.8` or `x=0.8cm` rescales the axes along with everything else and
    leaves the division by 10 exact.
    """
    (ox, oy), allst = items(name, body_plot, extra)
    pts = [p for col, _, ip in allst if col and abs(col[1] - 0.6) < 0.05 for p in ip]
    ux = (max(p[0] for p in pts) - ox) / 10.0
    uy = (oy - min(p[1] for p in pts)) / 10.0
    return [(col, kind, [((x - ox) / ux, (oy - y) / uy) for x, y in ip]) for col, kind, ip in allst]


def centimetres(name, body_plot, extra=""):
    """-> [(colour, kind, points in PAGE CM from the origin)]: the units a CeTz canvas emits.

    A picture with `scale=` draws the axes shorter too, so their length no longer says where a unit
    is; the fixed 28.3465 points per PDF centimetre does, and it is the canvas rather than the
    written coordinate that has to agree with it.
    """
    (ox, oy), allst = items(name, body_plot, extra)
    return [(col, kind, [((x - ox) / PDFCM, (oy - y) / PDFCM) for x, y in ip])
            for col, kind, ip in allst]


def pieces(name, body_plot, extra=""):
    """The coloured (non-axis) cubic pieces as (start, stop, control 1, control 2) in picture cm."""
    return [pts for col, kind, pts in measure(name, body_plot, extra)
            if kind == "c" and col and col[2] == 1.0]


if __name__ == "__main__":
    cal, paths = measure(sys.argv[1], sys.argv[2],
                         ("," + sys.argv[3]) if len(sys.argv) > 3 else "")
    print("cal", ["%.6f" % v for v in cal])
    for col, kind, pts in paths:
        print(" ", col, kind, [" (%.5f, %.5f)" % p for p in pts])
