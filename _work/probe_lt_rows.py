"""Detail check on the Complex-Matrix barrier table: rows all present, header repeats, caption last."""
import io
import pathlib
import re
import sys

import fitz

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
NAME = "Complex-Matrix-Multiplication-Below-2.258-and-Rectangular-Bounds-September-24-2026"
tex = (ROOT / "_work" / "flat" / (NAME + ".tex")).read_text(encoding="utf-8", errors="replace")
i = tex.find(r"\begin{longtable}")
j = tex.find(r"\end{longtable}", i)
src = tex[i:j]
# every data row is `N & M & $\value$ \\`
vals = re.findall(r"&\s*\$(-?[0-9.]+)\\times", src)
print("source data rows:", len(vals))

doc = fitz.open(str(ROOT / "typst" / NAME / "main.pdf"))
alltext = ""
pages_with_rows = {}
for n, page in enumerate(doc):
    t = page.get_text().replace("\n", " ")
    hits = [v for v in vals if v[:12] in t.replace("−", "-")]
    if hits:
        pages_with_rows[n + 1] = len(hits)
    alltext += t
found = [v for v in vals if v[:12] in alltext.replace("−", "-")]
print("rows rendered:", len(found), "of", len(vals))
print("pages carrying rows:", pages_with_rows)
missing = [v for v in vals if v[:12] not in alltext.replace("−", "-")]
print("missing:", missing[:5])

for n in sorted(pages_with_rows):
    t = doc[n - 1].get_text().replace("\n", " ")
    print("  p%d header present: %s | caption present: %s" % (
        n, bool(re.search(r"𝑖\s*𝑗\s*𝑎", t)), "Exact coefficients" in t))
doc.close()
