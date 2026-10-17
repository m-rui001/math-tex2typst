"""Split every cross-reference in the corpus by whether its \\label exists in the same source.

Dangling refs come in two kinds. A name no \\label defines was already broken in LaTeX, which
prints `??` for it too; nothing the converter can emit makes it resolve. A name a \\label does
define is ours to register, and each of those still outstanding is a real bug. This counts the
two kinds straight off _work/flat, so a run's dangling total has an owner.

Usage: python _work/probe_ref_owners.py
"""
import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[1]
REF = re.compile(r"\\(?:auto|page|name|v|C|eq|)ref\*?\s*\{([^{}]*)\}")
LABEL = re.compile(r"\\label\s*\{([^{}]*)\}")

absent = present = 0
papers = {}
for path in sorted((ROOT / "_work/flat").glob("*.tex")):
    src = path.read_text(encoding="utf-8", errors="replace")
    defined = set(LABEL.findall(src))
    if not defined:
        continue
    for name in REF.findall(src):
        for part in re.split(r"[,;]", name):
            part = part.strip()
            if not part:
                continue
            papers.setdefault(path.stem, [0, 0])
            if part in defined:
                present += 1
                papers[path.stem][0] += 1
            else:
                absent += 1
                papers[path.stem][1] += 1

print("references resolved in source: %d ; named but never labelled: %d" % (present, absent))
worst = sorted(papers.items(), key=lambda kv: -kv[1][1])[:12]
for name, (got, missing) in worst:
    if missing:
        print("  %-56s absent=%-3d present=%d" % (name[:56], missing, got))
