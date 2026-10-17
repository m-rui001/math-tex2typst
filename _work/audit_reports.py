"""Aggregate the per-paper reports: compile, cetz conversion, residual LaTeX."""
import json
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
reports = sorted((ROOT / "typst").glob("*/report.json"))
ok = conv = pics = 0
stats = {}
for p in reports:
    r = json.loads(p.read_text(encoding="utf-8", errors="replace"))
    ok += bool(r.get("compile_ok"))
    s = r.get("stats") or {}
    conv += s.get("cetz_converted", 0)
    pics += s.get("cetz_pictures", s.get("tikz_pictures", 0))
    for k, v in s.items():
        if isinstance(v, int):
            stats[k] = stats.get(k, 0) + v

print("reports=%d compiled_ok=%d" % (len(reports), ok))
print("cetz: converted=%d pictures=%d" % (conv, pics))
print("stats:", {k: v for k, v in sorted(stats.items()) if v})

MACRO = re.compile(r"\\[A-Za-z@]+\*?")
total = files = 0
kinds = {}
for typ in (ROOT / "typst").glob("*/*.typ"):
    text = typ.read_text(encoding="utf-8", errors="replace")
    hits = MACRO.findall(text)
    if hits:
        files += 1
        total += len(hits)
        for h in hits:
            kinds[h] = kinds.get(h, 0) + 1
print("tex residue: %d occurrences in %d .typ files" % (total, files))
for k, v in sorted(kinds.items(), key=lambda kv: -kv[1])[:15]:
    print("  %6d  %s" % (v, k))
