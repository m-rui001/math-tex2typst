r"""Which node spellings reach the range frame, and how many product lines does that put mid-box?

#42 moves the words inside a frame CeTz draws over a RANGE from Typst's top-left to TeX's centre. The
size of that is every `content((x1, y1), (x2, y2), ..., frame:)` line on the page, so the count is read
off the products, split by the shape named on the line and by whether the body already carried an
`#align(` (the two-line `grown_box` path) or not. The first block prints what the converter emits for
the spellings the law has to cover, so a test can name the number rather than guess it.
"""
import glob
import io
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
import os  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz  # noqa: E402

SPELLINGS = [
    ("min 2x1", r"\node[draw, minimum width=2cm, minimum height=1cm] (a) at (0,0) {j};"),
    ("min 2x1 align right", r"\node[draw, minimum width=2cm, minimum height=1cm, align=right]"
                            r" (a) at (0,0) {j};"),
    ("text width + min h", r"\node[draw, text width=2cm, minimum height=1cm] (a) at (0,0)"
                            r" {ab cd ef};"),
    ("text width alone", r"\node[draw, text width=2.8cm] (a) at (0,0) {ab cd ef};"),
    ("minimum width alone", r"\node[draw, minimum width=2cm] (a) at (0,0) {j};"),
    ("circle sized", r"\node[circle, draw, minimum size=1cm] (a) at (0,0) {ab};"),
    ("circle unsized", r"\node[circle, draw, inner sep=1pt] (a) at (0,0) {ab};"),
    ("rect 2 lines sized", r"\node[draw, minimum width=2cm, minimum height=1cm] (a) at (0,0)"
                           r" {ab\\cd};"),
    ("rounded block", r"\node[draw, rounded corners, minimum width=12mm, minimum height=6.5mm]"
                      r" (a) at (0,0) {$j$};"),
]

for name, pic in SPELLINGS:
    got = cetz.build(r"\begin{tikzpicture}" + pic + r"\end{tikzpicture}")
    line = [l.strip() for l in (got or "").splitlines() if "content(" in l]
    print("%-22s %s" % (name, (line[0] if line else got)[:165]))

RANGE = re.compile(r"^\s*content\(\([^)]*\), \([^)]*\), .*?frame: \"(\w+)\"")
print("\n-- product lines drawn over a range --")
lines = canvases = papers = 0
by_shape = {}
for typ in glob.glob(os.path.join(ROOT, "typst", "*", "main.typ")):
    text = open(typ, encoding="utf-8", errors="replace").read()
    hit = 0
    for line in text.splitlines():
        m = RANGE.match(line)
        if m:
            hit += 1
            by_shape[m.group(1)] = by_shape.get(m.group(1), 0) + 1
    if hit:
        papers += 1
        canvases += text.count("#cetz.canvas(")
        lines += hit
print("lines %d over %d papers (%d canvases) -- %s"
      % (lines, papers, canvases, sorted(by_shape.items(), key=lambda kv: -kv[1])))
