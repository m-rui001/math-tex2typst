r"""Why do 238 `line(...)` endpoints move when nothing about a line was touched?

The churn stub (`_work/probe_circle_regen_guard.py`) answers `rect` for every node shape and gets the
old canvas back; of the lines the new canvas adds, 238 are `line((..), (..), stroke: ..., mark: ...)`
-- arrow endpoints, not node frames. A line's endpoint on a node comes from the box `names` holds and
from `_anchor_ring`, and both now read the circle law, so the question is which of the two moved and
whether the move is the fix (an arrow that used to start at a node's centre now starts at its border)
or a regression (an arrow that used to land on the border now misses it).

This prints, per picture of one paper, the old and new spelling of every line that differs, beside the
statement that made it.
"""
import difflib
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
STEM = sys.argv[1] if len(sys.argv) > 1 else "A-Counterexample-to-Kuroshs"
LIVE = cetz.node_shape


def build_old(pic):
    cetz.node_shape = lambda o: "rect"
    try:
        return cetz.build(pic)
    finally:
        cetz.node_shape = LIVE


for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    if not path.stem.startswith(STEM):
        continue
    src = path.read_text(encoding="utf-8", errors="replace")
    for n, pic in enumerate(PIC.findall(src)):
        old, new = build_old(pic), cetz.build(pic)
        if old is None or new is None or old == new:
            continue
        a, b = old.splitlines(), new.splitlines()
        print("== %s  picture %d" % (path.stem[:50], n))
        print(pic[:600].replace("\n", " "))
        for line in difflib.unified_diff(a, b, lineterm="", n=0):
            if line.startswith(("---", "+++", "@@")):
                continue
            print("   %s" % line[:150])
        print()
    break
