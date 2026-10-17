import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import mathconv  # noqa: E402

CASES = [
    r"a\text{x\hspace{2mm}y}b",
    r"a\text{x\hspace{2mm}y}b",   # repeat
    r"a\hspace{2mm}b",
    r"a\text{x}y",
]
got, refused, err = mathconv.convert_formulas(CASES, {})
for i, src in enumerate(CASES):
    print("  %-30s -> %s" % (src, got.get(i, "REFUSED " + str(refused.get(i)))))
if err.strip():
    print("stderr:", err.strip()[:300])
