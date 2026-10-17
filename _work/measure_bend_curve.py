r"""pgf's own bezier for `to[bend left=deg]`, read out of the PDF it writes.

The converter currently puts a bend's two control points on one side of the chord and equal to each
other; whether that is pgf's curve at all is not something a regex can say. `fitz` hands back the
cubic segments of the rendered path in bp (1 bp = 1/72 in = 0.0352778 cm), so each case below prints
the start, the two control points and the end in cm, in the page's own y-up frame (PDF rows grow
downward, so the y readings are flipped once here). A straight `--` is the control for the chord,
`bend right` for the mirrored sign, and `looseness` for whether the sagitta is a separate dial.
"""
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
  \coordinate (a) at (%(ax)s, %(ay)s);
  \coordinate (b) at (%(bx)s, %(by)s);
  \draw [%(key)s] (a) to[%(to)s] (b);
\end{tikzpicture}
\end{document}
"""

CASES = [
    ("flat 15", dict(ax=0, ay=0, bx=3, by=0, key="", to="bend left=15")),
    ("flat 45", dict(ax=0, ay=0, bx=3, by=0, key="", to="bend left=45")),
    ("flat 90", dict(ax=0, ay=0, bx=3, by=0, key="", to="bend left=90")),
    ("right 45", dict(ax=0, ay=0, bx=3, by=0, key="", to="bend right=45")),
    ("up 45", dict(ax=0, ay=0, bx=0, by=3, key="", to="bend left=45")),
    ("diag 45", dict(ax=0, ay=0, bx=2, by=2, key="", to="bend left=45")),
    ("loose 45", dict(ax=0, ay=0, bx=3, by=0, key="", to="bend left=45, looseness=2")),
    ("straight", dict(ax=0, ay=0, bx=3, by=0, key="", to="")),
    ("arrow 45", dict(ax=0, ay=0, bx=3, by=0, key="->", to="bend left=45")),
]


def curves(name, source):
    os.makedirs(TMP, exist_ok=True)
    path = os.path.join(TMP, name + ".tex")
    open(path, "w", encoding="utf-8").write(source)
    subprocess.run(["pdflatex", "-interaction=nonstopmode", name + ".tex"],
                   cwd=TMP, capture_output=True)
    doc = fitz.open(os.path.join(TMP, name + ".pdf"))
    page = doc[0]
    got = [[(p.x, page.rect.height - p.y) for p in item[1:]]
           for d in page.get_drawings() for item in d["items"] if item[0] == "c"]
    doc.close()
    return [[(round(x * CM, 4), round(y * CM, 4)) for x, y in seg] for seg in got]


def main():
    for name, args in CASES:
        got = curves(name.replace(" ", "_"), TEMPLATE % args)
        print("%-10s %-30s" % (name, args["to"] or "--"))
        for seg in got[:2]:
            print("      " + "  ".join("(%.4f, %.4f)" % p for p in seg))


if __name__ == "__main__":
    main()
