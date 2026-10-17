"""What does the in-path label come out as now?

The picture that `\\linewidth` just unlocked places `corestriction` between two named nodes; before the
placement fix its text landed on the arrow's start point and collided with the node there. Print the
emitted lines so the anchor can be read off the page rather than assumed.
"""
import re
import pathlib
import sys

sys.path.insert(0, str(pathlib.Path("tools").resolve()))
from t2t import cetz  # noqa: E402

SRC = pathlib.Path("_work/flat/Finite-generation-for-the-Kn-local-sphere-September-24-2026.tex")
pic = re.search(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}",
                SRC.read_text(encoding="utf-8"), re.S).group(0)
out = cetz.build(pic, line_cm=15.79)
print("BUILT" if out else "REFUSED")
for line in (out or "").splitlines():
    if any(w in line for w in ("corestriction", "restriction", "$A_a$", "line(", "R_a")):
        print("  " + line.strip()[:126])

SIMPLE = (r"\begin{tikzpicture}\draw (0,0) -- node[above] {mid} (4,0) "
          r"-- node[pos=.25,above] {quarter} (4,3);\end{tikzpicture}")
print("--- synthetic")
for line in (cetz.build(SIMPLE) or "").splitlines():
    print("  " + line.strip()[:126])
