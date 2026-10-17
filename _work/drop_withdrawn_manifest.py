"""Drop the three withdrawn papers from _work/manifest.json, leaving every other entry's index.

inventory.py rebuilds the manifest from preprints/, which would renumber the list that
_work/other_queue.txt addresses by line number, so the withdrawal is applied in place instead.
"""
import json
import pathlib

ROOT = pathlib.Path(__file__).resolve().parents[1]
WITHDRAWN = [
    "Algebraicity-of-Kuga-Satake-Correspondences-for-K3-Surfaces-October-3-2026",
    "Algebraicity-of-Weil-classes-on-split-abelian-eightfolds-September-18-2026",
    "The-rational-Hodge-conjecture-for-products-of-K3-surfaces-October-4-2026",
]

path = ROOT / "_work" / "manifest.json"
entries = json.loads(path.read_text(encoding="utf-8"))
listed = {e["paper"] for e in entries}
kept = [e for e in entries if e["paper"] not in WITHDRAWN]
path.write_text(json.dumps(kept, indent=1, ensure_ascii=False), encoding="utf-8")
print("entries %d -> %d" % (len(entries), len(kept)))
for name in WITHDRAWN:
    print("  dropped" if name in listed else "  NOT LISTED", name)
