r"""Does wrapping the label in a Typst box keep it inside the rectangle CeTz already draws?

The sized node emits `content((x1, y1), (x2, y2), [text], frame: "rect")`: the rect is the author's
geometry while the text is laid out independently, and `_work/shot_A-Counterexample-to-Kuro_p4.png`
shows a label running past the border. Each form is compiled on its own page here -- two canvases on
one page let this measure attribute the wrong words to the wrong frame -- and the number that matters
is the words' right edge past the frame's.
"""
import subprocess
import sys

import pymupdf

LONG = ("Eleven-block correction of the cyclic compatibility of word errors and the free "
        "correction that follows it in the same section")

BODY = {
    "shipped  ": "[{}]".format(LONG),
    "boxed    ": "[#box(width: 5.7524cm, [{}])]".format(LONG),
}
CANVAS = r'''#import "@preview/cetz:0.5.0"
#cetz.canvas({
  import cetz.draw: *
  content((0.2736, -5.4), (6.026, -4.3), [%s], frame: "rect")
})
'''

for name, body in BODY.items():
    open("_work/probe_sized_wrap.typ", "w", encoding="utf-8").write(CANVAS % body)
    r = subprocess.run(["typst", "compile", "--format", "pdf", "_work/probe_sized_wrap.typ",
                        "_work/probe_sized_wrap.pdf"],
                       capture_output=True, text=True, encoding="utf-8", errors="replace")
    if r.returncode:
        print("COMPILE FAILED: " + (r.stderr or "")[:400].replace("\n", " "))
        sys.exit(1)
    page = pymupdf.open("_work/probe_sized_wrap.pdf")[0]
    frames = [d["rect"] for d in page.get_drawings()
              if d.get("color") and max(d["color"]) < 0.3 and d["rect"].width > 100]
    if len(frames) != 1:
        print("%s: %d frames - cannot read" % (name, len(frames)))
        continue
    f = frames[0]
    words = page.get_text("words")
    lo, hi = min(w[0] for w in words), max(w[2] for w in words)
    lines = len({round((w[1] + w[3]) / 2) for w in words})
    print("%s: frame %.4g..%.4g x %.4g..%.4g | words %.4g..%.4g | overflow %.4gpt | lines %d"
          % (name, f.x0, f.x1, f.y0, f.y1, lo, hi,
             max(0.0, hi - f.x1) + max(0.0, f.x0 - lo), lines))
