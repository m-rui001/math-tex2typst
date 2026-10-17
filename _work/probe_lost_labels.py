r"""Show the six source places a label exists yet dangles.

The reader lost these numbers, so the shape is ours: each line around the \\label says
whether the caption had a float to live in.
"""
import io
import pathlib
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
FLAT = ROOT / "_work" / "flat"
WANT = [("The-sharp-factor-of-IID", "fig:half-path-averages"),
        ("The-Kervaire-Invariant", "finite:enclosures"),
        ("A-boundary-field-gap", "apptr:entry-table")]

for stem, key in WANT:
    src = next(FLAT.glob(stem + "*.tex"))
    lines = src.read_text(encoding="utf-8", errors="replace").split("\n")
    at = [i for i, l in enumerate(lines) if "label{%s}" % key in l]
    print("== %s  label on lines %s" % (key, [i + 1 for i in at]))
    for i in at[:1]:
        for j in range(max(0, i - 7), min(len(lines), i + 2)):
            print("  %5d %s" % (j + 1, lines[j][:112]))
    print()
