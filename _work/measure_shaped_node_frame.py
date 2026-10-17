r"""What shape does a shaped node keep when the author writes only ONE measure?

`_work/probe_shape_size.py` found the defect from the product side: `\node[circle, draw,
minimum width=1cm] {ab}` came back as a Typst `#box(width: 1cm, ...)` with no `frame: "circle"` at
all -- the round node became an invisible rectangle -- while `minimum size=9mm` on the same shape
went through CeTz's range form and stayed a circle. The converter's branch order explains it: the
range form is only taken when BOTH half-extents are known, so a single key leaves `box` None.

Before choosing a fix, pdflatex has to say what TeX draws, because the two keys are not symmetric
for a circle:
  * does `minimum width=1cm` alone give a circle of diameter 1cm, or an ellipse 1cm x (text height)?
  * does the declared measure WIN over the text, or only act as a floor (TikZ's `minimum *` keys are
    documented as minimums, and a circle cannot have two diameters)?
  * what does `text width=` do to a circle -- it is a paragraph measure, so does the circle grow
    around the wrapped text?
Anchors answer in true cm: `east - center` is the half-width, `north - center` the half-height, and
both are read for the SAME node so a shifted reference cannot masquerade as a shape.
"""
import os
import re
import subprocess
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(errors="replace")

PT = 28.3465
CASES = [
    ("plain-circle-ab", "circle,draw", "ab"),
    ("minw1-ab", "circle,draw,minimum width=1cm", "ab"),
    ("minh1-ab", "circle,draw,minimum height=1cm", "ab"),
    ("minsize1-ab", "circle,draw,minimum size=1cm", "ab"),
    ("minw1-long", "circle,draw,minimum width=1cm", "a rather long label"),
    ("minsize1-long", "circle,draw,minimum size=1cm", "a rather long label"),
    ("textw1", "circle,draw,text width=1cm", "a rather long label"),
    ("ellipse-minw", "ellipse,draw,minimum width=2cm", "ab"),
    ("ellipse-minwh", "ellipse,draw,minimum width=2cm,minimum height=1cm", "ab"),
    ("rect-minw", "draw,minimum width=1cm", "ab"),
    ("minw1-sep0", "circle,draw,minimum width=1cm,inner sep=0pt", "ab"),
    ("minw1-anchor-center", "circle,draw,minimum width=1cm,anchor=center", "ab"),
    # two unequal measures on a circle: TeX has one diameter, so one of the keys must lose.
    # which one is what `max(hw, hh)` in the emitter has to agree with.
    ("minw1-minh06", "circle,draw,minimum width=1cm,minimum height=0.6cm", "ab"),
    ("minw06-minh1", "circle,draw,minimum width=0.6cm,minimum height=1cm", "ab"),
    ("minsize1-minh06", "circle,draw,minimum size=1cm,minimum height=0.6cm", "ab"),
    # a circle with no declared measure but a written `inner sep`: the padding the frame adds to the
    # text's own box is what a point-form circle has to reproduce.
    ("plain-ab", "circle,draw", "ab"),
    ("plain-sep5", "circle,draw,inner sep=5mm", "ab"),
    ("plain-sep0", "circle,draw,inner sep=0pt", "ab"),
    ("minw1-minh1", "circle,draw,minimum width=1cm,minimum height=1cm", "ab"),
    # the empty-text face: 952 nodes are drawn by the converter as a hardcoded `radius: 0.05`, which
    # is a claim about what TeX draws around NOTHING. `inner sep` is the only thing that has a size
    # there, so read the radius straight off the anchor.
    ("empty-plain", "circle,draw", ""),
    ("empty-sep0", "circle,draw,inner sep=0pt", ""),
    ("empty-sep1pt", "circle,draw,inner sep=1pt", ""),
    ("empty-sep2pt", "circle,fill=black,inner sep=2pt", ""),
    ("empty-minsize3pt", "circle,draw,minimum size=3pt", ""),
    ("empty-minsize1cm", "circle,draw,minimum size=1cm", ""),
    ("empty-sep5mm", "circle,draw,inner sep=5mm", ""),
]

DOC = r"""\documentclass[10pt]{article}
\usepackage{tikz}
\begin{document}
\makeatletter
\newcommand{\measure}[3]{%
  \begin{tikzpicture}
    \node[#2] (a) at (0,0) {#3};
    \pgfextractx{\dimen0}{\pgfpointanchor{a}{center}}%
    \pgfextractx{\dimen1}{\pgfpointanchor{a}{east}}%
    \pgfextracty{\dimen2}{\pgfpointanchor{a}{center}}%
    \pgfextracty{\dimen3}{\pgfpointanchor{a}{north}}%
    \typeout{SH,#1,\the\dimen1,\the\dimen3,END}%
  \end{tikzpicture}%
}
\makeatother
\measure{probe}{draw}{ab}
%(body)s
\end{document}
"""


def main():
    with tempfile.TemporaryDirectory() as tmp:
        body = "\n".join(r"\measure{%s}{%s}{%s}" % (name, opt, txt)
                         for name, opt, txt in CASES)
        tex = os.path.join(tmp, "sh.tex")
        open(tex, "w", encoding="utf-8").write(DOC.replace("%(body)s", body))
        r = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", tmp,
                            tex], capture_output=True)
        log = re.sub(r"\s+", "", open(os.path.join(tmp, "sh.log"),
                                      encoding="utf-8", errors="replace").read())
        got = {}
        for m in re.finditer(r"SH,([^,]+),(-?[\d.]+)pt,(-?[\d.]+)pt,END", log):
            got[m.group(1)] = (float(m.group(2)), float(m.group(3)))
        print("%-22s %10s %10s   %s" % ("case", "half-w pt", "half-h pt", "options / text"))
        print("%-22s %10.3f %10.3f   (reference: a plain framed `ab` node)"
              % ("probe", got["probe"][0], got["probe"][1]))
        for name, opt, txt in CASES:
            v = got.get(name)
            if v is None:
                print("%-22s  (missing)" % name)
                continue
            hw, hh = v
            print("%-22s %10.3f %10.3f   %s / %r%s"
                  % (name, hw, hh, opt, txt,
                     "" if abs(hw - hh) < 0.01 else "   <-- NOT a circle"))
        if r.returncode:
            print("(pdflatex rc=%d)" % r.returncode)


if __name__ == "__main__":
    main()
