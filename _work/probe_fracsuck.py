import json
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t.convert import formula_list  # noqa: E402

for paper in ("Tree-Constructions-for-the-l1-Distortion-of",
              "Symplectic-Balls-in-Symmetric-Polar-Products",
              "Critical-mixing-in-the-Sherrington-Kirkpatrick"):
    hits = sorted((ROOT / "_work" / "flat" / "_work_tex").glob(paper + "*.json"))
    if not hits:
        print("no ast for", paper)
        continue
    ast = json.loads(hits[0].read_text(encoding="utf-8"))
    for tex in formula_list(ast):
        if "frac" in tex and ("tau" in tex or "nu nu" in tex or "mu" in tex):
            print(repr(tex[:200]))
            break
