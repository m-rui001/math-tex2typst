"""What is on each badly-overflowing page? Print the page text head and the figure kinds present."""
import io
import pathlib
import re
import sys

import fitz

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]

CASES = [
    ("The-hypercube-Ramsey-number-has-linear-order-September-23-2026", 172),
    ("Signed-tensor-densities-and-diagram-budgets-for-coordinate-sweep", 22),
    ("Abundance-in-numerical-dimension-one-for-terminal-threefolds-in-", 4),
    ("Finite-angular-cylinder-covers-below-the-half-area-bound-Septemb", 6),
    ("Complex-Matrix-Multiplication-Below-2.258-and-Rectangular-Bounds", 85),
    ("A-sharp-Fourier-certificate-for-planar-circle-packing-September-", 27),
    ("Catalans-constant-is-irrational-September-24-2026", 44),
]

dirs = {d.name: d for d in (ROOT / "typst").iterdir() if d.is_dir()}
for prefix, pageno in CASES:
    match = [n for n in dirs if n.startswith(prefix)]
    if not match:
        print("!! no dir for", prefix)
        continue
    name = match[0]
    pdf = dirs[name] / "main.pdf"
    doc = fitz.open(str(pdf))
    page = doc[pageno - 1]
    txt = page.get_text()
    lines = [l for l in txt.splitlines() if l.strip()]
    print("=" * 20, name[:58], "p%d" % pageno, "=" * 20)
    print("  first:", lines[0][:90] if lines else "")
    print("  last3:", " / ".join(l[:60] for l in lines[-3:]))
    doc.close()
