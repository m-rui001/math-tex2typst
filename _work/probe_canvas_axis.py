"""Is CeTz's canvas y-up or y-down? Place two labels and read where they land on the page."""
import pathlib
import subprocess
import sys

import fitz

HERE = pathlib.Path(__file__).resolve().parent
SRC = HERE / "axis_probe.typ"
SRC.write_text('''#import "@preview/cetz:0.5.2"
#cetz.canvas({
  import cetz.draw: *
  content((0, 1), [UPPER])
  content((0, -1), [LOWER])
  line((0, 0), (2, 0), name: "axis")
})
''', encoding="utf-8")
pdf = HERE / "axis_probe.pdf"
subprocess.run(["typst", "compile", str(SRC), str(pdf)], check=True, capture_output=True)
doc = fitz.open(str(pdf))
for block in doc[0].get_text("blocks"):
    print("y=%7.1f  %s" % (block[1], block[4].strip()[:30]))
