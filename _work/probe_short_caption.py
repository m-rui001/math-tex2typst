"""How many papers reach the new running-head branch of the caption lift?"""
import pathlib
import re
import sys

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "tools"))
from t2t import prep

ROOT = pathlib.Path(__file__).resolve().parents[1]
# only a caption lifted out of the body arrives in a float of our own making
LIFTED = re.compile(r"\\begin\{(figure|table)\}\\caption\[")

hits = []
for path in sorted((ROOT / "preprints").glob("*/*.tex")):
    body = path.read_text(encoding="utf-8", errors="replace")
    n = len(LIFTED.findall(prep.lift_captions(body)))
    if n:
        hits.append((n, path.parent.name[:44]))
print("lifted floats carrying a running head: %d over %d papers"
      % (sum(n for n, _ in hits), len(hits)))
for n, name in sorted(hits, reverse=True)[:8]:
    print("  %d  %s" % (n, name))
