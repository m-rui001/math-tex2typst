r"""What do the per-paper reports say is still not converted?

residue.py counts control sequences in main.typ and the quoted raw blocks, but the batch writes a
report.json per paper with its own counters - math_failed, error_kinds, packages_unsupported - and
nobody has read them as a corpus. This totals them, names the papers at the tail, and prints an
example of each failing kind so a next step can be chosen on evidence.
"""
import collections
import io
import json
import os
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TYPST = os.path.join(ROOT, "typst")

math_failed = collections.Counter()
kinds = collections.Counter()
packages = collections.Counter()
examples = collections.defaultdict(list)
compiled = 0
n_reports = 0
for paper in sorted(os.listdir(TYPST)):
    path = os.path.join(TYPST, paper, "report.json")
    if not os.path.isfile(path):
        continue
    n_reports += 1
    d = json.load(open(path, encoding="utf-8"))
    if d.get("compile_ok") or d.get("ok"):
        compiled += 1
    mf = d.get("math_failed")
    if isinstance(mf, int):
        if mf:
            math_failed[paper] = mf
    elif isinstance(mf, list):
        for item in mf:
            text = item if isinstance(item, str) else json.dumps(item, ensure_ascii=False)
            kinds["math_failed"] += 1
            examples["math_failed"].append((paper, text))
            math_failed[paper] += 1
    for k, v in (d.get("error_kinds") or {}).items():
        kinds[k] += v
        examples[k].append((paper, str(v)))
    for p in (d.get("packages_unsupported") or []):
        packages[p if isinstance(p, str) else json.dumps(p, ensure_ascii=False)] += 1

print("reports read: %d ; compiled ok: %d" % (n_reports, compiled))
print("papers with math_failed > 0: %d ; total %d" % (len(math_failed), sum(math_failed.values())))
for paper, n in math_failed.most_common(10):
    print("   %4d  %s" % (n, paper[:52]))
print("\n-- error_kinds --")
for k, v in kinds.most_common(20):
    print("   %6d  %-28s e.g. %s" % (v, k, str(examples[k][:2])[:150]))
print("\n-- packages_unsupported --")
for p, n in packages.most_common(15):
    print("   %6d  %s" % (n, p[:70]))
