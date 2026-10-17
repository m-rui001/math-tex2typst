r"""How to rotate a node label inside a CeTz canvas, and does a #box centre on its point?

`_work/probe_rotate_literal.py` proved the shipped spelling puts the words
`rotate(-90deg)[VerticalLabel]` on the page, and that `#rotate(-90deg, [...])` fails because the
canvas runs `import cetz.draw: *`, which shadows Typst's rotate with CeTz's coordinate rotate. This
tries the ways back out, and measures whether `content((x, y), [#box(...)])` centres the frame on
the point or hangs it from it.
"""
import subprocess
import sys

import pymupdf

ALIAS = r'''#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#cetz.canvas({
  import cetz.draw: *
  %s
})
'''
EXPLICIT = r'''#import "@preview/cetz:0.5.0"
#cetz.canvas({
  import cetz.draw: content, line
  %s
})
'''
CASES = [
    ("alias before import", ALIAS, r'content((0, 0), [#page_rotate(-90deg)[VerticalLabel]])'),
    ("alias named angle", ALIAS, r'content((0, 0), [#page_rotate(angle: -90deg)[VerticalLabel]])'),
    ("explicit import", EXPLICIT, r'content((0, 0), [#rotate(-90deg)[VerticalLabel]])'),
]

for name, head, body in CASES:
    open("_work/probe_rot.typ", "w", encoding="utf-8").write(head % body)
    r = subprocess.run(["typst", "compile", "--format", "pdf", "_work/probe_rot.typ",
                        "_work/probe_rot.pdf"],
                       capture_output=True, text=True, encoding="utf-8", errors="replace")
    if r.returncode:
        print("%-20s COMPILE FAILED %s" % (name, (r.stderr or "")[:130].replace("\n", " ")))
        continue
    doc = pymupdf.open("_work/probe_rot.pdf")
    page = doc[0]
    text = page.get_text().replace("\n", " ").strip()
    b = page.get_text("blocks")
    box = b[0][:4] if b else (0, 0, 0, 0)
    # glyphs of one 12-letter label: wide and short unturned, tall and narrow turned
    print("%-20s ok  bbox %.4g x %.4g  literal=%s  text=%r"
          % (name, box[2] - box[0], box[3] - box[1], "rotate(" in text, text[:34]))

# --- centring: guides cross exactly at (2, -2); is the box centred there?
SRC = r'''#import "@preview/cetz:0.5.0"
#cetz.canvas({
  import cetz.draw: *
  line((1.2, -2), (2.8, -2), stroke: (thickness: 0.4pt, paint: rgb("#ff0000")))
  line((2, -2.8), (2, -1.2), stroke: (thickness: 0.4pt, paint: rgb("#ff0000")))
  content((2, -2), [#box(stroke: (thickness: 0.4pt, paint: black), inset: 0.1389cm, [Label text here])])
})
'''
open("_work/probe_rot.typ", "w", encoding="utf-8").write(SRC)
r = subprocess.run(["typst", "compile", "--format", "pdf", "_work/probe_rot.typ",
                    "_work/probe_rot.pdf"],
                   capture_output=True, text=True, encoding="utf-8", errors="replace")
if r.returncode:
    print("centring check COMPILE FAILED " + (r.stderr or "")[:200])
    sys.exit(1)
page = pymupdf.open("_work/probe_rot.pdf")[0]
red = [d["rect"] for d in page.get_drawings() if d.get("color") and max(d["color"]) > 0.9]
hor = next((x for x in red if x.height < 2), None)
ver = next((x for x in red if x.width < 2), None)
blk = next((d["rect"] for d in page.get_drawings()
            if d.get("color") and max(d["color"]) < 0.3 and d["rect"].width > 30), None)
if hor and ver and blk:
    cx, cy = (hor.x0 + hor.x1) / 2, (ver.y0 + ver.y1) / 2
    print("centring: guides cross (%.4g, %.4g) ; box centre (%.4g, %.4g) ; offset %.4g x %.4g pt"
          % (cx, cy, (blk.x0 + blk.x1) / 2, (blk.y0 + blk.y1) / 2,
             (blk.x0 + blk.x1) / 2 - cx, (blk.y0 + blk.y1) / 2 - cy))
    print("glyph box %.4g x %.4g  frame %.4g x %.4g (inset 3.94pt each side => hugging)"
          % ((lambda b: (b[2] - b[0], b[3] - b[1]))(page.get_text("blocks")[0][:4]),
             blk.width, blk.height))
else:
    print("centring: guides %s %s frame %s" % (hor, ver, blk))
