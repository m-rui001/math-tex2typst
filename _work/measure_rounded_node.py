r"""#61 parity: does a ROUNDED, SIZED node come out with the same box and the same corner?

`_work/measure_rounded_corners.py` measured the law on a `\draw ... rectangle` path (pgf's default
`rounded corners` is 4pt, and the arc starts that far from the corner along both edges).  This is the
same distance read off the page for the case that had no radius at all until #61: a `\node` whose size
the author wrote down, which until now CeTz framed with a hardcoded line-strip.

Both engines draw `\node[draw, rounded corners, minimum width=2cm, minimum height=1cm] at (0,0) {L};`
and fitz reports the outer rectangle and the corner-arc start distance in bp.  A `minimum size` is
also printed because pgf's rectangle node takes two independent axes, which is what the swap to
Typst's `#box` has to keep.
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import fitz  # noqa: E402

from measure_rounded_corners import corner_radius, run  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz as cetzmod  # noqa: E402

PGF = r"""\documentclass[tikz,border=10pt]{standalone}
\begin{document}
\begin{tikzpicture}
%s
\end{tikzpicture}
\end{document}
"""

NODES = [
    ("default", r"\node[draw, rounded corners, minimum width=2cm,"
                r" minimum height=1cm] (a) at (0,0) {L};"),
    ("8pt", r"\node[draw, rounded corners=8pt, minimum width=2cm,"
            r" minimum height=1cm] (a) at (0,0) {L};"),
    ("minimum size", r"\node[draw, rounded corners, minimum size=1.5cm] (a) at (0,0) {L};"),
    ("square (control)", r"\node[draw, minimum width=2cm, minimum height=1cm]"
                         r" (a) at (0,0) {L};"),
]


def bbox(pdf):
    doc = fitz.open(pdf)
    items = [it for d in doc[0].get_drawings() for it in d["items"]]
    pts = [p for it in items for p in it[1:] if isinstance(p, fitz.Point)]
    doc.close()
    if not pts:
        return None
    return (max(p.x for p in pts) - min(p.x for p in pts),
            max(p.y for p in pts) - min(p.y for p in pts))


def main():
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    tmp = os.path.join(os.path.dirname(os.path.abspath(__file__)), "_rn")
    os.makedirs(tmp, exist_ok=True)
    for label, stmt in NODES:
        pdf = run(tmp, "pgf_" + label.replace(" ", "_"), PGF % stmt, "pdflatex")
        got, lines, curves = corner_radius(pdf)
        w, h = (bbox(pdf) or (0, 0))
        print("== %s" % label)
        print("   pgf    box %.3f x %.3f bp   corner_dists=[%s]bp  curves %d"
              % (w, h, " ".join("%.3f" % v for v in (got or [])), curves))
        built = cetzmod.build(stmt.join(("\\begin{tikzpicture}", "\\end{tikzpicture}")))
        if built is None:
            print("   cetz   REFUSED")
            continue
        line = next((ln.strip() for ln in built.splitlines() if "content(" in ln), "")
        print("   cetz   %s" % line[:190])
        pdf2 = run(tmp, "cetz_" + label.replace(" ", "_"),
                   cetzmod.HEADER + "#set page(width: 90mm, height: 60mm, margin: 12mm)\n"
                   + built, "typst")
        if not os.path.exists(pdf2):
            print("   cetz   compile failed")
            continue
        got2, l2, c2 = corner_radius(pdf2)
        w2, h2 = (bbox(pdf2) or (0, 0))
        print("   typst  box %.3f x %.3f bp   corner_dists=[%s]bp  curves %d"
              % (w2, h2, " ".join("%.3f" % v for v in (got2 or [])), c2))


if __name__ == "__main__":
    main()
