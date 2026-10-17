"""#103e: how many boxes still print their padding as `0.3333em`, at what node size, in the products.

#103 priced an anchored node's DEFAULT `inner sep` at the class size pdflatex prices it at
(3.333pt, `_work/label103b_unrotated_pad.txt`), because pgf reads `.3333em` of the size the package
was loaded at, not of the node's own `font=` (`_work/measure_node_sep_whose_font.py` -- every label
from \\tiny to 20pt keeps 3.3330pt on each side).  The other channel that carries the same slack is
`node_inset`, which prints the literal `inset: 0.3333em` on a Typst `box` and lets THAT be spent at
the node's current text size: at a 9pt label it buys 3.0pt, so the box is 0.33pt short per side.

This census only counts the face and its tiers -- a box's `inset:` cannot be told from a `padding:` by
the text alone, so the size is read from the `#text(size: Npt)` wrapper the emitter puts on the body
when the node names a size, and the rest are body-size labels.

  python _work/probe103e_inset_face.py
"""
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PROD = os.path.join(ROOT, "typst")
OUT = os.path.join(ROOT, "_work", "label103e_inset_face.txt")
# every `inset:` that still prints the literal em default: node_inset's own spelling, always inside
# a `#box(` on the same emitted line
INSET = "inset: 0.3333em"
BOX = "#box("
SIZE = re.compile(r"#text\(size: ([\d.]+)pt\)")
ANCHOR = re.compile(r'anchor: "([a-z-]+)"')


def main():
    sites = 0
    canvases = 0
    papers = 0
    tiers = {}
    anchors = {}
    rows = []
    for stem in sorted(os.listdir(PROD)):
        path = os.path.join(PROD, stem, "main.typ")
        if not os.path.isfile(path):
            continue
        text = io.open(path, encoding="utf-8").read()
        canvas_hit = False
        found_here = 0
        canvas_no = -1
        for line in text.splitlines():
            if "#cetz.canvas(" in line:
                canvas_no += 1
                canvases += 1 if canvas_hit else 0
                canvas_hit = False
            if INSET not in line or BOX not in line:
                continue
            n = line.count(INSET)
            found_here += n
            canvas_hit = True
            size = SIZE.search(line)
            tier = "%spt" % size.group(1) if size else "body"
            anchor = ANCHOR.search(line)
            key = anchor.group(1) if anchor else "no-anchor"
            tiers[tier] = tiers.get(tier, 0) + n
            anchors[key] = anchors.get(key, 0) + n
            rows.append("%s#%d  %-8s %-12s %s  x%d" % (stem[:50], canvas_no, tier, key,
                                                       line.strip()[:100], n))
        canvases += 1 if canvas_hit else 0
        sites += found_here
        papers += 1 if found_here else 0
    text = ("#box(... inset: 0.3333em) sites: %d over %d canvases / %d papers\n"
            "by text size of the body: %s\n"
            "by the anchor the canvas pins it with: %s\n\n"
            "first 40:\n%s"
            % (sites, canvases, papers,
               sorted(tiers.items(), key=lambda kv: -kv[1]),
               sorted(anchors.items(), key=lambda kv: -kv[1]),
               "\n".join(rows[:40])))
    io.open(OUT, "w", encoding="utf-8").write(text + "\n")
    print(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
