r"""What angle does a bare `bend left` stand for, and which way do the arms point?

The converter currently reads a missing `=deg` as 30. pgf's own default is a fact about the engine, not
about a comment in our source, so this renders `to[bend left]` and `to[bend right]` on a 3cm chord and
takes the direction of each control point off the page: the angle the arm leaves along, relative to the
chord, is exactly the bend angle pgf used (the arms are 0.39 of the chord at both ends, so their
direction carries the whole information).
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
  \draw (0,0) to[%(to)s] (3,0);
\end{tikzpicture}
\end{document}
"""


def main():
    os.makedirs(TMP, exist_ok=True)
    for to in ("bend left", "bend right", "bend left=45", "bend"):
        name = to.replace(" ", "_").replace("=", "")
        open(os.path.join(TMP, name + ".tex"), "w", encoding="utf-8").write(
            TEMPLATE % {"to": to})
        subprocess.run(["pdflatex", "-interaction=nonstopmode", name + ".tex"],
                       cwd=TMP, capture_output=True)
        log = open(os.path.join(TMP, name + ".log"), encoding="utf-8", errors="replace").read()
        if not os.path.exists(os.path.join(TMP, name + ".pdf")):
            print("%-16s ERROR %s" % (to, "Package tikz Error" in log))
            continue
        doc = fitz.open(os.path.join(TMP, name + ".pdf"))
        page = doc[0]
        seg = next((item for d in page.get_drawings() for item in d["items"] if item[0] == "c"), None)
        height = page.rect.height
        doc.close()
        if seg is None:
            print("%-16s no curve" % to)
            continue
        pts = [(p.x * CM, (height - p.y) * CM) for p in seg[1:]]
        a, c1, c2, b = pts
        out = math.degrees(math.atan2(c1[1] - a[1], c1[0] - a[0]))
        inc = math.degrees(math.atan2(b[1] - c2[1], b[0] - c2[0]))
        print("%-16s out=%+.2f  arrives along=%+.2f  arms=%.4f/%.4f of chord"
              % (to, out, inc, math.hypot(c1[0] - a[0], c1[1] - a[1]) / 3,
                 math.hypot(b[0] - c2[0], b[1] - c2[1]) / 3))


if __name__ == "__main__":
    main()
