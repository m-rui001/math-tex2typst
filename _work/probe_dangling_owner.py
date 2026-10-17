"""For each paper whose report says a reference dangles, ask whether the source defines it.

The report keeps one name per paper, which is enough to split the residue into what the paper
itself never labelled, and what our emitter lost. Read-only: it touches typst/*/report.json and
_work/flat, so it can run beside a batch.
"""
import json
import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[1]
LABEL = re.compile(r"\\label\s*\{([^{}]*)\}")

ours = theirs = unnamed = 0
for rep in sorted((ROOT / "typst").glob("*/report.json")):
    d = json.loads(rep.read_text(encoding="utf-8", errors="replace"))
    stats = d.get("stats") or {}
    if not stats.get("dangling_ref"):
        continue
    name = (stats.get("dangling_ref") or "") if isinstance(stats.get("dangling_ref"), str) else ""
    sample = (d.get("samples") or {}).get("dangling_ref", "")
    flat = ROOT / "_work/flat" / (rep.parent.name + ".tex")
    if not flat.exists():
        unnamed += 1
        continue
    defined = set(LABEL.findall(flat.read_text(encoding="utf-8", errors="replace")))
    hit = sample in defined
    ours += hit
    theirs += not hit
    print("%-56s n=%-3d %-28s label_in_source=%s"
          % (rep.parent.name[:56], stats["dangling_ref"], sample[:28], hit))

print("defined in source (ours to register): %d ; never labelled (the paper's own gap): %d ; no flat: %d"
      % (ours, theirs, unnamed))
