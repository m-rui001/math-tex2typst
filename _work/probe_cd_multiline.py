r"""Decide the multi-line cell spelling.

  1. What does pandoc answer for a whole `gathered` cell?  (If it converts, the cell only
     needs its `\\` protected from the row splitter.)
  2. Does a Typst linebreak inside a canvas `content(...)` compile, and where does CeTz
     anchor a two-line block?
"""
import io
import pathlib
import subprocess
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import mathconv  # noqa: E402

CELLS = [
    r"\begin{gathered}\text{Slope bounds and finite jets}\\ \text{Laurent cocycles have primitives}\end{gathered}",
    r"\begin{gathered}\Pic(|D|,\cR)\\\text{is }p\text{-divisible}\end{gathered}",
    r"\text{Slope bounds}\\ \text{primitives}",
]
got, missing, err = mathconv.convert_formulas(CELLS)
print("---- convert_formulas ----")
print("converted:", sorted(got), "missing:", missing, "err:", (err or "")[:120])
for i, body in sorted(got.items()):
    print("  [%d] %r" % (i, body[:160]))

TYP = r"""#import "@preview/cetz:0.5.0"
#set page(width: 200pt, height: 160pt, margin: 10pt)
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$a$ #linebreak $b$])
  content((2, 0), [#text(size: 8pt)[one] #linebreak two])
})
"""
work = ROOT / "_work" / "cd_repro"
work.mkdir(exist_ok=True)
p = work / "break.typ"
p.write_text(TYP, encoding="utf-8")
r = subprocess.run(["typst", "compile", str(p), str(work / "break.pdf")], capture_output=True)
print("---- linebreak in canvas content: rc", r.returncode, "----")
if r.returncode:
    print((r.stderr or b"").decode("utf-8", "replace")[:900])
else:
    import fitz
    d = fitz.open(str(work / "break.pdf"))
    for b in d[0].get_text("blocks"):
        print("   block y %7.1f-%7.1f  %r" % (b[1], b[3], b[4].strip()[:30]))
    for w in d[0].get_text("words"):
        print("   word %r x %6.1f y %6.1f" % (w[4], w[0], w[1]))
    d.close()
