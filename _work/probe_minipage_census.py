"""Census the two minipage-subfigure defects: stacked side-by-side minipages, and
`x=0.2\\linewidth` resolved against the text column instead of the minipage's own width."""
import io
import os
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
FIGURE = re.compile(r"\\begin\{figure\*?\}.*?\\end\{figure\*?\}", re.S)
MINIPAGE = re.compile(r"\\begin\{minipage\}\[?[a-zA-Z]?\]?\s*(\{[-+.\d]*\\(?:linewidth|textwidth)\})?")
TWO = re.compile(r"0?\.\d+\\linewidth")

stacked, narrow_unit, both = [], [], []
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    src = path.read_text(encoding="utf-8", errors="replace")
    if not (ROOT / "typst" / path.stem).is_dir():
        continue
    figs = [f for f in FIGURE.findall(src) if "\\begin{tikzpicture}" in f]
    if not figs:
        continue
    multi = any(len(MINIPAGE.findall(f)) >= 2 for f in figs)
    # a tikzpicture option that sizes an axis off the column, sitting inside a narrow minipage
    narrow = False
    for f in figs:
        if not re.search(r"\\begin\{minipage\}[^\n]*\{0?\.\d+\\(?:linewidth|textwidth)\}", f):
            continue
        for pic in re.finditer(r"\\begin\{tikzpicture\}\[([^\]]*)\]", f):
            if "\\linewidth" in pic.group(1) or "\\textwidth" in pic.group(1):
                narrow = True
    if multi:
        stacked.append(path.stem)
    if narrow:
        narrow_unit.append(path.stem)
    if multi and narrow:
        both.append(path.stem)
print("figures with 2+ minipages (stacked in ours): %d papers" % len(stacked))
print("tikzpicture inside a fractional-width minipage: %d papers" % len(narrow_unit))
print("both: %d papers" % len(both))
for n in narrow_unit[:12]:
    print("   narrow:", n[:70])
