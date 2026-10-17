"""Two open questions about TikZ grids, answered by pdflatex rather than by memory.

A: does a bare 'step=1' follow the axis scale on a negative-running grid?
B: with no step option at all, is the initial spacing 1cm or one axis unit?
"""
import pathlib
import subprocess
import tempfile

import pymupdf

CM = 28.3465

DOCS = {
    "neg-bare": r"""
\documentclass[tikz,border=0pt]{standalone}
\begin{document}
\begin{tikzpicture}[x=.52cm,y=.52cm]
  \draw[step=1,blue] (0,0) grid (7,-7);
\end{tikzpicture}
\end{document}
""",
    "default": r"""
\documentclass[tikz,border=0pt]{standalone}
\begin{document}
\begin{tikzpicture}[x=.7cm,y=.7cm]
  \draw[blue] (0,0) grid (4,4);
\end{tikzpicture}
\end{document}
""",
}


def lines(pdf):
    doc = pymupdf.open(str(pdf))
    xs, ys = set(), set()
    for d in doc[0].get_drawings():
        for it in d["items"]:
            if it[0] == "l":
                a, b = it[1], it[2]
                if abs(a.x - b.x) < 0.01:
                    xs.add(round(a.x / CM, 3))
                if abs(a.y - b.y) < 0.01:
                    ys.add(round(a.y / CM, 3))
    doc.close()
    return sorted(xs), sorted(ys)


with tempfile.TemporaryDirectory() as tmp:
    for tag, tex in DOCS.items():
        src = pathlib.Path(tmp) / (tag + ".tex")
        src.write_text(tex, encoding="utf-8")
        subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", str(tmp), str(src)],
                       capture_output=True)
        pdf = pathlib.Path(tmp) / (tag + ".pdf")
        if not pdf.exists():
            print("%s: no pdf" % tag)
            continue
        xs, ys = lines(pdf)
        print("%s: %d vlines x=%s | %d hlines y=%s (cm from top-left of the box)"
              % (tag, len(xs), xs, len(ys), ys))
