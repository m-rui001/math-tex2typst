r"""Under a picture-level `rotate=`/`scale=`, does a NODE's own `xshift=` go through the matrix?

The test `test_a_node_moves_by_its_own_shift` pins the old belief ("an absolute length even inside a
turned scope"), while the scope control (`_work/probe81e_scale_shift.py`) says pgf turns a shift with
the matrix. Settle the node spelling the same way: place one node with `xshift=1cm` beside one without,
and read where the two words land on the page.

  python _work/probe81g_node_shift.py
"""
import os
import subprocess
import sys
import tempfile

import fitz

CM = 28.452756
HEAD = r"""\documentclass[tikz,border=6pt]{standalone}
\usepackage{tikz}
\begin{document}
"""
TAIL = r"""
\end{document}
"""

CASES = {
    "plain": r"""\begin{tikzpicture}
  \node (o) at (0,0) {ORIGIN};
  \node[xshift=1cm] at (0,0) {SHIFTED};
\end{tikzpicture}""",
    "rot90": r"""\begin{tikzpicture}[rotate=90]
  \node (o) at (0,0) {ORIGIN};
  \node[xshift=1cm] at (0,0) {SHIFTED};
\end{tikzpicture}""",
    "scale2": r"""\begin{tikzpicture}[scale=2]
  \node (o) at (0,0) {ORIGIN};
  \node[xshift=1cm] at (0,0) {SHIFTED};
\end{tikzpicture}""",
    "axis2": r"""\begin{tikzpicture}[x=2cm,y=2cm]
  \node (o) at (0,0) {ORIGIN};
  \node[xshift=1cm] at (0,0) {SHIFTED};
\end{tikzpicture}""",
    "scope": r"""\begin{tikzpicture}
  \node (o) at (0,0) {ORIGIN};
  \begin{scope}[rotate=90] \node[xshift=1cm] at (0,0) {SHIFTED}; \end{scope}
\end{tikzpicture}""",
    # the two spellings the emitter now distinguishes: does a shift listed AFTER the scale
    # stretch, and does one listed BEFORE it still apply to the scaled picture?
    "head_scale_shift": r"""\begin{tikzpicture}[scale=2,xshift=1cm]
  \node (o) at (0,0) {ORIGIN};
  \node (n) at (0,0) {SHIFTED};
\end{tikzpicture}""",
    "head_shift_scale": r"""\begin{tikzpicture}[xshift=1cm,scale=2]
  \node (o) at (0,0) {ORIGIN};
  \node (n) at (0,0) {SHIFTED};
\end{tikzpicture}""",
}


def run(tex):
    d = tempfile.mkdtemp(prefix="m81g_")
    path = os.path.join(d, "c.tex")
    open(path, "w", encoding="utf-8").write(HEAD + tex + TAIL)
    r = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", d, "c.tex"],
                       capture_output=True, cwd=d)
    pdf = os.path.join(d, "c.pdf")
    if r.returncode or not os.path.exists(pdf):
        return None
    doc = fitz.open(pdf)
    words = {}
    for w in doc[0].get_text("words"):
        words[w[4]] = (w[0], w[2], w[1], w[3])  # left, right, top, bottom in pt
    doc.close()
    return words


def main():
    for name, tex in CASES.items():
        words = run(tex)
        if not words or "ORIGIN" not in words or "SHIFTED" not in words:
            print("%-7s FATAL: %s" % (name, words))
            continue
        a, b = words["ORIGIN"], words["SHIFTED"]
        dx = ((b[0] + b[1]) - (a[0] + a[1])) / 2
        dy = ((b[2] + b[3]) - (a[2] + a[3])) / 2
        print("%-7s SHIFTED centre - ORIGIN centre:  x %+.3fcm   y %+.3fcm (up is +)"
              % (name, dx / CM, -dy / CM))
    print("\n1cm written. If rot90 reads ~0cm in x the shift was turned onto y; if it reads +1cm it was not.")


if __name__ == "__main__":
    sys.exit(main())
