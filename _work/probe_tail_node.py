"""Why does a node that trails the last coordinate come back empty?

The first two in-path placements measure right, so this checks the case with no segment after the
node, which TikZ hangs off the last point drawn.
"""
import pathlib
import sys

sys.path.insert(0, str(pathlib.Path("tools").resolve()))
from t2t import cetz  # noqa: E402

for pic in (r"\begin{tikzpicture}\draw (0,0) -- (4,3) node {tail};\end{tikzpicture}",
            r"\begin{tikzpicture}\draw (0,0) node {at} (4,3);\end{tikzpicture}",
            r"\begin{tikzpicture}\draw (0,0) -- node {mid} (4,0);\end{tikzpicture}"):
    got = cetz.build(pic)
    print(repr(pic[20:52]), "->", "None" if got is None else " | ".join(
        ln.strip() for ln in got.splitlines() if "(" in ln and "canvas" not in ln))
