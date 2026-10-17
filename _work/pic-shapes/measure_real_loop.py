r"""The production picture's own loop, measured out of pgf's scaled points.

The refused drawing is compiled exactly as the paper writes it, with `\pgfpathmoveto` and
`\pgfpathcurveto` dumped before pgf consumes them, so the dashed self-loop of node (six) is read
as TeX's own numbers: the two border anchors it leaves and re-enters through, the control points,
and -- from the four arcs of the node's own frame -- the radius of the circle those anchors sit on.
"""
import re
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
from t2t import cetz, convert, prep  # noqa: E402

CM = 2.54 / 72.27  # \the<dimen> prints TeX points

DUMP = r"""
\documentclass{article}
\usepackage{tikz}
\pagestyle{empty}
\makeatletter
\def\dt@pt#1{#1\typeout{PT \the\pgf@x,\the\pgf@y}}
\let\dt@move\pgfpathmoveto
\def\pgfpathmoveto#1{\dt@pt{#1}\typeout{MOVE}\dt@move{#1}}
\let\dt@curve\pgfpathcurveto
\def\pgfpathcurveto#1#2#3{\dt@pt{#1}\dt@pt{#2}\dt@pt{#3}\typeout{CURVE}\dt@curve{#1}{#2}{#3}}
\let\dt@line\pgfpathlineto
\def\pgfpathlineto#1{\dt@pt{#1}\typeout{LINE}\dt@line{#1}}
\makeatother
\begin{document}
%s
\end{document}
"""

SRC = next((HERE.parents[1] / "_work" / "flat").glob(
    "Translative-covering-densities-of-order-n-log-n*.tex"))
text = SRC.read_text(encoding="utf-8", errors="replace")
pre_text, _ = prep.split_document(text)
cm = convert.line_cm(prep.parse_preamble(pre_text))
pic = re.findall(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", text, re.S)[1]
src = HERE / "ml_real_picture.tex"
src.write_text(DUMP % pic, encoding="utf-8")
subprocess.run(["pdflatex", "-interaction=nonstopmode", src.name], cwd=str(HERE),
               capture_output=True, timeout=180)
log = (HERE / "ml_real_picture.log").read_text(encoding="utf-8", errors="replace")

ops, cur = [], []
SP = re.compile(r"PT (-?[\d.]+)pt,(-?[\d.]+)pt")
for line in log.splitlines():
    m = SP.search(line)
    if m:
        cur.append(tuple(float(g) * CM for g in m.groups()))
        continue
    tag = line.strip()
    if tag.startswith(("MOVE", "LINE", "CURVE")):
        n = {"MOVE": 1, "LINE": 1, "CURVE": 3}[tag]
        ops.append((tag, tuple(cur[-n:])))

print("picture from %s (linewidth %.2f cm)" % (SRC.name, cm))
print("path ops: %d; the last %d belong to the dashed self-loop and its head" % (len(ops), 8))
for kind, pts in ops[-9:]:
    print("  %-5s %s" % (kind, ["(%.4f, %.4f)" % p for p in pts]))
