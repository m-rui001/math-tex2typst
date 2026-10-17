r"""Read TikZ's 3D basis vectors off the page: default z, explicit z, scale, and nested scopes.

Every setting is compiled on its own page and the dots carry their own ink colour, so a vector is a
difference of two measured centres and nothing depends on where the tight page box starts. Page y is
flipped to y-up because TeX grows upward while pymupdf grows downward, and cm = 28.346 pt.

Measured questions, one per configuration:
  default   is the unset z really (-0.385,-0.385)cm, and does it depend on x=/y=?
  scale     does `scale=` stretch z as well as x and y, and does the option order matter?
  zexp      what does an explicit z={(0cm,1.5cm)} land on?
  zdim      what does a bare `z=1.3cm` land on (the source says (1.3cm,1.3cm), which is a surprise)?
  nest      inside a scope that rewrites x= and y=, are the enclosing 3D basis columns forgotten?
  units     is a `(2cm,0)` inside a `x=2cm` scope 2cm of page or 4cm?
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

# one colour per coordinate so a dot never has to be identified by its position
DOTS3 = [(r"black", (0, 0, 0)), (r"red", (1, 0, 0)), (r"green", (0, 1, 0)),
         (r"blue", (0, 0, 1)), (r"cyan", (0, 0, 2))]
DOTS_NEST = [(r"black", (0, 0, 0)), (r"red", (1, 0, 0)), (r"green", (0, 1, 0)),
             (r"blue", (0, 0, 1)), (r"magenta", (1, 1, 0))]
NESTED = r"""
  \fill[black] (0,0,0) circle (2pt);
  \fill[red] (1,0,0) circle (2pt);
  \fill[green] (0,1,0) circle (2pt);
  \fill[blue] (0,0,1) circle (2pt);
  \fill[magenta] (1,1,0) circle (2pt);
  \begin{scope}[x=1cm,y=1cm]
    \fill[olive] (0,0) circle (3pt);
    \fill[orange] (1,0) circle (3pt);
    \fill[violet] (0,1) circle (3pt);
  \end{scope}
"""
UNITS = r"""
  \fill[black] (0,0) circle (2pt);
  \fill[red] (1,0) circle (2pt);
  \fill[blue] (1cm,0) circle (2pt);
  \fill[cyan] (1cm,1cm) circle (2pt);
  \fill[green] (0,1) circle (2pt);
"""

CONFIGS = [
    ("default", "x=1cm,y=1cm", DOTS3),
    ("scale2", "x=1cm,y=1cm,scale=2", DOTS3),
    ("x2y1", "x=2cm,y=1cm", DOTS3),
    ("zexp", "x=1cm,y=1cm,z={(0cm,1.5cm)}", DOTS3),
    ("zdim", "x=1cm,y=1cm,z=1.3cm", DOTS3),
    ("before", r"scale=1.25,x={(1cm,0cm)},y={(0.45cm,0.35cm)},z={(0cm,1.5cm)}", DOTS3),
    ("after", r"x={(1cm,0cm)},y={(0.45cm,0.35cm)},z={(0cm,1.5cm)},scale=1.25", DOTS3),
    ("nest", r"x={(1.10cm,-0.55cm)},y={(-1.10cm,-0.55cm)},z={(0cm,1.18cm)}", None),
    ("units", "x=2cm,y=2cm", None),
]

OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "_probe_3d")
os.makedirs(OUT, exist_ok=True)

for tag, axes, dots in CONFIGS:
    if tag == "nest":
        body = NESTED
    elif tag == "units":
        body = UNITS
    else:
        body = "\n".join(r"\fill[%s] (%d,%d,%d) circle (2pt);" % ((c,) + p) for c, p in dots)
    tex = os.path.join(OUT, "basis_%s.tex" % tag)
    with open(tex, "w", encoding="utf-8") as f:
        f.write(HEAD % (axes, body))
    subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", OUT, tex],
                   stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=False)
    doc = pymupdf.open(os.path.join(OUT, "basis_%s.pdf" % tag))
    page = doc[0]
    width, height = page.rect.width / CM, page.rect.height / CM
    up = []
    for d in page.get_drawings():
        r = d["rect"]
        rgb = d.get("fill")
        if rgb is None:
            continue
        up.append((tuple(round(v, 3) for v in rgb),
                   (r.x0 + r.x1) / 2.0 / CM, -(r.y0 + r.y1) / 2.0 / CM))
    doc.close()
    print("== %-8s [%s] page %.3f x %.3f cm" % (tag, axes, width, height))
    # the origin is the black dot, found by its ink and not by its position: the default z
    # vector points down-left, so the smallest-coordinate dot is (0,0,1), not (0,0,0)
    o = min(up, key=lambda t: sum(v * v for v in t[0]))
    for rgb, x, y in up:
        print("     rgb=%-22s  x=%9.5f  y=%9.5f   delta=(%9.5f,%9.5f)"
              % (rgb, x, y, x - o[1], y - o[2]))
