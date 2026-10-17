r"""Where a fixed-height Typst `box` puts its words, and what a `radius:` costs.

#61 is the 54 statements that write `rounded corners` on a node whose size the author declared.
Those nodes are drawn by CeTz as `content(range, body, frame: "rect")`, and that frame is a
hardcoded line-strip with nowhere for a radius (`src/draw/shapes.typ:1248`), so the one spelling
that HAS a radius is Typst's own `#box(width:, height:, radius:)`.  Taking it has to answer two
questions the range path currently gets right, and both are page facts, not opinions:

  1. is a declared `height:` a MINIMUM (pgf grows a node around a tall label) or a fixed size?
     Measured below: FIXED -- a 1cm box keeps its border while the words run out through it.
  2. TeX centres a node's words mid-height (#42, `_box_body`'s `horizon`).  Inside a box of
     declared height, which call buys the same thing?

Printed per case: every stroked shape on the page (its bbox and how many bezier segments it has --
a rounded box comes out as curves, not as an `re` item) and every text LINE's band, in cm.
"""
import os
import subprocess
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SCRATCH = os.path.join(ROOT, "_work", "_sized")

PAGE = "#set page(width: 12cm, height: 6cm, margin: 1cm)\n#set text(size: 11pt)\n"

BOX = "#box(width: 3cm, height: 2cm, inset: 0pt, stroke: 1pt + black)"

CASES = [
    ("declared 3x2, bare body", BOX + "[A]", "A"),
    ("declared 3x2, #align(horizon)", BOX + "[#align(horizon)[A]]", "A"),
    ("declared 3x2, #align(center)", BOX + "[#align(center)[A]]", "A"),
    ("declared 3x2, #align(left + horizon)", BOX + "[#align(left + horizon)[A]]", "A"),
    ("declared 3x2 + radius 8pt", BOX.replace("black)", "black, radius: 8pt)") + "[A]", "A"),
    ("declared 3x2, body taller than 2cm", BOX + "[A#parbreak()B#parbreak()C]", "ABC"),
    ("declared 3x2, body much taller", BOX + "[#repeat(6, \"x\" + linebreak())]"),
]


def render(src):
    os.makedirs(SCRATCH, exist_ok=True)
    typ = os.path.join(SCRATCH, "c.typ")
    pdf = os.path.join(SCRATCH, "c.pdf")
    with open(typ, "w", encoding="utf-8") as f:
        f.write(src)
    # typst leaves its previous output in place when a compile fails, and reading that back makes a
    # broken case look like its predecessor.
    if os.path.exists(pdf):
        os.remove(pdf)
    got = subprocess.run(["typst", "compile", typ, pdf], capture_output=True)
    if not os.path.exists(pdf):
        return None, got.stderr.decode("utf-8", "replace")
    doc = fitz.open(pdf)
    page = doc[0]
    shapes = []
    for d in page.get_drawings():
        curves = sum(1 for item in d["items"] if item[0] == "c")
        shapes.append((d["rect"], curves, len(d["items"])))
    lines = []
    for block in page.get_text("dict")["blocks"]:
        for line in block.get("lines", []):
            lines.append((line["bbox"][1], line["bbox"][3]))
    doc.close()
    return (shapes, lines), None


CM = 28.346


def main():
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    for case in CASES:
        label, src = case[0], PAGE + case[1] + "\n"
        got, err = render(src)
        if got is None:
            print("== %-34s COMPILE FAILED: %s" % (label, err.strip()[:160]))
            continue
        shapes, lines = got
        print("== %s" % label)
        for rect, curves, items in shapes:
            print("     shape %.4f x %.4f cm at y %.4f..%.4f  beziers %d/%d items"
                  % (rect.width / CM, rect.height / CM, rect.y0 / CM, rect.y1 / CM,
                     curves, items))
        if lines:
            top = min(t for t, _ in lines) / CM
            bot = max(b for _, b in lines) / CM
            print("     ink %.4f..%.4f cm, mid %.4f" % (top, bot, (top + bot) / 2))


if __name__ == "__main__":
    main()
