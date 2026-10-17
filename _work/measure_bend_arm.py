r"""Is pgf's bend control distance a fixed fraction of the chord?

`_work/measure_bend_curve.py` read the beziers out of the PDF and gave control length / chord = 0.3899
for `bend left=15/45/90` on a 3cm chord, which says the angle does not enter the arm length at all --
only its direction. That would be surprising for a circular-arc fit, so this measures the ratio again
over angles 10..90 and chords 1cm..5cm, on a horizontal and a vertical chord, reading each arm's
length as its perpendicular offset from the chord line divided by sin of the bend angle (a difference
of two points on the page, so no border or unit scale can enter it).
"""
import math
import os
import subprocess
import sys

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
HERE = os.path.dirname(os.path.abspath(__file__))
TMP = os.path.join(HERE, "_bc")
CM = 0.0352778

TEMPLATE = r"""\documentclass[tikz,border=6pt]{standalone}
\begin{document}
\begin{tikzpicture}
  \draw (0,0) to[%(to)s] (%(bx)s, %(by)s);
\end{tikzpicture}
\end{document}
"""


def first_curve(name, source):
    os.makedirs(TMP, exist_ok=True)
    open(os.path.join(TMP, name + ".tex"), "w", encoding="utf-8").write(source)
    subprocess.run(["pdflatex", "-interaction=nonstopmode", name + ".tex"],
                   cwd=TMP, capture_output=True)
    doc = fitz.open(os.path.join(TMP, name + ".pdf"))
    items = [item for d in doc[0].get_drawings() for item in d["items"] if item[0] == "c"]
    doc.close()
    return [(p.x * CM, p.y * CM) for p in items[0][1:]]


def arm(seg, theta):
    """The arm length, from the control's perpendicular offset off the chord line."""
    a, c1, _, b = seg
    dx, dy = b[0] - a[0], b[1] - a[1]
    length = math.hypot(dx, dy)
    perp = abs((c1[0] - a[0]) * dy - (c1[1] - a[1]) * dx) / length
    return perp / math.sin(math.radians(theta))


def main():
    for by in (0, 3):
        for bx, theta in ((1, 45), (2, 45), (3, 10), (3, 30), (3, 45), (3, 60), (3, 90), (5, 45)):
            if by and bx != 3:
                continue
            seg = first_curve("arm_%d_%d_%d" % (bx, by, theta),
                              TEMPLATE % {"to": "bend left=%d" % theta, "bx": bx, "by": by})
            chord = math.hypot(seg[3][0] - seg[0][0], seg[3][1] - seg[0][1])
            length = arm(seg, theta)
            print("(%.4g, %.4g) theta=%-3d  arm=%.5f  chord=%.5f  ratio=%.5f"
                  % (bx, by, theta, length, chord, length / chord))


if __name__ == "__main__":
    main()
