"""Name every dangling reference and say whether its \\label exists in the source at all.

convert_paper is run in-process with Stats.note patched to keep every sample, which the shipped
report does not do (one sample per kind). Run it only when no batch is in flight: it writes into
typst/<paper>/ the same way the batch does.

Usage: python _work/probe_dangling_names.py [limit]
"""
import json
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import emit
from t2t.convert import convert_paper

names = []
for rep in sorted((ROOT / "typst").glob("*/report.json")):
    d = json.loads(rep.read_text(encoding="utf-8"))
    n = (d.get("stats") or {}).get("dangling_ref", 0)
    if n:
        names.append((n, rep.parent.name))
names.sort(reverse=True)
limit = int(sys.argv[1]) if len(sys.argv) > 1 else 99
print("papers with dangling refs: %d ; occurrences: %d" % (len(names), sum(n for n, _ in names)))

kept = []
orig = emit.Stats.note


def note(self, kind, sample=""):
    if kind == "dangling_ref":
        kept.append(str(sample))
    return orig(self, kind, sample)


emit.Stats.note = note
for n, name in names[:limit]:
    flat = ROOT / "_work/flat" / (name + ".tex")
    src = flat.read_text(encoding="utf-8", errors="replace") if flat.exists() else ""
    kept.clear()
    out = ROOT / "typst" / name
    out.mkdir(parents=True, exist_ok=True)
    convert_paper(str(flat), str(out), name)
    has_label = sum(1 for k in kept if ("\\label{%s}" % k) in src)
    print("%-46s n=%-3d named=%-3d label_in_source=%d  %s"
          % (name[:46], n, len(kept), has_label, " ".join(sorted(set(kept))[:6])[:120]))
