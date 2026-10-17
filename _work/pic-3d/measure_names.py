r"""Is a space part of a TikZ node name, and where does `.west` of a text node land?

The Critical-bond picture names its points `qf axes` and `qf representative` and then draws
`(qf label.west)--(2.38,0.00)--(qf representative)`. The reader only accepts `[-\w]+`, so the whole
picture refuses; before widening it, two things are measured on the page:

  spaced  -- a `\coordinate` whose name holds a space, drawn from by a red line. If the line joins
             the same two dots as the un-spaced control case, pgf read the space as part of the name.
  west    -- where the anchor of a node really is, both for a node whose box the author fixed
             (`text width=1cm`) and for a bare text node, so the reading a name lookup may keep.

Both cases draw the same geometry, so the only difference between the PDFs is the spelling.

Usage: python _work/pic-3d/measure_names.py
"""
import io
import os
import subprocess
import sys

import pymupdf

ROOT = r"E:\math\_work\pic-3d"
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
CM = 28.346
OUT = os.path.join(ROOT, "measure")
os.makedirs(OUT, exist_ok=True)

HEAD = r"""\documentclass[tikz]{standalone}
\begin{document}
\begin{tikzpicture}
%s
\end{tikzpicture}
\end{document}
"""

CASES = [
    ("names_spaced", r"""
  \fill[black] (0,0) circle (1pt);
  \coordinate (qf axes) at (1,2);
  \fill[blue] (3,2) circle (1pt);
  \draw[red,line width=0.8pt] (qf axes)--(3,2);
  \draw[green,line width=0.8pt] (qf axes)--(0,0);
"""),
    ("names_plain", r"""
  \fill[black] (0,0) circle (1pt);
  \coordinate (qfaxes) at (1,2);
  \fill[blue] (3,2) circle (1pt);
  \draw[red,line width=0.8pt] (qfaxes)--(3,2);
  \draw[green,line width=0.8pt] (qfaxes)--(0,0);
"""),
    ("west_fixed", r"""
  \fill[black] (0,0) circle (1pt);
  \node[draw=gray,text width=1cm] (qf label) at (1.5,0) {x};
  \draw[red,line width=0.8pt] (qf label.west)--(0,0);
  \draw[blue,line width=0.8pt] (qf label.center)--(1.5,1);
"""),
    ("west_plain", r"""
  \fill[black] (0,0) circle (1pt);
  \node (qf label) at (1.5,0) {$F_{1,+}^{+,+}$};
  \draw[red,line width=0.8pt] (qf label.west)--(0,0);
  \draw[blue,line width=0.8pt] (qf label.center)--(1.5,1);
"""),
]

RGB = {"black": (0.0, 0.0, 0.0), "red": (1.0, 0.0, 0.0), "green": (0.0, 1.0, 0.0),
       "blue": (0.0, 0.0, 1.0), "gray": (0.5, 0.5, 0.5)}


def nearest(keys, rgb):
    return min(keys, key=lambda c: sum((a - b) ** 2 for a, b in zip(c, rgb)))


def read(tag):
    tex = os.path.join(OUT, tag + ".tex")
    with open(tex, "w", encoding="utf-8") as fh:
        fh.write(HEAD % CASES[[c[0] for c in CASES].index(tag)][1])
    subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", OUT, tex],
                   stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=False)
    doc = pymupdf.open(os.path.join(OUT, tag + ".pdf"))
    page = doc[0]
    dots, lines = {}, []
    for d in page.get_drawings():
        r = d["rect"]
        c = tuple(round(v, 2) for v in (d.get("fill") or d.get("color") or ()))
        if d.get("fill"):
            dots[c] = ((r.x0 + r.x1) / 2.0 / CM, -(r.y0 + r.y1) / 2.0 / CM)
        for item in d["items"]:
            if item[0] == "l":
                p, q = item[1], item[2]
                lines.append((c, (p.x / CM, -p.y / CM), (q.x / CM, -q.y / CM)))
    doc.close()
    return dots, lines


def show(tag):
    dots, lines = read(tag)
    # every number is reported relative to the black dot, which sits on the picture origin (0,0),
    # so a printed pair is the TikZ coordinate the driver really put on the page
    o = dots[nearest(dots, RGB["black"])]
    print("== %s" % tag)
    for k, v in sorted(dots.items()):
        print("   dot  %-7s (%8.4f,%8.4f)" % ([n for n in RGB if RGB[n] == k][0],
                                              v[0] - o[0], v[1] - o[1]))
    for c, a, b in lines:
        print("   line %-7s (%8.4f,%8.4f) -> (%8.4f,%8.4f)" % (
            [n for n in RGB if RGB[n] == c][0], a[0] - o[0], a[1] - o[1],
            b[0] - o[0], b[1] - o[1]))


for tag in ("names_spaced", "names_plain", "west_fixed", "west_plain"):
    show(tag)
