r"""Merge the two running sandboxes' t2t edits back into tools/t2t.

A sandbox delivers `*.patch` for reading, but the applyable artefact is its own whole copy of the
module at `_work/<name>/t2t/<file>.py`: `patch` and `git apply` both fail this repo's mixed CRLF, and
`git merge-file` tolerates it (learned the hard way with the six picture sandboxes -- see
_work/merge_sandboxes.py). The base handed to the merge is the live file as it stood before any
sandbox was merged, kept under _work/mg2/base, so a second sandbox touching the same module merges
three-way against the first one's change instead of overwriting it.

Run it with --status first to see which modules each sandbox actually changed.
"""
import io
import os
import shutil
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SANDBOXES = ["math-cite", "float-layout"]
LIVE = os.path.join(ROOT, "tools", "t2t")
MG = os.path.join(ROOT, "_work", "mg2")
BASE = os.path.join(MG, "base")
OUT = os.path.join(MG, "merged")

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")


def sandbox_files(name):
    folder = os.path.join(ROOT, "_work", name, "t2t")
    if not os.path.isdir(folder):
        return {}
    return {f: os.path.join(folder, f)
            for f in os.listdir(folder) if f.endswith(".py")}


def differs(name):
    got = []
    for f, path in sorted(sandbox_files(name).items()):
        live = os.path.join(LIVE, f)
        if not os.path.isfile(live):
            got.append((f, "NEW"))
            continue
        a = open(live, "rb").read().replace(b"\r\n", b"\n")
        b = open(path, "rb").read().replace(b"\r\n", b"\n")
        if a != b:
            got.append((f, "%d bytes added" % (len(b) - len(a))))
    return got


if "--status" in sys.argv:
    for name in SANDBOXES:
        print("%-14s %s" % (name, differs(name) or "no changes yet"))
    sys.exit(0)

for folder in (BASE, OUT):
    if os.path.isdir(folder):
        shutil.rmtree(folder)
    os.makedirs(folder)
for f in os.listdir(LIVE):
    if f.endswith(".py"):
        shutil.copy(os.path.join(LIVE, f), os.path.join(BASE, f))
        shutil.copy(os.path.join(LIVE, f), os.path.join(OUT, f))

for name in SANDBOXES:
    for f, _note in differs(name):
        cur = os.path.join(OUT, f)
        anchor = os.path.join(BASE, f)
        theirs = os.path.join(ROOT, "_work", name, "t2t", f)
        if not os.path.isfile(anchor):
            shutil.copy(theirs, anchor)
        shutil.copy(cur, cur + ".orig")
        proc = subprocess.run(["git", "merge-file", "-L", "live", "-L", "base", "-L", name,
                               cur, anchor, theirs],
                              capture_output=True, text=True, encoding="utf-8")
        print("%-14s %-14s %s" % (name, f, "clean" if proc.returncode == 0
                                  else "CONFLICT rc=%d" % proc.returncode))
