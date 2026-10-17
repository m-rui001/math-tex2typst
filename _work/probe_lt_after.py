"""After the breakable-table fix: does each long table split, keep its header, and put the caption last?"""
import io
import json
import pathlib
import re
import sys

import fitz

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
names = [l.strip() for l in (ROOT / "_work/regen_needed.txt").read_text(encoding="utf-8").splitlines() if l.strip()]

for name in names:
    d = ROOT / "typst" / name
    doc = fitz.open(str(d / "main.pdf"))
    report = json.loads((d / "report.json").read_text(encoding="utf-8"))
    txt = (d / "main.typ").read_text(encoding="utf-8", errors="replace")
    m = re.search(r"#set page\(paper: \"us-letter\", margin: \(([^)]*)\)", txt)
    spec = {}
    for part in m.group(1).split(","):
        k, v = part.split(":", 1)
        spec[k.strip()] = v.strip()
    num, unit = re.match(r"([0-9.]+)\s*(pt|in|cm|mm)", spec.get("y", spec.get("bottom"))).groups()
    bottom = float(num) * {"pt": 1.0, "in": 72.27, "cm": 28.346, "mm": 2.8346}[unit]

    over = []
    for n, page in enumerate(doc):
        limit = page.rect.height - bottom
        low = max([b[3] for b in page.get_text("blocks") if not re.fullmatch(r"\s*\d+\s*", b[4])] or [0])
        if low > limit + 3.0:
            over.append((n + 1, round(low - limit, 1)))
    caps = []
    for n, page in enumerate(doc):
        for b in page.get_text("blocks"):
            t = b[4].replace("\n", " ")
            if re.search(r"(Table|Figure)\s+\d+:", t):
                caps.append((n + 1, round(b[1], 1), round(b[3], 1), t.strip()[:52]))
    print("== %s" % name[:62])
    print("   pages %d (was %s)  compile %s  overflow %s" % (doc.page_count, report.get("pages"), report.get("compile_ok"), over))
    print("   table captions:")
    for c in caps:
        if "Table" in c[3]:
            print("      p%-4d y %7.1f-%7.1f  %s" % c)
    doc.close()
