r"""What does TeX actually draw for `to[out=,in=,looseness=]` between identical points?

Two questions, both answered from pgf's own numbers rather than from a picture:

  * a `to` whose two endpoints are the same *coordinate*, and
  * a `to` whose two endpoints are the same *named node*, where TikZ takes its endpoints off the
    node's border instead of its centre, and
  * the same again written with the `loop` / `loop above|below|left|right` keys, which is how papers
    actually write a self-loop -- those keys carry their own angles and a default looseness, and since
    a loop's chord is zero no chord-proportional control distance can reproduce one.

`\pgfpathmoveto`/`\pgfpathcurveto` are dumped before pgf uses them, so the numbers are pgf's exact
scaled points (sp), and each case renders in its own document with an undrawn node -- the only path
operations left in the log belong to the curve being measured.
"""
import re
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
CM = 2.54 / 72.27  # a TeX point, in cm: 	he\pgf@x prints dimens in pt

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
\let\dt@line\pgfpathlineto
\def\pgfpathlineto#1{\dt@pt{#1}\typeout{LINE}\dt@line{#1}}
\makeatother
\begin{document}
\tikzset{slot/.style={circle,minimum size=8mm,inner sep=2pt,font=\small}}
\tikzset{slotd/.style={circle,draw,minimum size=8mm,inner sep=2pt,font=\small}}
\tikzset{box/.style={rectangle,minimum size=8mm,inner sep=2pt,font=\small}}
\begin{tikzpicture}[%s]
%s
\end{tikzpicture}
\end{document}
"""

CASES = [
    ("coord_l1", r"\draw (0,0) to[out=135,in=45] (0,0);"),
    ("coord_l5", r"\draw (0,0) to[out=135,in=45,looseness=5] (0,0);"),
    ("node_l1", r"\node[slot] (six) at (0,0) {$6$}; \draw (six) to[out=135,in=45] (six);"),
    ("node_l5", r"\node[slot] (six) at (0,0) {$6$}; \draw (six) to[out=135,in=45,looseness=5] (six);"),
    ("node_l5_90", r"\node[slot] (six) at (0,0) {$6$}; \draw (six) to[out=90,in=90,looseness=5] (six);"),
    ("node_l5_45_135", r"\node[slot] (six) at (0,0) {$6$}; \draw (six) to[out=45,in=135,looseness=5] (six);"),
    ("node_l5_small", r"\node[slot] (six) at (0,0) {$6$}; \draw (six) to[out=135,in=45,looseness=5] (six);"
                      .replace("8mm", "4mm")),
    ("node_l5_big", r"\node[slot] (six) at (0,0) {$6$}; \draw (six) to[out=135,in=45,looseness=5] (six);"
                    .replace("8mm", "20mm")),
    ("box_l5", r"\node[box] (six) at (0,0) {$6$}; \draw (six) to[out=135,in=45,looseness=5] (six);"),
    ("two_l5", r"\node[slot] (six) at (0,0) {$6$}; \node[slot] (other) at (2,0) {$7$}; "
               r"\draw (six) to[out=135,in=45,looseness=5] (other);"),
    ("coord_l5_2cm", r"\draw (0,0) to[out=135,in=45,looseness=5] (2,0);"),
    # the `loop` KEY, which is what papers actually write: tikz's own definitions turn
    # `loop above`/`below`/`left`/`right` into out=/in= plus the `loop` style with looseness 8, and a
    # loop's chord is ZERO, so nothing here can be chord-proportional -- the control distance has to
    # be a length of its own.
    ("coord_loop", r"\draw (0,0) to[loop] (0,0);"),
    ("coord_loop_above", r"\draw (0,0) to[loop above] (0,0);"),
    ("coord_loop_below", r"\draw (0,0) to[loop below] (0,0);"),
    ("coord_loop_left", r"\draw (0,0) to[loop left] (0,0);"),
    ("coord_loop_right", r"\draw (0,0) to[loop right] (0,0);"),
    ("textnode_loop_above", r"\node (R) at (0,0) {$R$}; \draw[->] (R) to[loop above] (R);"),
    ("textnode_loop_right", r"\node (R) at (0,0) {$R$}; \draw[->] (R) to[loop right] (R);"),
    ("circle_loop_above", r"\node[slot] (six) at (0,0) {$6$}; \draw (six) to[loop above] (six);"),
    ("box_loop_above", r"\node[box] (six) at (0,0) {$6$}; \draw (six) to[loop above] (six);"),
    ("circle_loop_above_l4", r"\node[slot] (six) at (0,0) {$6$}; "
                             r"\draw (six) to[loop above,looseness=4] (six);"),
    ("circle_out90_l8", r"\node[slot] (six) at (0,0) {$6$}; "
                        r"\draw (six) to[out=90,in=90,looseness=8] (six);"),
    ("coord_out90_l8", r"\draw (0,0) to[out=90,in=90,looseness=8] (0,0);"),
    # is the loop's control distance a length of its own or a multiple of the canvas unit?  a picture
    # with x=2cm separates the two, and the looseness sweep says how the key's default scales.
    ("coord_loop_above_l2", r"\draw (0,0) to[loop above,looseness=2] (0,0);"),
    ("coord_loop_above_l4", r"\draw (0,0) to[loop above,looseness=4] (0,0);"),
    ("coord_loop_above_l8", r"\draw (0,0) to[loop above,looseness=8] (0,0);"),
    ("coord_loop_above_l16", r"\draw (0,0) to[loop above,looseness=16] (0,0);"),
    ("coord_loop_above_pt", r"\draw (0,0) to[loop above] (0,0);", "x=1pt,y=1pt"),
    ("coord_loop_above_2cm", r"\draw (0,0) to[loop above] (0,0);", "x=2cm,y=2cm"),
    ("circle_loop_above_2cm", r"\node[slot] (six) at (0,0) {$6$}; \draw (six) to[loop above] (six);",
     "x=2cm,y=2cm"),
]

SP = re.compile(r"PT (-?[\d.]+)pt,(-?[\d.]+)pt")


def run(label, body, spec="x=1cm,y=1cm"):
    src = HERE / ("ml_%s.tex" % label)
    src.write_text(PRELUDE % (spec, body), encoding="utf-8")
    proc = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-no-file-line-error", src.name],
                          cwd=str(HERE), capture_output=True, text=True, timeout=180)
    log = (HERE / ("ml_%s.log" % label)).read_text(encoding="utf-8", errors="replace")
    ops, cur = [], []
    for line in log.splitlines():
        m = SP.match(line.strip())
        if m:
            cur.append(tuple(float(g) * CM for g in m.groups()))
            continue
        if line.strip().startswith("MOVE"):
            ops.append(("move", cur[-1] if cur else None))
        elif line.strip().startswith("LINE"):
            ops.append(("line", cur[-1] if cur else None))
        elif line.strip().startswith("CURVE"):
            ops.append(("curve", tuple(cur[-3:])))
    if proc.returncode:
        print("%-14s pdflatex rc=%s" % (label, proc.returncode))
    print("%-14s %d path ops" % (label, len(ops)))
    for kind, pts in ops:
        if kind == "curve":
            print("      curve: c1=%s c2=%s end=%s" % (fmt(pts[0]), fmt(pts[1]), fmt(pts[2])))
        else:
            print("      %s %s" % (kind, fmt(pts)))
    return ops


def fmt(p):
    return "(%.4f, %.4f)" % p if p else "None"


for case in CASES:
    label, body = case[0], case[1]
    ops = run(label, body, *case[2:])
    moves = [p for k, p in ops if k == "move"]
    curves = [p for k, p in ops if k == "curve"]
    if not curves:
        print("   -> nothing curved: TeX draws no path at all")
    for i, c in enumerate(curves):
        print("   curve %d: start=%s c1=%s c2=%s end=%s"
              % (i, fmt(moves[-1] if moves else None), fmt(c[0]), fmt(c[1]), fmt(c[2])))
