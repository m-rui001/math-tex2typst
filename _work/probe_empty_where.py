r"""For each empty-content figure: is the drawing lost, or only placed outside its float?

`#figure([], caption: [...])` says the float's body came out empty. The drawing can still be on the
page as a canvas emitted just above the float (which is what `cetz_split` counts for equations), so
the question this answers is whether 12 empty contents mean 12 lost pictures or a layout split.
Prints the text standing immediately before each empty figure, and whether the paper's own source
holds a tikzpicture at all.
"""
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
TYPST = os.path.join(ROOT, "typst")
EMPTY = re.compile(r"#figure\(\s*\[\],", re.S)
CAP = re.compile(r"caption: \[(.{0,60})")

for stem in sorted(os.listdir(TYPST)):
    path = os.path.join(TYPST, stem, "main.typ")
    if not os.path.isfile(path):
        continue
    typ = open(path, encoding="utf-8", errors="replace").read()
    marks = list(EMPTY.finditer(typ))
    if not marks:
        continue
    flat = os.path.join(FLAT, stem + ".tex")
    if not os.path.isfile(flat):
        for other in os.listdir(FLAT):
            if other.startswith(stem[:40]) and other.endswith(".tex"):
                flat = os.path.join(FLAT, other)
                break
    src = open(flat, encoding="utf-8", errors="replace").read() if os.path.isfile(flat) else ""
    canvases = len(re.findall(r"^\s*canvas\(", typ, re.M))
    print("=== %-42s empty=%d  canvases in file=%d  tikz in source=%d"
          % (stem[:42], len(marks), canvases, src.count("\\begin{tikzpicture}")))
    for m in marks:
        before = typ[max(0, m.start() - 260):m.start()]
        cap = CAP.search(typ[m.start():m.start() + 900])
        near = "CANVAS-ABOVE" if "content(" in before or "canvas(" in before else \
            ("RAW-ABOVE" if "#raw(" in before else "nothing drawn above")
        print("   %-58s | %s" % ((cap.group(1).replace("\n", " ") if cap else "")[:58], near))
        if near == "nothing drawn above":
            print("        preceding: %s" % before.strip().replace("\n", " ")[-150:])
