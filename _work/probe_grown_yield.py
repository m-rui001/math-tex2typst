r"""How many canvases the grown label height moves, and whether any of them stop drawing.

The model only reaches a picture through a node's *placement* -- `below=of x` now steps over x's
rows -- so the blast radius is every picture that places one node off another, not just the nine
papers the census flagged. Replays `cetz.build` over the flat corpus twice, once with the measured
height switched off (the behaviour before the fix) and once with it on, and counts the pictures
whose canvas changes, the ones that start drawing, and the ones that stop. `build` never compiles,
so this costs no typst and can run beside the gate.
"""
import glob
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
real = cetz._text_height

changed = grew = stopped = started = same = 0
papers = {}
for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
    name = os.path.basename(path)[:-4]
    text = open(path, encoding="utf-8", errors="replace").read()
    for pic in PIC.findall(text):
        cetz._text_height = lambda *a: None
        old = cetz.build(pic)
        cetz._text_height = real
        new = cetz.build(pic)
        if old is None and new is None:
            continue
        if old is None:
            started += 1
            papers.setdefault(name, [0, 0, 0, 0])[3] += 1
        elif new is None:
            stopped += 1
            papers.setdefault(name, [0, 0, 0, 0])[2] += 1
        elif old == new:
            same += 1
        else:
            changed += 1
            grew += 1
            papers.setdefault(name, [0, 0, 0, 0])[0] += 1

print("canvases moved by a grown height: %d" % changed)
print("identical: %d   started drawing: %d   stopped drawing: %d" % (same, started, stopped))
print("papers touched: %d" % len(papers))
LIST = os.path.join(ROOT, "_work", "regen_needed.txt")
open(LIST, "w", encoding="utf-8").write("\n".join(sorted(papers)) + "\n")
print("wrote %s" % LIST)
for name, (mv, _a, stop, st) in sorted(papers.items(), key=lambda kv: -kv[1][0])[:24]:
    print("  %2d moved, %d started, %d stopped  %s" % (mv, st, stop, name[:56]))
