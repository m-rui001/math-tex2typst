r"""Does Typst's `box` draw a border when none is asked for?

Renders one page of four boxes and reads the drawing operators back: a `box` with no `stroke:`
against the same `box` with `stroke: none`.
"""
import pathlib
import subprocess
import sys
import tempfile

import pymupdf

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

ROOT = pathlib.Path(__file__).resolve().parents[1]
DOC = r"""#set page(width: 300pt, height: 200pt, margin: 20pt)
#box(width: 100pt, inset: 2pt)[plain box no stroke]
#v(20pt)
#box(width: 100pt, inset: 2pt, stroke: none)[box stroke none]
"""

with tempfile.TemporaryDirectory() as tmp:
    src = pathlib.Path(tmp, "t.typ")
    src.write_text(DOC, encoding="utf-8")
    pdf = pathlib.Path(tmp, "t.pdf")
    r = subprocess.run(["typst", "compile", str(src), str(pdf)], capture_output=True)
    if r.returncode:
        print("compile failed", r.stderr.decode("utf-8", "replace")[:600])
        sys.exit(1)
    doc = pymupdf.open(str(pdf))
    try:
        for path in doc[0].get_drawings():
            print("rect %s type=%s stroke=%s fill=%s width=%s"
                  % (path["rect"], path["type"], path.get("color"), path.get("fill"),
                     path.get("width")))
    finally:
        doc.close()
print("ROOT", ROOT.name)
