r"""Does Typst wrap content given an explicit `box(width:)`, and where does the inset go?

A node declared `text width=4.5cm` gets its frame from the unsized path, so the text runs past the
border (`_work/shot_A-Counterexample-to-Kuro_p4.png`: "Eleven-block correction: q(w(Z)) =" escapes).
The candidate fix is to hand Typst the width the author wrote. This measures three things: whether
the content wraps (frame taller than one line), whether `width:` is the content width or the frame
width (inset of 0.3333em on each side decides), and whether the box still centres on its point.
"""
import subprocess
import sys

import pymupdf

LONG = ("Eleven-block correction of the cyclic compatibility of word errors and the free "
        "correction that follows it in the same section")

SRC = r'''#import "@preview/cetz:0.5.0"
#cetz.canvas({
  import cetz.draw: *
  line((-3.4, -1.6), (3.4, -1.6), stroke: (thickness: 0.4pt, paint: rgb("#ff0000")))
  content((0, 0), [#box(width: 4.5cm, inset: 0.3333em, stroke: (thickness: 0.4pt, paint: black), [%s])])
  content((0, -3.2), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt, paint: black), [%s -- unwrapped])])
})
''' % (LONG, LONG)

open("_work/probe_wrap.typ", "w", encoding="utf-8").write(SRC)
r = subprocess.run(["typst", "compile", "--format", "pdf", "_work/probe_wrap.typ",
                    "_work/probe_wrap.pdf"],
                   capture_output=True, text=True, encoding="utf-8", errors="replace")
if r.returncode:
    print("COMPILE FAILED: " + (r.stderr or "")[:400].replace("\n", " "))
    sys.exit(1)
print("compiles: yes")

page = pymupdf.open("_work/probe_wrap.pdf")[0]
frames = [d["rect"] for d in page.get_drawings()
          if d.get("color") and max(d["color"]) < 0.3 and d["rect"].width > 30]
red = [d["rect"] for d in page.get_drawings()
       if d.get("color") and max(d["color"]) > 0.9]
print("frames found: %d" % len(frames))
for i, f in enumerate(frames):
    print("  frame %d: %.4g x %.4g pt  (4.5cm = 127.6pt; inset 0.3333em each side)"
          % (i, f.width, f.height))
if red:
    print("guide spans %.4g -> %.4g" % (red[0].x0, red[0].x1))
if len(frames) == 2:
    w, h = frames[0].width, frames[0].height
    print("VERDICT wrap: %s (taller than the unwrapped %.4gpt by %.4gpt)"
          % ("yes" if h > frames[1].height * 1.5 else "no", frames[1].height, h))
    print("VERDICT width meaning: frame=%.4g vs declared 127.56 -> %s"
          % (w, "content+inset" if w > 128 else "content only"))
