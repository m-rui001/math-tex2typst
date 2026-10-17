"""Round 2: can a show-rule make the figure breakable, and does the caption stay with the last rows?"""
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
FIG = "#figure(\n  " + TABLE + ",\n  caption: [Table 6: Exact coefficients.],\n)"
HEAD = "#set page(width: 300pt, height: 400pt, margin: 20pt)\nLead-in text.\n\n"
TAIL = "\n\nTrailing paragraph.\n"

VARIANTS = {
    "show-block": HEAD + "#show figure: set block(breakable: true)\n\n" + FIG + TAIL,
    "show-where": HEAD + "#show figure.where(kind: table): set block(breakable: true)\n\n" + FIG + TAIL,
    "set-block": HEAD + "#set block(breakable: true)\n\n" + FIG + TAIL,
}

for name, src in VARIANTS.items():
    p = WORK / ("w_%s.typ" % name)
    p.write_text(src, encoding="utf-8")
    out = WORK / ("w_%s.pdf" % name)
    r = subprocess.run(["typst", "compile", str(p), str(out)], capture_output=True)
    err = (r.stderr or b"").decode("utf-8", "replace")
    if r.returncode != 0:
        print("== %-11s COMPILE FAILED: %s" % (name, err.strip().splitlines()[:3]))
        continue
    doc = fitz.open(str(out))
    worst = 0.0
    cap = None
    per_page = {}
    for n, page in enumerate(doc):
        for b in page.get_text("blocks"):
            worst = max(worst, b[3])
            if "Exact coefficients" in b[4]:
                cap = (n, round(b[1], 1), round(b[3], 1))
        for tok in re.findall(r"row(\d{3})", page.get_text().replace("\n", " ")):
            per_page.setdefault(n, []).append(int(tok))
    missing = [i for i in range(N) if i not in {x for v in per_page.values() for x in v}]
    summary = " ".join("p%d:%d-%d(%d)" % (n, min(v), max(v), len(v)) for n, v in sorted(per_page.items()))
    print("== %-11s pages %d  lowest-y %.1f (limit 380)  caption %s  rows %s  missing %s"
          % (name, doc.page_count, worst, cap, summary, missing[:8]))
    doc.close()
