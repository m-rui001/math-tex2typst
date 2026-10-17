r"""Does a Typst `box(...)` wrapped around cetz `content(...)` draw the node frame TikZ drew?

We have no text metrics, so a node whose size the author never wrote down loses its frame today
(`content((0,-2.1), [Polynomially bounded auxiliary primes])` in
Deterministic-Polynomial's figure). Typst's own `box` measures its content, so the frame can come
back without inventing a width. This compiles the two candidate forms and checks, with pymupdf,
that a stroked path encloses each node's glyphs and hugs them to within the inset.
"""
import subprocess
import sys

import fitz

SRC = r'''#import "@preview/cetz:0.5.0"
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(stroke: (thickness: 0.4pt, paint: black), inset: 0.1389cm, [A framed node])])
  content((4, 0), [#box(stroke: (thickness: 0.8pt, paint: rgb("#1f4e79")), inset: 0.1389cm, radius: 4pt, fill: rgb("#fff2cc"), [Tinted and round])])
  // guides crossing exactly at (2,-2): is the boxed node centred on its point or hung from it?
  line((1.2, -2), (2.8, -2), stroke: (thickness: 0.4pt, paint: rgb("#ff0000")))
  line((2, -2.8), (2, -1.2), stroke: (thickness: 0.4pt, paint: rgb("#ff0000")))
  content((2, -2), [#box(stroke: (thickness: 0.4pt, paint: black), inset: 0.1389cm, [Two lines of text])])
})
'''

open("_work/probe_node_box.typ", "w", encoding="utf-8").write(SRC)
r = subprocess.run(["typst", "compile", "--format", "pdf",
                    "_work/probe_node_box.typ", "_work/probe_node_box.pdf"],
                   capture_output=True, text=True, encoding="utf-8", errors="replace")
if r.returncode:
    print("COMPILE FAILED\n" + (r.stderr or r.stdout)[:1200])
    sys.exit(1)
print("compiles: yes")

doc = fitz.open("_work/probe_node_box.pdf")
page = doc[0]
draws = []
for d in page.get_drawings():
    if d["rect"].width < 4 or d["rect"].height < 4:
        continue
    draws.append((d["rect"], d["type"], d.get("stroke_width"), d.get("color")))
print("stroked/filled paths (4+ pt): %d" % len(draws))
for rect, kind, w, col in draws:
    print("  %-4s %.4g x %.4g  w=%s col=%s" % (kind, rect.width, rect.height, w, col))

words = [b for b in page.get_text("blocks") if b[4].strip()]
print("text blocks: %d" % len(words))
ok = 0
for b in words:
    bbox = fitz.Rect(b[:4])
    txt = " ".join(b[4].split())[:34]
    wraps = [d for d, kind, _w, _c in draws
             if d.x0 <= bbox.x0 + 1 and d.x1 >= bbox.x1 - 1
             and d.y0 <= bbox.y0 + 1 and d.y1 >= bbox.y1 - 1]
    if not wraps:
        print("  NO FRAME: %-34s bbox=%.4g x %.4g" % (txt, bbox.width, bbox.height))
        continue
    pad = min((max(w.x0 - bbox.x0, bbox.x1 - w.x1, w.y0 - bbox.y0, bbox.y1 - w.y1)
               for w in wraps))
    print("  framed:  %-34s pad=%.4gpt" % (txt, pad))
    ok += pad <= 8
print("VERDICT: %d/%d nodes get a hugging frame" % (ok, len(words)))

# is the boxed node centred on the point it was placed at? compare with guides crossing there
red = [d["rect"] for d in page.get_drawings()
       if d.get("color") and max(d["color"]) > 0.9 and min(d["color"]) < 0.3]
hor = next((r for r in red if r.height < 2), None)
ver = next((r for r in red if r.width < 2), None)
box = next((r for r, kind, _w, c in draws
            if kind == "s" and c and max(c) < 0.3 and r.height > 20), None)
if hor and ver and box:
    cx, cy = (hor.x0 + hor.x1) / 2, (ver.y0 + ver.y1) / 2
    print("guides cross at (%.4g, %.4g); box centre (%.4g, %.4g); offset %.4g x %.4g pt"
          % (cx, cy, (box.x0 + box.x1) / 2, (box.y0 + box.y1) / 2,
             (box.x0 + box.x1) / 2 - cx, (box.y0 + box.y1) / 2 - cy))
else:
    print("centering check: guides %s/%s box %s" % (hor, ver, box))
