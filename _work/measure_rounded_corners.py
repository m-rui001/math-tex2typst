r"""Read pgf's `rounded corners` radius off the page and check CeTz's `rect(radius:)` matches.

Both sides draw the same 2cm x 1cm rectangle with the default key, then fitz hands back the stroked
path's items. A rounded corner is a curve that starts `r` away from the corner along one edge and
ends `r` away along the other, so the radius is a distance on the page, not a guess: for pgf the
manual says 4pt, and this measures whether CeTz's `radius: 4pt` lands on the same page geometry.
A too-large radius is measured too, because pgf clamps a corner it cannot draw and CeTz may not.
"""
import os
import subprocess
import sys

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
HERE = os.path.dirname(os.path.abspath(__file__))

PGF = r"""\documentclass[tikz,border=10pt]{standalone}
\begin{document}
\begin{tikzpicture}%s
\draw[%s] (0,0) rectangle (2,1);
\end{tikzpicture}
\end{document}
"""

CETZ = r"""#import "@preview/cetz:0.5.0"
#set page(width: 80mm, height: 60mm, margin: 10mm)
#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  %s
})
"""

CASES = [("default", "rounded corners", ""),
         ("4pt", "rounded corners=4pt", "radius: 4pt"),
         ("8pt", "rounded corners=8pt", "radius: 8pt"),
         ("huge", "rounded corners=30pt", "radius: 30pt")]


def run(dirpath, name, source, engine):
    path = os.path.join(dirpath, name)
    suffix = ".tex" if engine == "pdflatex" else ".typ"
    open(path + suffix, "w", encoding="utf-8").write(source)
    pdf = path + ".pdf"
    if os.path.exists(pdf):
        os.remove(pdf)
    args = ([engine, "-interaction=nonstopmode", os.path.basename(path) + suffix]
            if engine == "pdflatex" else [engine, "compile", path + suffix, pdf])
    err = b""
    for _ in range(2 if engine == "pdflatex" else 1):
        err = subprocess.run(args, cwd=dirpath, capture_output=True).stderr
    if not os.path.exists(pdf):
        print("!! %s failed: %s" % (engine, err.decode("utf-8", "replace")[:400]))
    return pdf


def corner_radius(pdf):
    """How far a corner arc starts from the corner it rounds, read off the page's own path items."""
    doc = fitz.open(pdf)
    drawings = doc[0].get_drawings()
    doc.close()
    items = [it for d in drawings for it in d["items"]]
    pts = [p for it in items for p in it[1:] if isinstance(p, fitz.Point)]
    if not pts:
        return None, 0, 0
    curves = [it for it in items if it[0] == "c"]
    lines = sum(1 for it in items if it[0] == "l")
    if not curves:
        return None, lines, 0
    xs = [p.x for p in pts]
    ys = [p.y for p in pts]
    corners = [(x, y) for x in (min(xs), max(xs)) for y in (min(ys), max(ys))]
    # the arc starts r away from the corner ALONG the edge, so the distance that carries r is the one
    # to the corner point itself, not to the edge's supporting line (that one is zero by construction)
    got = [min(abs(it[1] - fitz.Point(c)) for c in corners) for it in curves]
    return got, lines, len(curves)


def show(got):
    return "none" if got is None else " ".join("%.3f" % v for v in got)


def main():
    tmp = os.path.join(HERE, "_rc")
    os.makedirs(tmp, exist_ok=True)
    for label, pgf_key, cetz_radius in CASES:
        pgf = run(tmp, "pgf_" + label, PGF % ("", pgf_key), "pdflatex")
        got, lines, curves = corner_radius(pgf)
        out = "pgf  %-8s key=%-22s corner_dists=[%s]bp lines=%d curves=%d" % (
            label, pgf_key, show(got), lines, curves)
        if cetz_radius:
            body = "rect((0, 0), (2, 1), %s, stroke: (thickness: 0.4pt))" % cetz_radius
            pdf = run(tmp, "cetz_" + label, CETZ % body, "typst")
            if not os.path.exists(pdf):
                print(out + "  |  cetz: no pdf")
                continue
            got2, l2, c2 = corner_radius(pdf)
            out += "  |  cetz %-11s -> [%s]bp lines=%d curves=%d" % (
                cetz_radius, show(got2), l2, c2)
        print(out)


if __name__ == "__main__":
    main()
