r"""Print the Typst lines around every canvas that #70 put back, for a visual read.

The round replaced 7 markers spread over 5 papers, and a canvas that lands inside a display
equation is the one shape the maths path can hand back wrongly -- so the check is the surrounding
lines, not the canvas body.
"""
import io
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = r"E:\math"

for name in open(ROOT + r"\_work\regen_needed.txt", encoding="utf-8"):
    name = name.strip()
    if not name:
        continue
    lines = open(ROOT + r"\typst\%s\main.typ" % name, encoding="utf-8").read().split("\n")
    hits = [i for i, l in enumerate(lines) if "#cetz.canvas(" in l]
    print("=== %s  canvases=%d" % (name, len(hits)))
    shown = set()
    for i in hits:
        end = i
        depth = 0
        while end < len(lines):
            depth += lines[end].count("{") - lines[end].count("}")
            if depth <= 0:
                break
            end += 1
        for k in range(max(0, i - 4), min(len(lines), end + 5)):
            if k in shown:
                continue
            shown.add(k)
            print("%4d: %s" % (k + 1, lines[k][:150]))
        print("     ---")
