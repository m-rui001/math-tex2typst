import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "tools"))
from t2t import cetz

# the four failing tests' pictures, with the two boxes' own heights read off pdflatex's records
CASES = [
    ("two-dist", r"\node (t) at (0,0) {T};", r"below left=12mm and -12mm of t"),
    ("two-dist", r"\node (t) at (0,0) {T};", r"above right=1cm and 2cm of t"),
    ("one-dist", r"\node (t) at (0,0) {T};", r"below=1cm of t"),
    ("one-dist", r"\node (t) at (0,0) {T};", r"right=1cm and 2cm of t"),
    ("flowchart", r"\node (t) at (0,0) {T};", r"below=of t"),
    ("anchor", r"\node (t) at (0,0) {T};", r"below=23mm of t.south"),
    ("minsize", r"\node[minimum size=2cm] (t) at (0,0) {T};", r"below=1cm of t.south"),
]
for name, decl, opt in CASES:
    built = cetz.build(r"\begin{tikzpicture}" + decl + r"\node[" + opt + r"] {N};\end{tikzpicture}") or ""
    last = [line.strip() for line in built.splitlines() if "content(" in line][-1]
    print("%-10s %-32s %s" % (name, opt, last))

calc = (r"\node[text width=1cm] (count) at (0,0) {C};"
        r"\node[text width=1cm] (bounds) at (6,0) {B};")
for opt in (r"below=1cm of $(count)!0.5!(bounds)$",
            r"below=1cm of $(count.south)!0.5!(bounds.south)$"):
    built = cetz.build(r"\begin{tikzpicture}" + calc + r"\node[" + opt + r"] {N};\end{tikzpicture}") or ""
    print("calc       %-32s %s" % (opt, [line.strip() for line in built.splitlines() if "content(" in line][-1]))

pic = (r"\begin{tikzpicture}[font=\small,"
       r"stage/.style={draw=black!60,text width=5.7cm,align=left,inner sep=8pt}]"
       r"\node[stage] (up) at (0,0) {one\\[3pt]two\\three\\four\\five\\six};"
       r"\node[below=6mm of up] (p) {P};\end{tikzpicture}")
lines = [line.strip() for line in cetz.build(pic).splitlines() if "content(" in line]
print("rows       both %s" % lines)
bare = cetz.build(r"\begin{tikzpicture}\node (t) at (0,0) {a\\b\\c};"
                  r"\node[below=6mm of t] {P};\end{tikzpicture}")
print("bare       last %s" % [line.strip() for line in bare.splitlines() if "content(" in line][-1])
step = cetz.build(r"\begin{tikzpicture}\node (a) at (0,0) {$KX_1(B)$};"
                  r"\node[right=1cm of a] (b) {P};\end{tikzpicture}")
print("step       last %s" % [line.strip() for line in step.splitlines() if "content(" in line][-1])

# the two heights the pins above should decompose into, straight from the pdflatex records
for label in ("T", "N", "a\\\\b\\\\c", "P"):
    o = {} if label != "P" else {"font": "\\small"}
    print("height %-10s %s pt" % (label, cetz._text_height(o, None, label) / cetz.UNITS["pt"]))
