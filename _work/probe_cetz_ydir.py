"""Oracle: does a larger CeTz canvas y land higher or lower on the page?"""
import io
import pathlib
import subprocess
import sys

import fitz

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
work = ROOT / "_work" / "cd_repro"
work.mkdir(exist_ok=True)
src = work / "ydir.typ"
src.write_text(
    '#import "@preview/cetz:0.5.0"\n'
    "#set page(width: 200pt, height: 200pt, margin: 10pt)\n"
    "#cetz.canvas({\n  import cetz.draw: *\n"
    "  content((0, 0), [LOWER-Y])\n"
    "  content((0, 2), [HIGHER-Y])\n"
    "  line((4, 0), (4, 2))\n"
    "})\n",
    encoding="utf-8",
)
r = subprocess.run(["typst", "compile", str(src), str(work / "ydir.pdf")], capture_output=True)
print("rc", r.returncode, (r.stderr or b"").decode("utf-8", "replace")[:300])
doc = fitz.open(str(work / "ydir.pdf"))
for w in doc[0].get_text("words"):
    print("  %-10s page-y %6.1f  (smaller page-y = higher on the page)" % (w[4], w[1]))
doc.close()
