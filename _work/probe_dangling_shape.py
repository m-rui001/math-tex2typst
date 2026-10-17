r"""Show the source context of the dangling keys the text probe flagged.

Two shapes look wrong before they are fixed: a key that carries the label prefix twice
and a comma list, which cleveref splits into several references on its own.
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
FLAT = ROOT / "_work" / "flat"

want = [("Conditional-information-under-deterministic", ["l-l:degree-all-powers"]),
        ("A-counterexample-to-Hadwigers", ["lem:limit-zero-product"]),
        ("Random-coordinate-frames", ["l:orbit-span"])]
for stem, keys in want:
    src = next(FLAT.glob(stem + "*.tex"))
    text = src.read_text(encoding="utf-8", errors="replace")
    lines = text.split("\n")
    print("== %s" % src.stem[:52])
    for k in keys:
        hits = [i for i, l in enumerate(lines) if k in l]
        print("-- %s in %d lines" % (k, len(hits)))
        for i in hits[:3]:
            l = lines[i]
            j = l.find(k)
            print("   %5d  ...%s..." % (i + 1, l[max(0, j - 90):j + len(k) + 30]))
    # how the author builds the companion reference macro
    for i, l in enumerate(lines):
        if re.search(r"\\(?:Lref|@nameuse|newcommand\{\\L?ref)\b", l):
            print("   def:%5d  %s" % (i + 1, l.strip()[:170]))
            if i > 200:
                break
