r"""Write _work/pic-plot/cetz.patch: this family's change to cetz.py, against live tools/.

difflib rather than a hand-written diff, and the live file is read as it stands now, so the
orchestrator applies the patch to the tree it has rather than the one the prior writer copied.

Run: python _work/pic-plot/make_patch.py
"""
import difflib
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
live = (ROOT / "tools/t2t/cetz.py").read_text(encoding="utf-8").splitlines(keepends=False)
sandbox = (ROOT / "_work/pic-plot/t2t/cetz.py").read_text(encoding="utf-8").splitlines(keepends=False)

diff = list(difflib.unified_diff(live, sandbox, fromfile="a/t2t/cetz.py", tofile="b/t2t/cetz.py",
                                 lineterm=""))
out = ROOT / "_work/pic-plot/cetz.patch"
out.write_text("\n".join(diff) + "\n", encoding="utf-8")
hunks = [d for d in diff if d.startswith("@@")]
added = sum(1 for d in diff if d.startswith("+") and not d.startswith("+++"))
removed = sum(1 for d in diff if d.startswith("-") and not d.startswith("---"))
print("%s: %d hunks, %d added, %d removed" % (out, len(hunks), added, removed))
for h in hunks:
    print("   ", h)
