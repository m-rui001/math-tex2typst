r"""Does a node's BOX grow with its pen, and by how much -- measured on pdflatex.

#91 prices the rule a stroke carries.  Two other places already read `line width`: `_outer_sep` (an
anchor's border sits `outer sep=auto` = half the node's own rule off the box) and the box slack law of
#73 (`_node_pad`: .3333em + half the rule).  A bare pen NAME (`[thick]`) is a pen those two readers do
not see, so if a name grew the box the way a length does, pricing it in `stroke_args` alone would put
the product's borders 0.2pt off -- measurable or not, the answer has to be a number, not a guess.

One case per page, `\typeout` of `center->east` and `center->north` (axis 59: reading ink off a page
when the log can give the coordinate).
"""
import io
import os
import re
import subprocess
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = tempfile.mkdtemp(prefix="m91pen_", dir=os.path.join(ROOT, "_work"))
LABEL = r"$F_{1,+}^{+,+}$"

CASES = [
    ("default", ""),
    ("ultra thin", "ultra thin"),
    ("thin", "thin"),
    ("semithick", "semithick"),
    ("thick", "thick"),
    ("very thick", "very thick"),
    ("ultra thick", "ultra thick"),
    ("line width=0.8pt", "line width=0.8pt"),
    ("line width=2pt", "line width=2pt"),
]
HEAD = [("head 12pt", "line width=12pt"), ("head thick", "thick")]

PROLOG = r"""\documentclass[11pt]{article}
\usepackage{amsmath,amssymb}
\usepackage{tikz}
\makeatletter
\newcommand\report[2]{%
  \pgfextractx{\dimen4}{\pgfpointdiff{\pgfpointanchor{#1}{center}}{\pgfpointanchor{#1}{east}}}%
  \pgfextracty{\dimen6}{\pgfpointdiff{\pgfpointanchor{#1}{center}}{\pgfpointanchor{#1}{north}}}%
  \typeout{GOT #2 E=\the\dimen4 N=\the\dimen6}}
\makeatother
\begin{document}
"""


def build_tex(cases, head=""):
    body = []
    for i, (name, opt) in enumerate(cases):
        opts = ("[" + opt + "]") if opt else ""
        body.append(r"\begin{tikzpicture}%s" % opts + r"""
  \node[draw] (n) at (0,0) {%s};
  \report{n}{%d}
\end{tikzpicture}""" % (LABEL, i))
    return PROLOG + "\n".join(body) + "\n\\end{document}\n"


def run(tag, cases, head=""):
    path = os.path.join(OUT, tag)
    io.open(path + ".tex", "w", encoding="utf-8").write(build_tex(cases, head))
    if os.path.exists(path + ".pdf"):
        os.remove(path + ".pdf")
    subprocess.run(["pdflatex", "-interaction=nonstopmode", os.path.basename(path) + ".tex"],
                   cwd=OUT, capture_output=True, text=True)
    log = io.open(path + ".log", encoding="utf-8", errors="replace").read()
    got = {}
    for i, e, n in re.findall(r"GOT (\d+) E=(-?[\d.]+)pt ?N=(-?[\d.]+)pt", log):
        got[int(i)] = (float(e), float(n))
    base = got.get(0)
    print("== %s   (default half-box E=%.4f N=%.4f pt)" % (tag, base[0], base[1]))
    for i, (name, opt) in enumerate(cases):
        if i not in got:
            print("   %-22s  (no reading)" % name)
            continue
        e, n = got[i]
        print("   %-22s E=%8.4f  d_E=%+7.4f   N=%8.4f  d_N=%+7.4f"
              % (name, e, e - base[0], n, n - base[1]))
    return got


run("stmt", CASES)
run("head", [("default", ""), ("x", HEAD[0][1]), ("y", HEAD[1][1])])
print("temp: %s" % OUT)
