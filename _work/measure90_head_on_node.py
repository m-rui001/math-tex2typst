r"""#90 does a picture-head pen option reach a NODE's frame?

`stroke_args` now says `cap:`/`join:` out loud, and the head is the place the corpus writes them
(155 of 158, `_work/probe122_pen_option_face.py`), so the question that decides where the merge goes
is scope: TikZ's `every path` is a path style, but a picture's own brackets are also just options in
the picture scope.  One page each side: `line join=round, line width=12pt` on the head, a drawn
rectangle node inside, and fitz reads back the stroke state the node's frame carries plus the corner
ink.  If the frame says `Round`, the head reaches nodes and the merge must not be path-only.
"""
import os
import subprocess
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TMP = os.path.join(ROOT, "_work", "_m90e")
os.makedirs(TMP, exist_ok=True)

BODY = r"""
\begin{tikzpicture}[line width=12pt%s]
  \node[draw] (a) at (0,0) {X};
\end{tikzpicture}
"""


def tex(extra):
    return ("\\documentclass[tikz,border=12pt]{standalone}\n\\usepackage{tikz}\n\\begin{document}"
            + BODY % extra + "\\end{document}\n")


def build(name, src):
    path = os.path.join(TMP, name + ".tex")
    open(path, "w", encoding="utf-8").write(src)
    r = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error",
                        "-output-directory", TMP, name + ".tex"], cwd=TMP,
                       capture_output=True, text=True, encoding="utf-8", errors="replace")
    pdf = os.path.join(TMP, name + ".pdf")
    if r.returncode or not os.path.exists(pdf):
        print((r.stdout or "")[-800:])
        sys.exit(1)
    return pdf


for name, extra in (("head_plain", ""), ("head_round", ",line join=round"),
                    ("head_cap", ",line cap=round")):
    pdf = build(name, tex(extra))
    page = fitz.open(pdf)[0]
    print("%s page=%.0fx%.0fpt" % (name, page.rect.width, page.rect.height))
    for d in page.get_drawings():
        kinds = set(it[0] for it in d["items"])
        print("  rect=%s w=%s cap=%s join=%s items=%s" % (
            d["rect"], d.get("width"), d.get("lineCap"), d.get("lineJoin"),
            "".join(sorted(kinds))))
