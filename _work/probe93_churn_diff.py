r"""Diff the two canvas-hash dumps and write the regen list.

Two runs of `_work/probe93_slash_churn.py` -- old package first, live code second -- are the same
724-paper replay with one thing different, so the change surface is exactly the set of lines whose
hash differs, plus the lines present on one side only (a canvas the other version refused).  The
key is `(full paper stem, picture index)`; matching on a truncated stem would collide between
papers sharing a 60-character prefix.

  python _work/probe93_churn_diff.py
"""
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")

BEFORE = os.path.join(ROOT, "_work", "m93_churn_before.tsv")
AFTER = os.path.join(ROOT, "_work", "m93_churn_after.tsv")
LIST = os.path.join(ROOT, "_work", "regen_needed.txt")


def load(path):
    rows = {}
    skips = []
    for line in open(path, encoding="utf-8"):
        parts = line.rstrip("\n").split("\t")
        if len(parts) == 3 and parts[1] == "SKIP":
            skips.append((parts[0], parts[2]))
            continue
        if len(parts) == 3:
            rows[(parts[0], parts[1])] = parts[2]
    return rows, skips


def main():
    before, bs = load(BEFORE)
    after, as_ = load(AFTER)
    if bs or as_:
        print("SKIP rows: before %d %s | after %d %s"
              % (len(bs), bs[:3], len(as_), as_[:3]))
    changed = [k for k in sorted(set(before) & set(after)) if before[k] != after[k]]
    only_b = sorted(set(before) - set(after))
    only_a = sorted(set(after) - set(before))
    print("canvas lines: before %d  after %d" % (len(before), len(after)))
    print("changed %d   canvases lost %s   gained %s"
          % (len(changed), [k for k in only_b][:5], [k for k in only_a][:5]))
    for k in changed:
        print("   %s #%s  %s -> %s" % (k[0][:60], k[1], before[k], after[k]))
    papers = sorted({k[0] for k in changed} | {k[0] for k in only_b} | {k[0] for k in only_a})
    print("papers %d" % len(papers))
    with open(LIST, "w", encoding="utf-8", newline="\n") as fh:
        fh.write("\n".join(papers) + "\n")
    return 0


if __name__ == "__main__":
    sys.exit(main())
