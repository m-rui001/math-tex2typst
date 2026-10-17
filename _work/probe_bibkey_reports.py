"""Which papers report missing_bibkey, and does each have a refs.bib next to main.typ?

Run: python _work/probe_bibkey_reports.py
"""
import json
import pathlib

ROOT = pathlib.Path(__file__).resolve().parents[1]
rows = []
for rep in sorted((ROOT / "typst").glob("*/report.json")):
    data = json.loads(rep.read_text(encoding="utf-8", errors="replace"))
    n = (data.get("stats") or {}).get("missing_bibkey", 0)
    if n:
        has_bib = (rep.parent / "refs.bib").exists()
        rows.append((n, rep.parent.name, has_bib))
rows.sort(reverse=True)
print("papers with missing_bibkey: %d ; notes: %d" % (len(rows), sum(r[0] for r in rows)))
for n, name, has_bib in rows[:15]:
    print("  %4d  bib=%-5s  %s" % (n, has_bib, name[:60]))
