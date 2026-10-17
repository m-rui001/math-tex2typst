r"""Prove the deliverable patch applies to the live file exactly as it stands.

The orchestrator applies cetz.patch with a patch tool, so the check is the same thing: take a copy of
tools/t2t/cetz.py, apply the hunks, and compare the result with the sandbox file the patch was made
from. Any drift in the live tree shows up here as a rejected hunk rather than as a broken batch.

Usage: python check_patch.py
"""
import difflib
import io
import shutil
import subprocess
import tempfile

LIVE = r"E:\math\tools\t2t\cetz.py"
SANDBOX = r"E:\math\_work\pic-pgfmath\t2t\cetz.py"
PATCH = r"E:\math\_work\pic-pgfmath\cetz.patch"

with io.open(LIVE, encoding="utf-8") as handle:
    live = handle.read().splitlines()
with io.open(SANDBOX, encoding="utf-8") as handle:
    edited = handle.read().splitlines()

regenerated = "\n".join(difflib.unified_diff(live, edited, fromfile="a/t2t/cetz.py",
                                             tofile="b/t2t/cetz.py", lineterm="")) + "\n"
with io.open(PATCH, encoding="utf-8") as handle:
    on_disk = handle.read()
print("patch on disk matches the live-vs-sandbox diff:", regenerated == on_disk)

work = tempfile.mkdtemp()
import os
os.mkdir(work + r"\t2t")
# the tree's files are CRLF, and a patch that is compared byte for byte has to be applied to bytes
# that were never translated -- newline="" keeps both the live copy and the result exactly as they are
raw = io.open(LIVE, encoding="utf-8", newline="").read()
io.open(work + r"\t2t\cetz.py", "w", encoding="utf-8", newline="").write(raw)
got = subprocess.run(["git", "apply", "--check", "-p1", PATCH], cwd=work, capture_output=True)
print("git apply --check -p1:", got.returncode, got.stderr.decode("utf-8", "replace")[:200])
applied = subprocess.run(["git", "apply", "-p1", PATCH], cwd=work, capture_output=True)
print("git apply -p1:", applied.returncode, applied.stderr.decode("utf-8", "replace")[:200])
now = io.open(work + r"\t2t\cetz.py", encoding="utf-8", newline="").read()
print("applied file equals the sandbox file:",
      now == io.open(SANDBOX, encoding="utf-8", newline="").read())
shutil.rmtree(work)
