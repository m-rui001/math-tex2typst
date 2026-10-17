import sys
from pathlib import Path
sys.path.insert(0, str(Path("tools").resolve()))
from t2t import cetz

src = Path(
    "preprints/Self-dual-random-cluster-interfaces-below-one-September-23-2026/"
    "build/figures/dependencies.tex").read_text(encoding="utf-8")
start = src.index("\\begin{tikzpicture}")
end = src.index("\\end{tikzpicture}") + len("\\end{tikzpicture}")
canvas = cetz.build(src[start:end])
if canvas is None:
    print("REFUSED")
else:
    print(canvas)
