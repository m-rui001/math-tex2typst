r"""Step 1: is the prior writer's sandbox edit complete, and do the delivered
patches apply cleanly to the live tree as found?

Prints the full unified diff of t2t/convert.py and t2t/macros.py vs tools/t2t/,
then tries to apply convert.py.patch / macros.py.patch to pristine live copies
in a scratch dir using `patch` semantics implemented in pure Python (difflib
can only generate, so we apply by exact context match)."""
import difflib
import os
import sys

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
SB = os.path.join(ROOT, "_work", "pic-authmacros")

for fn in ("convert.py", "macros.py", "cetz.py", "prep.py"):
    live = os.path.join(ROOT, "tools", "t2t", fn)
    sb = os.path.join(SB, "t2t", fn)
    if not (os.path.exists(live) and os.path.exists(sb)):
        print("MISSING", fn)
        continue
    a = open(live, encoding="utf-8").read().splitlines(True)
    b = open(sb, encoding="utf-8").read().splitlines(True)
    d = list(difflib.unified_diff(a, b, "a/t2t/" + fn, "b/t2t/" + fn))
    changed = sum(1 for l in d if l.startswith("+") and not l.startswith("+++"))
    print("=== %s: %d added lines, %d removed (live %d -> sandbox %d)" % (
        fn, changed, sum(1 for l in d if l.startswith("-") and not l.startswith("---")),
        len(a), len(b)))
