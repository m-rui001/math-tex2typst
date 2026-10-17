r"""Bend parity: the converter's beziers against the ones pdflatex writes.

Each case renders a `to[bend ...]` with pdflatex, reads its cubic's control points out of the PDF in cm
and moves them to the start point, then builds the same statement here and parses the `bezier(...)`
line. The printout is the largest coordinate error in cm, so a wrong side, a wrong angle or a wrong arm
all show up as a number instead of as a picture that looks roughly right.
"""
import math
import os
import re
import subprocess
import sys

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
TMP = os.path.join(HERE, "_bc")
sys.path.insert(0, os.path.join(ROOT, "tools"))

from t2t import cetz  # noqa: E402

CM = 0.0352778
BEZIER = re.compile(r"bezier\(\(([^)]*)\), \(([^)]*)\), \(([^)]*)\), \(([^)]*)\)")
TEMPLATE = r"""\documentclass[tikz,border=6pt]{standalone}
\begin{document}
\begin{tikzpicture}
  \draw (%(ax)s, %(ay)s) to[%(to)s] (%(bx)s, %(by)s);
\end{tikzpicture}
\end{document}
"""

CASES = [("bend left=15", 0, 0, 3, 0), ("bend left=45", 0, 0, 3, 0),
         ("bend left=90", 0, 0, 3, 0), ("bend left", 0, 0, 3, 0),
         ("bend right=45", 0, 0, 3, 0), ("bend left=45", 0, 0, 0, 3),
         ("bend left=45", 0, 0, 2, 2), ("bend left=45", 0, 0, 1, 0),
         ("bend left=45", 0, 0, 5, 0), ("bend left=30", 0, 0, 4, -1),
         ("bend right=60", -2, 1, 1.5, 2.5),
         ("bend left=45, looseness=2", 0, 0, 3, 0)]


def pgf_controls(name, args):
    os.makedirs(TMP, exist_ok=True)
    open(os.path.join(TMP, name + ".tex"), "w", encoding="utf-8").write(TEMPLATE % args)
    subprocess.run(["pdflatex", "-interaction=nonstopmode", name + ".tex"],
                   cwd=TMP, capture_output=True)
    doc = fitz.open(os.path.join(TMP, name + ".pdf"))
    page = doc[0]
    seg = next(item for item in page.get_drawings()[0]["items"] if item[0] == "c")
    pts = [(p.x * CM, (page.rect.height - p.y) * CM) for p in seg[1:]]
    doc.close()
    ax, ay = pts[0]
    return [(x - ax, y - ay) for x, y in pts[1:3]]


def ours(to, a, b):
    pic = (r"\begin{tikzpicture}\draw (%g, %g) to[%s] (%g, %g);\end{tikzpicture}"
           % (a[0], a[1], to, b[0], b[1]))
    got = cetz.build(pic)
    m = BEZIER.search(got)
    if not m:
        return None
    pts = [tuple(float(v) for v in g.split(",")) for g in m.groups()]
    ax, ay = pts[0]
    # the emitted line reads `bezier(start, end, control at start, control at end)`, the PDF item
    # reads (control, control, end), and both are moved onto the start point before comparing
    return [(x - ax, y - ay) for x, y in pts[2:4]]


def main():
    worst = 0.0
    for i, (to, ax, ay, bx, by) in enumerate(CASES):
        args = {"to": to, "ax": ax, "ay": ay, "bx": bx, "by": by}
        want = pgf_controls("parity_%d" % i, args)
        got = ours(to, (ax, ay), (bx, by))
        if got is None:
            print("%-28s no bezier emitted" % to)
            continue
        err = max(math.hypot(g[0] - w[0], g[1] - w[1]) for g, w in zip(got, want))
        worst = max(worst, err)
        print("%-28s err=%.4f cm   ours=%s pgf=%s"
              % (to, err, [(round(x, 4), round(y, 4)) for x, y in got],
                 [(round(x, 4), round(y, 4)) for x, y in want]))
    print("worst control error %.4f cm" % worst)


if __name__ == "__main__":
    main()
