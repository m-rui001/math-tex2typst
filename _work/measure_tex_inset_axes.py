r"""What TeX draws when a node spells its padding per axis: `inner xsep` / `inner ysep`.

The padding fix (#46) spends the node's own `inner sep` on the Typst box; 27 declarations over 11
papers write it one axis at a time instead (`_work/flat`, `grep -o "inner [xy]sep *="`), and nothing in
the converter reads those keys. Before wiring them, pdflatex has to say which axis a written measure
lands on and what the axis nobody wrote down is left at:

  * does `inner xsep=7pt` leave the vertical gap at pgf's default (`0.3333em`), or at zero?
  * with `inner sep=2pt, inner xsep=7pt`, does the axis-specific key override the general one?
  * for `text width=D`, the drawn frame is D plus the padding on each side (#39) -- is the side it adds
    the HORIZONTAL padding, so a `text width` node with `inner xsep=7pt` is wider than one with only
    `inner ysep=7pt`?

Anchors answer in points: `east - center` is the half-width, `north - center` the half-height, both
read for the SAME node. The reference node (`draw`, text `ab`, nothing declared) fixes where the text's
own box ends, so every other row's padding is a difference from it.
"""
import os
import re
import subprocess
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.stdout.reconfigure(errors="replace")

TEXT = "ab"
CASES = [
    ("xsep7", "draw,inner xsep=7pt"),
    ("ysep7", "draw,inner ysep=7pt"),
    ("sep2-xsep7", "draw,inner sep=2pt,inner xsep=7pt"),
    ("xsep7-sep2", "draw,inner xsep=7pt,inner sep=2pt"),
    ("xsep0", "draw,inner xsep=0pt"),
    ("textw3cm", "draw,text width=3cm"),
    ("textw3cm-xsep7", "draw,text width=3cm,inner xsep=7pt"),
    ("textw3cm-ysep7", "draw,text width=3cm,inner ysep=7pt"),
    ("minw2cm-xsep7", "draw,minimum width=2cm,inner xsep=7pt"),
]

DOC = r"""\documentclass[10pt]{article}
\usepackage{tikz}
\begin{document}
\makeatletter
\newcommand{\measure}[2]{%
  \begin{tikzpicture}
    \node[#2] (a) at (0,0) {ab};
    \pgfextractx{\dimen1}{\pgfpointanchor{a}{east}}%
    \pgfextracty{\dimen3}{\pgfpointanchor{a}{north}}%
    \typeout{SH,#1,\the\dimen1,\the\dimen3,END}%
  \end{tikzpicture}%
}
\makeatother
\measure{ref}{draw}
\measure{bare}{inner sep=0pt}
%(body)s
\end{document}
"""


def main():
    with tempfile.TemporaryDirectory() as tmp:
        body = "\n".join(r"\measure{%s}{%s}" % (name, opt) for name, opt in CASES)
        tex = os.path.join(tmp, "sh.tex")
        open(tex, "w", encoding="utf-8").write(DOC.replace("%(body)s", body))
        subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", tmp,
                        tex], capture_output=True)
        log = re.sub(r"\s+", "", open(os.path.join(tmp, "sh.log"),
                                      encoding="utf-8", errors="replace").read())
        got = {}
        for m in re.finditer(r"SH,([^,]+),(-?[\d.]+)pt,(-?[\d.]+)pt,END", log):
            got[m.group(1)] = (float(m.group(2)), float(m.group(3)))
        ref = got.get("ref")
        if ref is None:
            print("no reference row read -- the harness broke")
            return
        bare = got.get("bare")
        print("%-16s %10s %10s   %10s %10s   %s"
              % ("case", "half-w", "half-h", "dX vs ref", "dY vs ref", "options"))
        print("%-16s %10.3f %10.3f   %10s %10s   (reference: `draw', text %r)"
              % ("ref", ref[0], ref[1], "-", "-", TEXT))
        print("%-16s %10.3f %10.3f   %10.3f %10.3f   the text's own box (inner sep=0pt)"
              % ("bare", bare[0], bare[1], bare[0] - ref[0], bare[1] - ref[1]))
        for name, opt in CASES:
            v = got.get(name)
            if v is None:
                print("%-16s  (missing)" % name)
                continue
            print("%-16s %10.3f %10.3f   %10.3f %10.3f   %s"
                  % (name, v[0], v[1], v[0] - ref[0], v[1] - ref[1], opt))


if __name__ == "__main__":
    main()
