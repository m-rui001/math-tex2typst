r"""Keep the family's patch to the family.

The one colour value the verification measured wrong (`cetz.RGB["orange"]`) belongs to a shared table
that 132 papers' pictures read, not to the picture-lifting path, so it is carried out of the sandbox's
`t2t/` and delivered as its own patch: the family patch then contains only `convert.py` and
`macros.py`, and the orchestrator can land the ink correction on its own schedule.
"""
import os
import shutil

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
SB = os.path.join(ROOT, "_work", "pic-authmacros")
KEEP = os.path.join(SB, "_orange")
os.makedirs(KEEP, exist_ok=True)

fixed = os.path.join(SB, "t2t", "cetz.py")
live = os.path.join(ROOT, "tools", "t2t", "cetz.py")
shutil.copyfile(fixed, os.path.join(KEEP, "cetz.py.fixed"))
shutil.copyfile(live, fixed)
print("sandbox cetz.py restored from tools/; the corrected copy is _orange/cetz.py.fixed")
