"""Four dots, no sorting, no flipping: read ux, uy, uz straight off the page as raw tuples.

Two readings of the earlier nine-dot experiment disagreed, so this one prints pymupdf's raw rect
tuples for the origin and the three unit points and lets the vectors be *subtracted*, which leaves
nothing to decode. Run each axis setting in its own PDF so the tight page box cannot mix them up.
"""
import os
import subprocess

import pymupdf

CM = 28.346
POINTS = [(0, 0, 0), (1, 0, 0), (0, 1, 0), (0, 0, 1)]
HEAD = r"""\documentclass[tikz]{standalone}
\begin{document}
\begin{tikzpicture}[%s]
%s
\end{tikzpicture}
\end{document}
"""

OUT = "_work/measure_3dbasis"
os.makedirs(OUT, exist_ok=True)
for tag, axes in (("default", "x=1cm,y=1cm"), ("x2y1", "x=2cm,y=1cm"),
                  ("scale2", "x=1cm,y=1cm,scale=2"), ("tiltx", r"x={(1cm,0.5cm)},y=1cm")):
    # each dot gets its own ink, because get_drawings() does not promise statement order
    inks = ["black", "red", "green", "blue"]
    rgb = {"black": (0.0, 0.0, 0.0), "red": (1.0, 0.0, 0.0),
           "green": (0.0, 0.5, 0.0), "blue": (0.0, 0.0, 1.0)}
    body = "\n".join(r"\fill[%s] (%d,%d,%d) circle (1pt);"
                     % ((inks[i],) + POINTS[i]) for i in range(len(POINTS)))
    tex = "%s/%s.tex" % (OUT, tag)
    open(tex, "w", encoding="utf-8").write(HEAD % (axes, body))
    subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", OUT, tex],
                   stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=False)
    doc = pymupdf.open("%s/%s.pdf" % (OUT, tag))
    page = doc[0]
    h = page.rect.height
    w = page.rect.width
    got = {}
    for d in page.get_drawings():
        r = d["rect"]
        got[d["fill"]] = ((r.x0 + r.x1) / 2.0, (h - (r.y0 + r.y1) / 2.0))  # y up from the bottom
    doc.close()
    print("== %-8s page %.4f x %.4f cm" % (tag, w / CM, h / CM))
    o = min(got.items(), key=lambda kv: (kv[0][0] ** 2 + kv[0][1] ** 2 + kv[0][2] ** 2))[1]
    for name in ("red", "green", "blue"):
        want = rgb[name]
        p = min(got.items(), key=lambda kv: sum((a - b) ** 2 for a, b in zip(kv[0], want)))[1]
        print("        %-6s = (%9.5f, %9.5f)" % (name, (p[0] - o[0]) / CM, (p[1] - o[1]) / CM))
