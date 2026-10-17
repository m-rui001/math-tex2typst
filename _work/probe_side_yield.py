r"""How many canvases print an edge label on top of the line it labels?

`_node_shift` moves a node for `xshift` / `yshift` only and `_node_anchor` reads
`above` / `below` / `left` / `right` only when the word stands bare, so the spelling an edge label
picks -- `node[above=20pt]` -- loses both the anchor and the 20pt and lands on the segment.
Measured against pdflatex (`_work/measure_side_key_offset.py`): the node's south point sits exactly
`d` above the coordinate, so the fix is the anchor plus a `d` shift, not `d` plus a half-height.

This counts the pictures that write a side key with a dimension and no ` of ` (the `of` form is a
placement relative to another node, which `placed_at` already answers), and whether the built
canvas moves the label at all.
"""
import glob
import os
import re
import sys
from collections import Counter

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(errors="replace")
from t2t import cetz  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
# a side key whose value starts with a dimension: `above=20pt`, `below=1.5em`, `right=3mm`
SIDE = re.compile(r"\b(above|below|left|right)\s*=\s*\{?\s*[-\d.]*(?:pt|cm|mm|em|ex|in|bp)\b", re.I)
OF = re.compile(r"\bof\b", re.I)
NODE = re.compile(r"\\node\s*(?:\[[^\]]*\])?\s*(?:\([^()]*\))?\s*\[([^\]]*)\]")

words = Counter()
canvases = 0
papers = []
for src in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
    text = open(src, encoding="utf-8", errors="replace").read()
    name = os.path.basename(src)[:-4]
    hit = 0
    for pic in PIC.findall(text):
        moved = []
        for m in NODE.finditer(pic):
            opts = m.group(1)
            for s in SIDE.finditer(opts):
                if OF.search(opts[s.start():s.start() + 60]):
                    continue
                moved.append(s.group(1).lower())
        if not moved:
            continue
        canvas = cetz.build(pic)
        if canvas is None:
            continue
        canvases += 1
        hit += len(moved)
        words.update(moved)
    if hit:
        papers.append((hit, name))
print("canvases with a dimensioned side key: %d" % canvases)
print("keys:", dict(words))
print("papers: %d, nodes: %d" % (len(papers), sum(h for h, _ in papers)))
papers.sort(reverse=True)
for n, name in papers[:12]:
    print("  %3d  %s" % (n, name[:58]))
with open(os.path.join(ROOT, "_work", "side_needed.txt"), "w", encoding="utf-8") as fh:
    fh.write("\n".join(n for _h, n in papers))
print("wrote _work/side_needed.txt")
