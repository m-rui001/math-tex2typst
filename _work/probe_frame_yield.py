r"""Yield of the Typst-`box` node frame: how many corpus pictures draw a frame they used to drop.

Static, through cetz.build (no typst). Counts emitted `#box(` lines, the older `frame: "` sized
lines, and prints the Deterministic-Polynomial flowchart nodes run67's screenshot showed frameless.
"""
import io
import re
import sys
from pathlib import Path

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
sys.path.insert(0, "tools")
from t2t import cetz

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)

built = boxed = frames_old = nodes = 0
papers = set()
box_lines = 0
for f in sorted(Path("_work/flat").glob("*.tex")):
    for pic in PIC.findall(f.read_text(encoding="utf-8", errors="replace")):
        out = cetz.build(pic)
        if out is None:
            continue
        built += 1
        n = out.count("#box(")
        box_lines += n
        nodes += len(re.findall(r"^\s*content\(", out, re.M))
        frames_old += out.count('frame: "')
        if n:
            boxed += 1
            papers.add(f.stem[:44])

print("pictures built: %d" % built)
print("content() node lines: %d" % nodes)
print("pictures now emitting a #box( frame: %d over %d papers" % (boxed, len(papers)))
print("total #box( lines: %d ; sized `frame:` boxes: %d" % (box_lines, frames_old))

target = next((f for f in Path("_work/flat").glob("Deterministic-Polynomial*.tex")), None)
if target:
    pic = PIC.search(target.read_text(encoding="utf-8", errors="replace")).group(0)
    out = cetz.build(pic)
    print("\nfirst picture of %s:" % target.stem[:44])
    for line in out.splitlines():
        if "content(" in line:
            print("  " + line.strip()[:118])
