r"""The outer-sep law behind a node self-loop's anchors.

A loop back to the same point has zero chord between node *centres*, yet TeX draws a real curve:
its endpoints are the node's border anchors, and a border sits outside the box the author declared.
Each case below dumps pgf's own `\pgfpathmoveto` numbers, so the gap between a declared
`minimum size` and the radius the loop starts from is measured rather than assumed.
"""
import re
import subprocess
from pathlib import Path

HERE = Path(__file__).resolve().parent
CM = 2.54 / 72.27

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

LOOP = r"\draw (six) to[out=135,in=45,looseness=5] (six);"
CASES = [
    ("plain coord", r"\draw (0,0) to[out=135,in=45,looseness=5] (0,0);"),
    ("circle, undrawn", r"\node[circle,minimum size=8mm] (six) at (0,0) {$6$}; " + LOOP),
    ("circle, drawn", r"\node[circle,draw,minimum size=8mm] (six) at (0,0) {$6$}; " + LOOP),
    ("circle, drawn lw=2pt",
     r"\node[circle,draw,line width=2pt,minimum size=8mm] (six) at (0,0) {$6$}; " + LOOP),
    ("circle, undrawn lw=2pt",
     r"\node[circle,line width=2pt,minimum size=8mm] (six) at (0,0) {$6$}; " + LOOP),
    ("circle, sep on picture",
     r"\node[circle,draw,minimum size=8mm,inner sep=2pt,font=\small] (six) at (0,0) {$6$}; " + LOOP),
    ("circle, outer sep=0pt",
     r"\node[circle,draw,outer sep=0pt,minimum size=8mm] (six) at (0,0) {$6$}; " + LOOP),
    ("circle, outer sep=1mm",
     r"\node[circle,draw,outer sep=1mm,minimum size=8mm] (six) at (0,0) {$6$}; " + LOOP),
    ("circle, minimum size=20mm",
     r"\node[circle,draw,minimum size=20mm] (six) at (0,0) {$6$}; " + LOOP),
    ("circle, min size w=big text",
     r"\node[circle,draw,minimum size=8mm] (six) at (0,0) {wide text here}; " + LOOP),
    ("rect node", r"\node[draw,minimum size=8mm] (six) at (0,0) {$6$}; " + LOOP),
    ("ellipse node", r"\node[draw,ellipse,minimum size=8mm] (six) at (0,0) {$6$}; " + LOOP),
    ("circle, no minimum size", r"\node[circle,draw] (six) at (0,0) {$6$}; " + LOOP),
]

SP = re.compile(r"PT (-?[\d.]+)pt,(-?[\d.]+)pt")


def ops(label, body):
    src = HERE / ("ml_sep_%s.tex" % re.sub(r"\W", "", label))
    src.write_text(PRELUDE % body, encoding="utf-8")
    subprocess.run(["pdflatex", "-interaction=nonstopmode", src.name], cwd=str(HERE),
                   capture_output=True, timeout=180)
    log = (HERE / ("ml_sep_%s.log" % re.sub(r"\W", "", label))).read_text(
        encoding="utf-8", errors="replace")
    out, cur = [], []
    for line in log.splitlines():
        m = SP.search(line)
        if m:
            cur.append(tuple(float(g) * CM for g in m.groups()))
        elif line.strip().startswith(("MOVE", "CURVE")):
            n = 1 if line.strip() == "MOVE" else 3
            out.append((line.strip(), tuple(cur[-n:])))
    return out


for label, body in CASES:
    got = ops(label, body)
    loop = [(k, p) for k, p in got if k == "CURVE"][-1] if any(
        k == "CURVE" for k, _ in got) else None
    if loop is None:
        print("%-26s no curve" % label)
        continue
    moves = [p for k, p in got if k == "MOVE"]
    start = moves[-1][0]
    c1, c2, end = loop[1]
    r1 = (start[0] ** 2 + start[1] ** 2) ** 0.5
    r2 = (end[0] ** 2 + end[1] ** 2) ** 0.5
    chord = ((end[0] - start[0]) ** 2 + (end[1] - start[1]) ** 2) ** 0.5
    off = ((c1[0] - start[0]) ** 2 + (c1[1] - start[1]) ** 2) ** 0.5
    print("%-26s R_start=%.4f R_end=%.4f chord=%.4f offset=%.4f off/chord=%.5f "
          "apex_y=%.4f start=(%.4f, %.4f)"
          % (label, r1, r2, chord, off, off / chord if chord else 0, c1[1], start[0], start[1]))
