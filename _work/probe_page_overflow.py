"""Corpus-wide detector: pages whose text runs below the page content limit.

A non-breakable #figure taller than one page overflows the bottom margin instead of
splitting, so this is the observable form of the long-table caption defect.
"""
import io
import pathlib
import re
import sys

import fitz

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
TOL = 3.0

papers = []
for main in sorted((ROOT / "typst").glob("*/main.typ")):
    pdf = main.parent / "main.pdf"
    if not pdf.exists():
        continue
    txt = main.read_text(encoding="utf-8", errors="replace")
    m = re.search(r"#set page\(paper: \"us-letter\", margin: \(([^)]*)\)", txt)
    if not m:
        continue
    spec = {}
    for part in m.group(1).split(","):
        if ":" in part:
            k, v = part.split(":", 1)
            spec[k.strip()] = v.strip()
    UNIT = {"pt": 1.0, "in": 72.27, "cm": 28.346, "mm": 2.8346}

    def pts(v):
        num, unit = re.match(r"([0-9.]+)\s*(pt|in|cm|mm)", v).groups()
        return float(num) * UNIT[unit]

    bottom = pts(spec.get("y", spec.get("bottom", "79.4pt")))
    doc = fitz.open(str(pdf))
    worst = []
    for n, page in enumerate(doc):
        limit = page.rect.height - bottom
        low = 0.0
        for b in page.get_text("blocks"):
            if re.fullmatch(r"\s*\d+\s*", b[4]):
                continue
            low = max(low, b[3])
        if low > limit + TOL:
            worst.append((n + 1, round(low - limit, 1)))
    doc.close()
    if worst:
        papers.append((main.parent.name, bottom, worst))

print("papers with below-limit text: %d" % len(papers))
papers.sort(key=lambda t: -max(w for _, w in t[2]))
for name, bottom, worst in papers[:30]:
    print("  %-64s bottom=%.1f  worst=%.1f  pages %s" % (name[:64], bottom, max(w for _, w in worst), worst[:8]))
print("... overflow > 8pt:", sum(1 for _, _, w in papers if max(x for _, x in w) > 8))
print("... overflow > 15pt:", sum(1 for _, _, w in papers if max(x for _, x in w) > 15))
