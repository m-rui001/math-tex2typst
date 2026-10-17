r"""Order and inheritance of TikZ axis settings, measured on the page.

The basis probe (`_work/probe_3d_basis.py`) gave the default z as (-0.385,-0.385)cm, an explicit
`z={(0cm,1.5cm)}` as exactly (0,1.5)cm, a bare `z=1.3cm` as (1.3,1.3)cm, and a nested `x=1cm` as an
absolute page centimetre that keeps no part of the enclosing basis. Four questions are left, and the
emission depends on the answers, so each gets its own compiled page:

  rot90x    does a `rotate=` in the same option block turn an axis written after it?
  xscalex   does `xscale=` stretch the z axis as well as x?
  zinherited a scope that rewrites x= and y= but no z: is the inherited z its own or stretched?
  shiftaxes does a scope's `shift=` leave the axes it sets in the same block alone?
"""
import os
import subprocess

import pymupdf

CM = 28.346
HEAD = r"""\documentclass[tikz]{standalone}
\begin{document}
\begin{tikzpicture}[%s]
%s
\end{tikzpicture}
\end{document}
"""
PLAIN = "\n".join(r"\fill[%s] (%d,%d,%d) circle (2pt);" % ((c[0],) + c[1])
                  for c in ((r"black", (0, 0, 0)), (r"red", (1, 0, 0)), (r"green", (0, 1, 0)),
                            (r"blue", (0, 0, 1))))
SCOPED = r"""
  \fill[black] (0,0) circle (2pt);
  \begin{scope}[%s]
    \fill[olive] (0,0) circle (3pt);
    \fill[orange] (1,0) circle (3pt);
    \fill[violet] (0,1) circle (3pt);
    \fill[cyan] (0,0,1) circle (3pt);
  \end{scope}
"""

CONFIGS = [
    ("rot90x", r"rotate=90,x={(2cm,0cm)},y={(0cm,1cm)}", PLAIN, None),
    ("xscalex", "x=1cm,xscale=2", PLAIN, None),
    ("zinherited", "x=1cm,y=1cm", SCOPED, "x=2cm,y=2cm"),
    ("shiftaxes", "x=1cm,y=1cm", SCOPED, "shift={(1cm,1cm)},x={(2cm,0cm)},y={(0cm,2cm)}"),
]

OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "_probe_3d")
os.makedirs(OUT, exist_ok=True)

for tag, axes, body, inner in CONFIGS:
    text = body % inner if inner else body
    tex = os.path.join(OUT, "order_%s.tex" % tag)
    with open(tex, "w", encoding="utf-8") as f:
        f.write(HEAD % (axes, text))
    subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", OUT, tex],
                   stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=False)
    doc = pymupdf.open(os.path.join(OUT, "order_%s.pdf" % tag))
    page = doc[0]
    width, height = page.rect.width / CM, page.rect.height / CM
    up = []
    for d in page.get_drawings():
        rgb, r = d.get("fill"), d["rect"]
        if rgb is None:
            continue
        up.append((tuple(round(v, 3) for v in rgb),
                   (r.x0 + r.x1) / 2.0 / CM, -(r.y0 + r.y1) / 2.0 / CM))
    doc.close()
    o = min(up, key=lambda t: sum(v * v for v in t[0]))
    print("== %-11s [%s]%s page %.3f x %.3f cm"
          % (tag, axes, (" scope[%s]" % inner) if inner else "", width, height))
    for rgb, x, y in up:
        print("     rgb=%-22s delta=(%9.5f,%9.5f)" % (rgb, x - o[1], y - o[2]))
