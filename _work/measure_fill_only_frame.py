r"""Does a node filled but not drawn get a border? Count the strokes on the page.

#49's second leg claims TikZ paints a `fill=white` label as a background and NOTHING around it, while
the converter was giving every such frame a 0.4pt rule. The oracle is the PDF's own content stream:
fitz reads each path and says whether it is a stroke (`st`) or a fill (`f`), so a picture of a label
sitting on a long line answers the question as a count -- one stroke for the line, two more once the
node also says `draw`.
"""
import os
import subprocess
import sys
import tempfile

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

TEX = r"""
\documentclass[tikz,border=2pt]{standalone}
\begin{document}
\begin{tikzpicture}
  \draw (0,0) -- (4,0);
  \node[%s,inner sep=3pt] at (2,0) {$D_u$};
\end{tikzpicture}
\end{document}
"""
CASES = [("fill only", "fill=white"), ("draw + fill", "draw,fill=white"),
         ("bare node", "inner sep=3pt")]


def strokes(page):
    """Every path on the page as (what the path does, width, height) -- `s` strokes, `f` fills."""
    out = []
    for d in page.get_drawings():
        out.append((d["type"], round(d["rect"].width, 1), round(d["rect"].height, 1)))
    return out


def main():
    with tempfile.TemporaryDirectory() as tmp:
        for n, (label, opts) in enumerate(CASES):
            src = os.path.join(tmp, "t%d.tex" % n)
            with open(src, "w", encoding="utf-8") as f:
                f.write(TEX % opts)
            subprocess.run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error", src],
                           cwd=tmp, capture_output=True)
            doc = fitz.open(os.path.join(tmp, "t%d.pdf" % n))
            print("%-10s paths: %s" % (label, strokes(doc[0])))
            doc.close()


if __name__ == "__main__":
    main()
