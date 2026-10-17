"""Per-paper ledger diff: which papers changed their picture counts since a snapshot?

A batch overwrites typst/*/report.json, so a run has to be compared against a copy taken before
it started; the totals alone cannot say WHICH figure moved. `<snap>` holds one report.json per
paper, named after the paper.
"""
import json
import os
import pathlib
import sys

KEYS = ("cetz_converted", "cetz_refused", "cetz_split")


def stats(s):
    return tuple(int(s.get(k) or 0) for k in KEYS)


snap = pathlib.Path(sys.argv[1])
old = {p.stem: stats(json.loads(p.read_text(encoding="utf-8")).get("stats") or {})
       for p in snap.glob("*.json")}
new = {}
for e in os.scandir("typst"):
    if not e.is_dir():
        continue
    try:
        text = (pathlib.Path(e.path) / "report.json").read_text(encoding="utf-8")
    except OSError:
        continue
    new[e.name] = stats(json.loads(text).get("stats") or {})

print("%-24s %12s %12s" % ("", "snapshot", "this run"))
for i, k in enumerate(KEYS):
    print("%-24s %12d %12d"
          % (k, sum(v[i] for v in old.values()), sum(v[i] for v in new.values())))

changed = [(n, old[n], new[n]) for n in new if n in old and new[n] != old[n]]
print("\nchanged papers: %d of %d compared" % (len(changed), len(new)))
for n, o, w in sorted(changed, key=lambda r: r[2][0] - r[1][0])[:26]:
    print("  %-60s %s -> %s" % (n[:60], o, w))
