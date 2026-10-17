"""Merge each family sandbox into one tree with 3-way merges.

The sandboxes were all seeded from the live tree after its last edit, so the live files are the
common base for every one of them; a two-way `patch` fails on their CRLF/LF disagreement while
`git merge-file` only cares about overlapping hunks.
"""
import os
import shutil
import subprocess
import sys

LIVE = "tools"
MERGE_ROOT = os.path.join("_work", "mg")
SANDBOXES = ["pic-3d", "pic-scoped", "pic-pgfmath", "pic-plot", "pic-shapes", "pic-authmacros"]
# the live tree carries a prep.py fix made after the sandboxes were seeded, so their copies are
# strictly behind it and must not be merged at all
SKIP = {"prep.py"}


def sandbox_files(sb):
    src = os.path.join("_work", sb, "t2t")
    return sorted(n for n in os.listdir(src) if n.endswith(".py")) if os.path.isdir(src) else []


def differs(a, b):
    try:
        left = open(a, "rb").read().replace(b"\r\n", b"\n")
        right = open(b, "rb").read().replace(b"\r\n", b"\n")
    except OSError:
        return False
    return left != right


def fresh():
    if os.path.isdir(MERGE_ROOT):
        shutil.rmtree(MERGE_ROOT)
    merged = os.path.join(MERGE_ROOT, "tools", "t2t")
    base = os.path.join(MERGE_ROOT, "base")
    os.makedirs(merged)
    shutil.copytree(os.path.join(LIVE, "t2t"), base, dirs_exist_ok=True)
    return merged, base


def main():
    merged, base = fresh()
    for name in sorted(os.listdir(os.path.join(LIVE, "t2t"))):
        if name.endswith(".py"):
            shutil.copyfile(os.path.join(LIVE, "t2t", name), os.path.join(merged, name))
    log = []
    for sb in SANDBOXES:
        for name in sandbox_files(sb):
            if name in SKIP:
                continue
            theirs = os.path.join("_work", sb, "t2t", name)
            anchor = os.path.join(base, name)
            if not os.path.exists(anchor) or not differs(anchor, theirs):
                continue
            cur = os.path.join(merged, name)
            got = subprocess.run(
                ["git", "merge-file", "-L", "live", "-L", "base", "-L", sb, cur, anchor, theirs],
                capture_output=True, text=True,
            )
            log.append("%-16s %-12s %s %s" % (sb, name, "clean" if got.returncode == 0 else "CONFLICT(%d)" % got.returncode, got.stderr.strip()[:120]))
    print("\n".join(log))
    for name in sorted(os.listdir(merged)):
        if name.endswith(".py") and differs(os.path.join(LIVE, "t2t", name), os.path.join(merged, name)):
            print("merged differs from live: %s" % name)
    return 1 if any("CONFLICT" in line for line in log) else 0


if __name__ == "__main__":
    sys.exit(main())
