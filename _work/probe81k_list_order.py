r"""Within ONE option list, does a `scale=` stretch the `xshift=` written in the same list?

The census's 13 real cases all write `[shift=...,scale=...]` with the shift first, so the emitter's
left-to-right accumulation must match pgf's own order. Measure it with a scope that carries both, and
keep one unshifted rectangle outside the scope as the reference:

  python _work/probe81k_list_order.py

Reports each stroked rect's left edge in cm from the reference and its width, so a stretched shift and
a scaled rect are read apart.
"""
import os
import subprocess
import sys
import tempfile

import fitz

CM = 28.452756
HEAD = r"""\documentclass[tikz,border=2pt]{standalone}
\usepackage{tikz}
\begin{document}
"""
TAIL = r"""
\end{document}
"""

# one scope at +x, its mirror at -x, plus the reference rect drawn by the picture itself
BODY = r"""\begin{tikzpicture}
 \begin{scope}[%s]   \draw (0,0) rectangle (0.2,0.2);\end{scope}
 \begin{scope}[%s]   \draw (0,0) rectangle (0.2,0.2);\end{scope}
 \draw (0,0) rectangle (0.2,0.2);
\end{tikzpicture}"""

CASES = {
    "shift,scale": "xshift=%s,scale=2",
    "scale,shift": "scale=2,xshift=%s",
    "shift alone": "xshift=%s",
}


def run(tex):
    d = tempfile.mkdtemp(prefix="m81k_")
    path = os.path.join(d, "c.tex")
    open(path, "w", encoding="utf-8").write(HEAD + tex + TAIL)
    r = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", d, "c.tex"],
                       capture_output=True, cwd=d)
    pdf = os.path.join(d, "c.pdf")
    if r.returncode or not os.path.exists(pdf):
        return None
    doc = fitz.open(pdf)
    rects = [(dg["rect"].x0, dg["rect"].width) for dg in doc[0].get_drawings()
             if dg.get("color") is not None and 3 < dg["rect"].width < 60]
    doc.close()
    return sorted(rects)


def main():
    for name, form in CASES.items():
        rects = run(BODY % (form % "1.7cm", form % "-1.7cm"))
        if not rects or len(rects) != 3:
            print("%-12s FATAL: %s" % (name, rects))
            continue
        ref = rects[1][0] if abs(rects[1][0] - (rects[0][0] + rects[2][0]) / 2) < 1 else None
        print("%-12s edges (cm from the middle one) %s   widths %s"
              % (name, ["%+.3f" % ((x - rects[1][0]) / CM) for x, _ in rects],
                 ["%.2f" % (w / CM) for _, w in rects]))
    print("\nwritten +-1.7cm with scale=2. Edges at +-1.700 leave the shift alone, +-3.400 stretch it.")


if __name__ == "__main__":
    sys.exit(main())
