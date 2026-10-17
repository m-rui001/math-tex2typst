r"""Print the canvases the four cd tests in tools/test_t2t.py assert on, after the separation law.

  python _work/probe93_cd_test_canvases.py
"""
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz  # noqa: E402

CASES = [
    ("stacked",
     "\\begin{tikzcd}[row sep=large]"
     "\\begin{gathered}\\text{first line}\\\\ \\text{second line}\\end{gathered} \\arrow[d] \\\\"
     "\\text{below}"
     "\\end{tikzcd}"),
    ("wide-label",
     "\\begin{tikzcd} A \\arrow[d,\"group and residue duality\"] \\\\ B \\end{tikzcd}"),
    ("short-label", "\\begin{tikzcd} A \\arrow[r,\"f\"] & B \\end{tikzcd}"),
    ("swap-label", "\\begin{tikzcd} A \\arrow[r,\"f\"'] & B \\end{tikzcd}"),
    ("bend22", "\\begin{tikzcd} A \\arrow[rr,bend left=22,\"f\"] & & B \\end{tikzcd}"),
    ("bendright22", "\\begin{tikzcd} A \\arrow[rr,bend right=22,\"f\"] & & B \\end{tikzcd}"),
    ("bendbare", "\\begin{tikzcd} A \\arrow[rr,bend left,\"f\"] & & B \\end{tikzcd}"),
    ("hook", "\\begin{tikzcd} A \\arrow[r,hook] & B \\end{tikzcd}"),
    ("cd-xy", "\\begin{CD} A @>>> B \\end{CD}"),
]

for name, src in CASES:
    canvas = cetz.build_cd(src)
    print("=== %s ===\n%s" % (name, canvas))
    if name == "cd-xy":
        print("--- the tikzcd the CD translation writes ---\n%s" % cetz.xy_to_tikzcd(src))
print("\ncell boxes: one letter %.3f cm wide, %.3f cm tall; empty %.3f"
      % (cetz.cd_width("A"), cetz.cd_height("A"), cetz.cd_width("")))
print("separations: column normal %.3f, column large %.3f, row normal %.3f, row large %.3f"
      % (cetz.cd_gap("[column sep=normal]", "column sep"),
         cetz.cd_gap("[column sep=large]", "column sep"),
         cetz.cd_gap("[row sep=normal]", "row sep"),
         cetz.cd_gap("[row sep=large]", "row sep")))
print("8em -> %.3f cm, 3.2cm -> %.3f cm, huge -> %.3f cm"
      % (cetz.cd_gap("[column sep=8em]", "column sep"),
         cetz.cd_gap("[column sep=3.2cm]", "column sep"),
         cetz.cd_gap("[column sep=huge]", "column sep")))
