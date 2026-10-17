r"""Rebuild one picture and print the node line the change should have rewritten."""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(errors="replace")
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
stem, needle = sys.argv[1], sys.argv[2]
text = open(os.path.join(ROOT, "_work", "flat", stem + ".tex"),
            encoding="utf-8", errors="replace").read()
for p in PIC.findall(text):
    got = cetz.build(p)
    if got is None or needle not in got:
        continue
    for line in got.splitlines():
        if needle in line:
            print(line[:400])
            print("len", len(line))
