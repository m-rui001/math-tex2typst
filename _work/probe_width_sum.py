r"""Can a Typst box width carry the node's own inset: `width: 4.5cm + 0.6666em`?

`probe_wrap.py` measured that `box(width: W)` makes the *frame* W wide and wraps the content inside
it, while TikZ's `text width=W` sets the *text* and frames it at W + 2 * inner sep. So the honest
spelling adds the two insets back. Lengths of different units have to be added in one expression;
this checks the expression compiles and that the frame lands at 127.56 + 2*(0.3333em).
"""
import subprocess
import sys

import pymupdf

LONG = ("Eleven-block correction of the cyclic compatibility of word errors and the free "
        "correction that follows it in the same section")

SRC = r'''#import "@preview/cetz:0.5.0"
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 4.5cm + 0.6666em, inset: 0.3333em, stroke: (thickness: 0.4pt, paint: black), [%s])])
})
''' % LONG

open("_work/probe_width_sum.typ", "w", encoding="utf-8").write(SRC)
r = subprocess.run(["typst", "compile", "--format", "pdf", "_work/probe_width_sum.typ",
                    "_work/probe_width_sum.pdf"],
                   capture_output=True, text=True, encoding="utf-8", errors="replace")
print("compiles: %s" % ("yes" if not r.returncode else "NO"))
if r.returncode:
    print((r.stderr or "")[:500].replace("\n", " "))
    sys.exit(1)

page = pymupdf.open("_work/probe_width_sum.pdf")[0]
for d in page.get_drawings():
    if d.get("color") and max(d["color"]) < 0.3 and d["rect"].width > 30:
        f = d["rect"]
        print("frame: %.4g x %.4g pt   (4.5cm=127.56; +2 insets at 10pt body)" % (f.width, f.height))
        print("VERDICT: %s" % ("frame carries the inset, text area = declared width"
                               if 133 < f.width < 140 else "expression not honoured"))
