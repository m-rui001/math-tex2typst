r"""#77's churn face, by stub-diffing the OLD law on the same base.

`BIB_MARKUP_RX` gained `~`, so the papers that change are exactly those with a `~` in a non-link
field. Run both readings of the trigger over every such `refs.original.bib` and diff the products:
the changed-paper list is the regen queue, and the per-field diff is where a widened trigger could
lose ink (the plain writer also joins lines, turns `--` into an en dash, and drops a leading `~`).
A field whose letters and digits change at all is printed for judgement, not silently accepted.
"""
import io
import os
import re
import sys
import difflib
from concurrent.futures import ThreadPoolExecutor

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace", newline="")

from t2t import convert

OLD_RX = re.compile(r'[$\\^_]')
OUT = os.path.join(ROOT, "typst")
KEEP = re.compile(r'[0-9A-Za-z]+')


def work(arg):
    name, mode = arg
    path = os.path.join(OUT, name, "refs.original.bib")
    if not os.path.exists(path):
        return None
    with io.open(path, encoding="utf-8", errors="replace") as f:
        bib = f.read()
    if "~" not in bib:
        return None
    return (name, convert.flatten_bib_fields(bib))


def main():
    names = sorted(d for d in os.listdir(OUT)
                   if os.path.isdir(os.path.join(OUT, d))
                   and os.path.exists(os.path.join(OUT, d, "refs.original.bib")))
    live = convert.BIB_MARKUP_RX
    outs = {}
    for mode, rx in (("old", OLD_RX), ("new", live)):
        convert.BIB_MARKUP_RX = rx
        with ThreadPoolExecutor(12) as pool:
            outs[mode] = dict(r for r in pool.map(work, [(n, mode) for n in names]) if r)
        print("pass %s done: %d bibs with a `~`" % (mode, len(outs[mode])))
    convert.BIB_MARKUP_RX = live
    changed = [n for n in names if outs["old"].get(n) != outs["new"].get(n)]
    fields = tildes = lost_n = 0
    lost, shown = [], 0
    for name in changed:
        old, new = outs["old"][name], outs["new"][name]
        tildes += old.count("~") - new.count("~")
        a_lines, b_lines = old.split("\n"), new.split("\n")
        for tag, i1, i2, j1, j2 in difflib.SequenceMatcher(None, a_lines, b_lines).get_opcodes():
            if tag == "equal":
                continue
            a, b = " ".join(a_lines[i1:i2]), " ".join(b_lines[j1:j2])
            if a == b:
                continue
            fields += 1
            if set(KEEP.findall(a)) - set(KEEP.findall(b)):
                lost.append((name, a[:78], b[:78]))
        if shown < 6:
            shown += 1
            print("\n  %s" % name[:64])
            for tag, i1, i2, j1, j2 in difflib.SequenceMatcher(None, a_lines, b_lines).get_opcodes():
                if tag == "equal":
                    continue
                a, b = " ".join(a_lines[i1:i2]), " ".join(b_lines[j1:j2])
                if a != b:
                    print("    old %r\n    new %r" % (a[:96], b[:96]))
    print("\npapers with a `~` in the bib: %d" % len(outs["new"]))
    print("papers whose product CHANGES:  %d" % len(changed))
    print("lines changed:                 %d" % fields)
    print("tildes removed from the bib:   %d" % tildes)
    print("lines whose letters/digits shrink (content question): %d" % len(lost))
    for name, a, b in lost[:10]:
        print("    %-40s\n      old %r\n      new %r" % (name[:40], a, b))
    with io.open(os.path.join(ROOT, "_work", "regen77.txt"), "w", encoding="utf-8", newline="\n") as f:
        for n in changed:
            f.write(n + "\n")


main()
