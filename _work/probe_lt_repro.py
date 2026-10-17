"""Minimal repro: does a long table inside #figure overlap its caption in typst 0.15?"""
import io
import pathlib
import subprocess
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
WORK = ROOT / "_work" / "lt_repro"
WORK.mkdir(exist_ok=True)

rows = "".join(
    "  table.cell[%d], table.cell[%d], table.cell[$%d.%d times 10^%d$],\n" % (i, i, i, i, -i)
    for i in range(60)
)
body = (
    "#set page(width: 300pt, height: 400pt, margin: 20pt)\n"
    "Some lead-in text before the table.\n\n"
    "#figure(\n"
    "  table(\n"
    "  columns: 3,\n"
    "  inset: 4pt,\n"
    "  table.header([i], [j], [a]),\n"
    + rows
    + "),\n"
    "  caption: [Table 6: Exact coefficients of the barrier.],\n"
    ")\n"
    "\nTrailing paragraph after the figure.\n"
)
src = WORK / "repro.typ"
src.write_text(body, encoding="utf-8")
r = subprocess.run(
    ["typst", "compile", str(src), str(WORK / "repro.pdf")],
    capture_output=True, text=True,
)
print("rc", r.returncode)
print(r.stdout[-2000:])
print(r.stderr[-2000:])
