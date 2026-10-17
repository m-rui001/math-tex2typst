r"""Write cetz.patch: the sandbox copy against the live tree exactly as it was found.

difflib's unified_diff with a/t2t/... and b/t2t/... labels, so the orchestrator can apply it to
tools/ with `patch -p1` from tools' parent; the live file is never touched here.

Usage: python _work/pic-3d/make_patch.py
"""
import difflib
import io
import os
import sys

ROOT = r"E:\math\_work\pic-3d"
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")

FILES = ["cetz.py", "convert.py", "emit.py", "prep.py", "mathconv.py", "macros.py", "texutil.py"]
import hashlib  # noqa: E402  -- the patch is only appliable to the revision it was cut against

for name in FILES:
    raw = open(os.path.join(r"E:\math\tools\t2t", name), "rb").read()
    print("live %s mtime %s md5 %s" % (name, os.stat(os.path.join(r"E:\math\tools\t2t", name))
                                       .st_mtime, hashlib.md5(raw).hexdigest()))
chunks = []
for name in FILES:
    live = open(os.path.join(r"E:\math\tools\t2t", name), encoding="utf-8").read().splitlines(True)
    mine = open(os.path.join(ROOT, "t2t", name), encoding="utf-8").read().splitlines(True)
    diff = list(difflib.unified_diff(live, mine, fromfile="a/t2t/" + name,
                                     tofile="b/t2t/" + name, n=3))
    if diff:
        chunks.append("".join(diff))
        print("%s: %d hunk lines" % (name, len(diff)))
    else:
        print("%s: identical" % name)
with open(os.path.join(ROOT, "cetz.patch"), "w", encoding="utf-8") as fh:
    fh.write("".join(chunks))
print("wrote cetz.patch", sum(len(c) for c in chunks), "lines")
