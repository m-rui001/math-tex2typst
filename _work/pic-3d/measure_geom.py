r"""Measure the three refused 3D pictures' own bases against real TeX, and check the sandbox'
transform representation reproduces them.

Each case is one standalone picture whose body is a dot per 3D point, in its own ink, laid out
exactly where the paper puts it (the same picture options, the same `\begin{scope}` nesting). A
vector is then a difference of two measured centres, so nothing depends on where the tight page box
starts; page y is flipped to y-up because TeX grows upward and pymupdf grows downward.

The predicted side is not re-derived here: it comes out of the production reader (`_transform` plus
the scope walk), so a disagreement is a bug in cetz.py and not in this script's arithmetic.

Usage: python _work/pic-3d/measure_geom.py
"""
import io
import os
import re
import subprocess
import sys

import pymupdf

ROOT = r"E:\math\_work\pic-3d"
sys.path.insert(0, ROOT)
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")

from t2t import cetz  # noqa: E402

CM = 28.346
OUT = os.path.join(ROOT, "measure")
os.makedirs(OUT, exist_ok=True)

HEAD = r"""\documentclass[tikz]{standalone}
\usepackage{xcolor}
\begin{document}
%s
\end{document}
"""

# ink -> point, per case; the point lists are the coordinates the refused statements actually use
CASES = [
    ("asharp", r"""\begin{tikzpicture}[scale=1.25,
    x={(1cm,0cm)},y={(0.45cm,0.35cm)},z={(0cm,1.5cm)},line cap=round]
  \fill[black] (0,0,0) circle (1.5pt);
  \fill[red] (1.4,-1,1) circle (1.5pt);
  \fill[green] (1.4,1.3,1) circle (1.5pt);
  \fill[blue] (-1.4,1.3,1) circle (1.5pt);
  \fill[cyan] (-1,-0.65,1) circle (1.5pt);
  \fill[magenta] (0,1,1) circle (1.5pt);
  \fill[olive] (-1.4,-0.91,1.4) circle (1.5pt);
  \fill[orange] (2.3,-1,0.65) circle (1.5pt);
  \fill[violet] (0,0,1) circle (1.5pt);
  \fill[teal] (-1.65,-1.0725,1.65) circle (1.5pt);
\end{tikzpicture}"""),
    ("critical", r"""\begin{tikzpicture}[
  x={(1.10cm,-0.55cm)},
  y={(-1.10cm,-0.55cm)},
  z={(0cm,1.18cm)},
  line join=round]
  \fill[black] (0,0,0) circle (1.5pt);
  \fill[red] (1,-1,-1) circle (1.5pt);
  \fill[green] (1,1,-1) circle (1.5pt);
  \fill[blue] (1,1,1) circle (1.5pt);
  \fill[cyan] (1,-1,1) circle (1.5pt);
  \fill[magenta] (-1,1,-1) circle (1.5pt);
  \fill[olive] (1,0.48,0.56) circle (1.5pt);
  \fill[orange] (1,0,-1) circle (1.5pt);
  \begin{scope}[x=1cm,y=1cm]
    \fill[teal] (2.38,0.00) circle (1.5pt);
    \fill[pink] (-2.95,-1.63) circle (1.5pt);
    \fill[brown] (-2.40,-1.905) circle (1.5pt);
    \fill[gray] (-2.95,-0.99) circle (1.5pt);
    \fill[lime] (0,0,1) circle (1.5pt);
  \end{scope}
\end{tikzpicture}"""),
    ("diffeo", r"""\begin{tikzpicture}[font=\small]
  \fill[black] (0,0) circle (1.5pt);
  \begin{scope}[shift={(7.1cm,.35cm)},
   x={(1.3cm,0cm)},y={(.42cm,.36cm)},z={(0cm,1.28cm)}]
    \fill[red] (0,0,0) circle (1.5pt);
    \fill[green] (2,0,0) circle (1.5pt);
    \fill[blue] (2,1.4,0) circle (1.5pt);
    \fill[cyan] (0,1.4,0) circle (1.5pt);
    \fill[magenta] (1,.7,2.55) circle (1.5pt);
    \fill[olive] (2.12,1.4,.65) circle (1.5pt);
    \fill[orange] (-.15,0,.72) circle (1.5pt);
    \fill[teal] (1.6,.7,1.7) circle (1.5pt);
    \fill[pink] (.8,.56,1.7) circle (1.5pt);
  \end{scope}
\end{tikzpicture}"""),
    # the third axis a picture never mentions: the code claims pgf's own (-0.385,-0.385)cm and that
    # `scale=` stretches it like the other two, so both are read off the page rather than trusted
    ("plainz", r"""\begin{tikzpicture}[x=1cm,y=1cm]
  \fill[black] (0,0,0) circle (1.5pt);
  \fill[red] (1,0,0) circle (1.5pt);
  \fill[green] (0,1,0) circle (1.5pt);
  \fill[blue] (0,0,1) circle (1.5pt);
  \fill[cyan] (0,0,2) circle (1.5pt);
\end{tikzpicture}"""),
    ("plainz_scale2", r"""\begin{tikzpicture}[x=1cm,y=1cm,scale=2]
  \fill[black] (0,0,0) circle (1.5pt);
  \fill[red] (1,0,0) circle (1.5pt);
  \fill[green] (0,1,0) circle (1.5pt);
  \fill[blue] (0,0,1) circle (1.5pt);
  \fill[cyan] (0,0,2) circle (1.5pt);
\end{tikzpicture}"""),
]

