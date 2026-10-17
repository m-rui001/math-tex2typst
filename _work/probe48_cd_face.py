r"""The face of the tikzcd arrow law: what `build_cd` emits for the shapes the corpus writes.

Each case is one measured fact from the control probes (`_work/measure48_cd_bend.py` for the label
clearance and the bend's side and shape, `_work/measure48_cd_hook.py` for the barb), so this prints the
canvas next to the reading it should agree with, and `tools/test_t2t.py` pins the same numbers.
"""
import io
import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
                                 "tools"))
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace", newline="")
from t2t import cetz  # noqa: E402

CASES = [
    ("plain label", 'A \\arrow[r,"f"] & B'),
    ("swapped label", "A \\arrow[r,\"f\"'] & B"),
    ("vertical label", 'A \\arrow[d,"group and residue duality"] \\\\ B'),
    ("bend left=22", 'A \\arrow[rr,bend left=22,"f"] & & B'),
    ("bare bend left", 'A \\arrow[rr,bend left,"f"] & & B'),
    ("bend right=22", 'A \\arrow[rr,bend right=22,"f"] & & B'),
    ("bend swapped", "A \\arrow[dr,bend left=30,\"f\"'] \\\\ & B"),
    ("hook", 'A \\arrow[r,hook] & B'),
    ("equal", 'A \\arrow[r,equal] & B'),
    ("two labels", 'A \\arrow[r,"f","g"] & B'),
]

for name, body in CASES:
    canvas = cetz.build_cd("\\begin{tikzcd}" + body + "\\end{tikzcd}")
    print("### %s   %s" % (name, body))
    print(canvas if canvas else "    refused")
