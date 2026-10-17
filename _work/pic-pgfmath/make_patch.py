r"""Emit the deliverable patch: difflib unified diff of the seeded file against the edited one.

Usage: python make_patch.py
The pristine copy is the live tools/t2t/cetz.py, which is byte-identical to the file this sandbox
was seeded from; the edited copy is the sandbox's own t2t/cetz.py. The same bytes are written under
both names the output contract uses (spec's `cetz.patch`, dispatch's `cetz.py.patch`).
"""
import difflib
import io

PRISTINE = r"E:\math\tools\t2t\cetz.py"
EDITED = r"E:\math\_work\pic-pgfmath\t2t\cetz.py"
OUT = [r"E:\math\_work\pic-pgfmath\cetz.patch", r"E:\math\_work\pic-pgfmath\cetz.py.patch"]


def lines(path):
    with io.open(path, encoding="utf-8") as handle:
        return handle.read().splitlines()


patch = list(difflib.unified_diff(lines(PRISTINE), lines(EDITED),
                                  fromfile="a/t2t/cetz.py", tofile="b/t2t/cetz.py", lineterm=""))
text = "\n".join(patch) + "\n"
for path in OUT:
    with io.open(path, "w", encoding="utf-8", newline="\n") as handle:
        handle.write(text)
stats = [l for l in patch if l[:1] in "+-" and l[:3] not in ("+++", "---")]
print("hunks", sum(1 for l in patch if l.startswith("@@")),
      "added", sum(1 for l in stats if l[0] == "+"),
      "removed", sum(1 for l in stats if l[0] == "-"),
      "bytes", len(text.encode("utf-8")))
