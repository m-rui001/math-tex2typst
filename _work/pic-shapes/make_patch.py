r"""Write the family's patches, one per changed file, named after that file.

difflib against the untouched copy under `tools/` is what the orchestrator applies, so the header
paths are `a/t2t/<file>` / `b/t2t/<file>`. Nothing is written to `tools/`: the sandbox copy is read
and the patch lands next to this script.
"""
import difflib
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SANDBOX = ROOT / "_work" / "pic-shapes"
FILES = ["t2t/cetz.py"]

for rel in FILES:
    # Both cetz.py copies store CRLF terminators, so the patch must be the same shape `git diff`
    # makes for a CRLF file: body lines read with their real \r\n kept (splitlines(True) over a
    # newline="" read), and the ---/+++/@@ headers carrying a single \n from difflib's default
    # lineterm. Writing with newline="" keeps the body's \r\n intact. `git apply` then reproduces
    # the sandbox byte for byte; `patch` cannot, because it strips CRs and would mix the endings.
    a = (ROOT / "tools" / rel).read_text(encoding="utf-8", newline="").splitlines(True)
    b = (SANDBOX / rel).read_text(encoding="utf-8", newline="").splitlines(True)
    diff = difflib.unified_diff(a, b, fromfile="a/" + rel.replace("\\", "/"),
                                tofile="b/" + rel.replace("\\", "/"))
    text = "".join(diff)
    out = SANDBOX / (Path(rel).stem + ".patch")
    out.write_text(text, encoding="utf-8", newline="")
    print("%s: %d lines, %d hunks" % (out.name, len(text.splitlines()),
                                      sum(1 for l in text.splitlines()
                                          if l.startswith("@@"))))
