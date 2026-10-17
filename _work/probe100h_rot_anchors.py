"""Where a rotated node's ink lands for each `anchor=`: six single-picture PDFs, measured with fitz.

The face row this prices is `A-Linear-Clock-for-Random-Walk-on-Tree-Weighted-Planar-M#0`, where the
source writes `\node[anchor=east,rotate=90,...] at (-0.93,2.45) {uncapped band}` and our canvas emits
`content((-0.7905, 2.205), [#page_rotate(-90deg)[...]], anchor: "east")` -- a span whose page box is
10.3x51.3pt and which brushes the axis label `height` (4.80pt) and `$H$` (5.04pt) with it. The law
needed is the one pgf applies: it turns the node and then puts the TURNED anchor on the point.

  python _work/probe100h_rot_anchors.py        # -> _work/label100h_rot_anchors.txt
"""
import io
import os
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
OUT = os.path.join(HERE, "label100h_rot_anchors.txt")
TEX = r"""\documentclass[border=14pt]{standalone}
\usepackage{tikz}
\begin{document}
\begin{tikzpicture}[x=1cm,y=1cm]
  \fill (0,0) circle (1.2pt);
  \node[%s,fill=red!25,inner sep=0pt] at (0,0) {uncapped band};
\end{tikzpicture}
\end{document}
"""
CASES = ["anchor=center,rotate=0", "anchor=east,rotate=90", "anchor=center,rotate=90",
         "anchor=east,rotate=-90", "anchor=north,rotate=90", "anchor=west,rotate=90",
         "rotate=90",
         # the spellings the corpus actually writes (`_work/m100_rot_anchor.tsv`: south 7 nodes,
         # east 2, west 1; angles 90 seven times, then 45, 34 and -63 once each)
         "anchor=south,rotate=90", "anchor=south,rotate=45", "anchor=south,rotate=34",
         "anchor=west,rotate=-63"]


def measure(pdf):
    """(dot centre, red box) in points, page coordinates with y growing down."""
    import fitz
    doc = fitz.open(pdf)
    page = doc[0]
    dot = box = None
    for d in page.get_drawings():
        r = d["rect"]
        if d.get("fill") and max(r.width, r.height) < 4 and min(r.width, r.height) > 1:
            dot = ((r.x0 + r.x1) / 2.0, (r.y0 + r.y1) / 2.0)
        elif d.get("fill") and r.width > 8 and r.height > 8:
            box = (r.x0, r.y0, r.x1, r.y1)
    doc.close()
    return dot, box


def main():
    lines = []
    for i, opt in enumerate(CASES):
        stem = "m100_rot_%d" % i
        tex = os.path.join(HERE, stem + ".tex")
        io.open(tex, "w", encoding="utf-8").write(TEX % opt)
        subprocess.run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error",
                        "-output-directory", HERE, tex],
                       stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, cwd=HERE)
        dot, box = measure(os.path.join(HERE, stem + ".pdf"))
        if dot is None or box is None:
            lines.append("%-28s dot=%s box=%s" % (opt, dot, box))
            continue
        # the box relative to the point, in pt: dx>0 means the ink sits right of it, dy>0 below
        left = box[0] - dot[0]
        right = box[2] - dot[0]
        top = box[1] - dot[1]
        bottom = box[3] - dot[1]
        lines.append("%-28s box %6.2f x %6.2f pt  offsets from the point:  left %7.2f right %7.2f"
                     "  top %7.2f bottom %7.2f"
                     % (opt, box[2] - box[0], box[3] - box[1], left, right, top, bottom))
    text = "\n".join(lines) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(text)
    print(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
