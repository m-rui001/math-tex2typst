r"""What is inside the 16 quoted LaTeX blocks, and what made the converter quote it?

Prints, per block: paper, line number in main.typ, the emitted Typst, and the matching region of
_work/flat/<paper>.tex that produced it. Read-only.
"""
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BLOCK = re.compile(r'#raw\(block: true, lang: "latex"')

rows = []
for tex_dir in sorted(os.listdir(os.path.join(ROOT, "typst"))):
    path = os.path.join(ROOT, "typst", tex_dir, "main.typ")
    if not os.path.isfile(path):
        continue
    lines = open(path, encoding="utf-8", errors="replace").read().split("\n")
    for i, line in enumerate(lines):
        for m in BLOCK.finditer(line):
            rows.append((tex_dir, i + 1, line, lines[max(0, i - 2):i + 6]))

print("quoted LaTeX blocks: %d over %d papers"
      % (len(rows), len(set(r[0] for r in rows))))
for paper, ln, line, ctx in rows:
    print("\n=== %s : main.typ:%d" % (paper[:44], ln))
    print("    " + line[:300].encode("unicode_escape").decode()[:300])