# the inks as the driver really puts them on the page (read off the compiled control PDFs), not as
# their colour-model names: xcolor's green is (0,1,0) and its magenta is not the model one
INK = {
    "black": (0.0, 0.0, 0.0), "red": (1.0, 0.0, 0.0), "green": (0.0, 1.0, 0.0),
    "blue": (0.0, 0.0, 1.0), "cyan": (0.0, 0.68, 0.94), "magenta": (0.93, 0.0, 0.55),
    "olive": (0.59, 0.55, 0.0), "orange": (1.0, 0.5, 0.0), "violet": (0.5, 0.0, 0.5),
    "teal": (0.0, 0.5, 0.5), "pink": (1.0, 0.75, 0.75), "brown": (0.75, 0.5, 0.25),
    "gray": (0.5, 0.5, 0.5), "lime": (0.75, 1.0, 0.25),
}

DOT = re.compile(r"\\fill\[(\w+)\]\s*\(([^()]*)\)\s*circle")


def read_page(tag):
    tex = os.path.join(OUT, tag + ".tex")
    with open(tex, "w", encoding="utf-8") as fh:
        fh.write(HEAD % CASES[[c[0] for c in CASES].index(tag)][1])
    subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", OUT, tex],
                   stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=False)
    doc = pymupdf.open(os.path.join(OUT, tag + ".pdf"))
    page = doc[0]
    h = page.rect.height
    got = {}
    for d in page.get_drawings():
        rgb = d.get("fill")
        if rgb is None:
            continue
        r = d["rect"]
        got[tuple(round(v, 2) for v in rgb)] = ((r.x0 + r.x1) / 2.0 / CM,
                                                -(r.y0 + r.y1) / 2.0 / CM)
    doc.close()
    return got


def predict(src):
    """[(ink, page point in cm)] with the point read by the production transform machinery."""
    m = re.match(r"\\begin\{tikzpicture\}", src)
    body = src[m.end():].lstrip()
    head, pos = cetz._opts_at(body, 0)
    base = cetz._transform(head)
    body = body[pos:]
    body = body[:body.rfind("\\end{tikzpicture}")]
    out = []
    for stmt, xf in cetz.scoped(body, base):
        d = DOT.search(stmt)
        if d:
            parts = [cetz.expr(part) for part in d.group(2).split(",")]
            out.append((d.group(1), cetz._apply(xf, *parts)))
    return out


def nearest(got, rgb):
    return min(got, key=lambda c: sum((a - b) ** 2 for a, b in zip(c, rgb)))


for tag, src in CASES:
    measured = read_page(tag)
    # the tight page box hides where the picture's own origin landed, but every dot shares it, so
    # one translation -- read off the black dot, which sits on the picture origin -- lines them up
    pred = dict(predict(src))
    tx = measured[nearest(measured, INK["black"])][0] - pred["black"][0]
    ty = measured[nearest(measured, INK["black"])][1] - pred["black"][1]
    print("== %s (origin shift %.4f, %.4f cm)" % (tag, tx, ty))
    worst = 0.0
    for ink, (px, py) in pred.items():
        x, y = measured[nearest(measured, INK[ink])]
        err = max(abs(x - tx - px), abs(y - ty - py))
        worst = max(worst, err)
        print("   %-8s measured=(%8.4f,%8.4f) cetz=(%8.4f,%8.4f) err=%.4f cm" % (
            ink, x - tx, y - ty, px, py, err))
    print("   worst deviation %.4f cm" % worst)
