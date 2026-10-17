r"""The anchor a missing `out=` or `in=` key stands for, on a node that loops back to itself.

`_tangent_controls` already answers this for plain coordinates -- an absent key means the absolute
page direction 45 at the start and 135 at the end -- but a loop now starts on the node's border, so
the same fallback has to be confirmed for the anchor as well as for the control offset.
"""
import re
import subprocess
from pathlib import Path

HERE = Path(__file__).resolve().parent
CM = 2.54 / 72.27
NODE = r"\node[circle,draw,line width=.6pt,minimum size=8mm,inner sep=2pt,font=\small] (six) at (0,0) {$6$};"

PRELUDE = r"""
\documentclass{article}
\usepackage{tikz}
\pagestyle{empty}
\makeatletter
\def\dt@pt#1{#1\typeout{PT \the\pgf@x,\the\pgf@y}}
\let\dt@move\pgfpathmoveto
\def\pgfpathmoveto#1{\dt@pt{#1}\typeout{MOVE}\dt@move{#1}}
\let\dt@curve\pgfpathcurveto
\def\pgfpathcurveto#1#2#3{\dt@pt{#1}\dt@pt{#2}\dt@pt{#3}\typeout{CURVE}\dt@curve{#1}{#2}{#3}}
\makeatother
\begin{document}
\begin{tikzpicture}[x=1cm,y=1cm]
%s
\end{tikzpicture}
\end{document}
"""

CASES = [
    ("out only", NODE + r" \draw (six) to[out=135] (six);"),
    ("in only", NODE + r" \draw (six) to[in=45] (six);"),
    ("both, l5", NODE + r" \draw (six) to[out=135,in=45,looseness=5] (six);"),
    ("both, l1", NODE + r" \draw (six) to[out=135,in=45] (six);"),
    ("negative looseness", NODE + r" \draw (six) to[out=135,in=45,looseness=-1] (six);"),
    ("out=200,in=340", NODE + r" \draw (six) to[out=200,in=340,looseness=5] (six);"),
    ("tighten", NODE + r" \draw (six) to[out=135,in=45,tighten=2] (six);"),
]
SP = re.compile(r"PT (-?[\d.]+)pt,(-?[\d.]+)pt")

for label, body in CASES:
    src = HERE / ("ml_fb_%s.tex" % re.sub(r"\W", "", label))
    src.write_text(PRELUDE % body, encoding="utf-8")
    subprocess.run(["pdflatex", "-interaction=nonstopmode", src.name], cwd=str(HERE),
                   capture_output=True, timeout=180)
    log = (HERE / ("ml_fb_%s.log" % re.sub(r"\W", "", label))).read_text(
        encoding="utf-8", errors="replace")
    ops, cur = [], []
    for line in log.splitlines():
        m = SP.search(line)
        if m:
            cur.append(tuple(float(g) * CM for g in m.groups()))
        elif line.strip().startswith(("MOVE", "CURVE")):
            n = 1 if line.strip() == "MOVE" else 3
            ops.append((line.strip(), cur[-n:]))
    curves = [p for k, p in ops if k == "CURVE"]
    if not curves:
        print("%-20s no curve" % label)
        continue
    last = max(i for i, (k, _p) in enumerate(ops) if k == "CURVE")
    c1, c2, end = ops[last][1][0], ops[last][1][1], ops[last][1][2]
    start = next(p[0] for k, p in reversed(ops[:last]) if k == "MOVE")
    ang = lambda o, q: round(__import__("math").degrees(
        __import__("math").atan2(q[1] - o[1], q[0] - o[0])), 2)
    print("%-20s start=(%.4f,%.4f)@%s  c1=%s@%s  c2=%s@%s  end=(%.4f,%.4f)@%s"
          % (label, start[0], start[1], ang((0, 0), start), c1, ang(start, c1),
             c2, ang(end, c2), end[0], end[1], ang((0, 0), end)))
