"""Which spellings let a long table break across pages and keep its caption with the last rows?

Variants
  bare        table(...) with no figure wrapper
  figure      #figure(table(...), caption: ...)          <- what emit.py does today
  figure-brk  #figure(table(...), caption: ..., breakable: true)
  fig-block   #figure(block(breakable: true, table(...)), caption: ...)
"""
import io
import pathlib
import re
import subprocess
import sys

import fitz

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
WORK = ROOT / "_work" / "lt_repro"
WORK.mkdir(exist_ok=True)

N = 60
rows = "".join(
    "  table.cell[row%03d], table.cell[%d], table.cell[$%d times 10^%d$],\n" % (i, i, i, -i) for i in range(N)
)
TABLE = "table(\n  columns: 3,\n  inset: 4pt,\n  table.header([i], [j], [a]),\n" + rows + ")"
HEAD = "#set page(width: 300pt, height: 400pt, margin: 20pt)\nLead-in text.\n\n"
TAIL = "\n\nTrailing paragraph.\n"

VARIANTS = {
    "bare": HEAD + TABLE + TAIL,
    "figure": HEAD + "#figure(\n  " + TABLE + ",\n  caption: [Table 6: Exact coefficients.],\n)" + TAIL,
    "figure-brk": HEAD
    + "#figure(\n  "
    + TABLE
    + ",\n  caption: [Table 6: Exact coefficients.],\n  breakable: true,\n)"
    + TAIL,
    "fig-block": HEAD
    + "#figure(\n  block(breakable: true, "
    + TABLE
    + "),\n  caption: [Table 6: Exact coefficients.],\n)"
    + TAIL,
}

for name, src in VARIANTS.items():
    p = WORK / ("v_%s.typ" % name)
    p.write_text(src, encoding="utf-8")
    out = WORK / ("v_%s.pdf" % name)
    r = subprocess.run(["typst", "compile", str(p), str(out)], capture_output=True)
    err = (r.stderr or b"").decode("utf-8", "replace")
    if r.returncode != 0:
        print("== %-11s COMPILE FAILED: %s" % (name, err.strip().splitlines()[:3]))
        continue
    doc = fitz.open(str(out))
    limit = 400.0 - 20.0
    worst = 0.0
    cap = None
    seen = {}
    for n, page in enumerate(doc):
        for b in page.get_text("blocks"):
            worst = max(worst, b[3])
            if "Exact coefficients" in b[4]:
                cap = (n, round(b[1], 1), round(b[3], 1))
        txt = page.get_text().replace("\n", " ")
        for tok in re.findall(r"row(\d{3})", txt):
            seen.setdefault(int(tok), n)
    missing = [i for i in range(N) if i not in seen]
    spans = sorted({(v, k) for k, v in seen.items()})
    per_page = {}
    for i, n in sorted(seen.items()):
        per_page.setdefault(n, []).append(i)
    summary = " ".join("p%d:%d-%d(%d)" % (n, min(v), max(v), len(v)) for n, v in sorted(per_page.items()))
    print(
        "== %-11s pages %d  lowest-y %.1f (limit %.1f)  caption %s  rows %s  missing %s"
        % (name, doc.page_count, worst, limit, cap, summary, missing[:8])
    )
    doc.close()
