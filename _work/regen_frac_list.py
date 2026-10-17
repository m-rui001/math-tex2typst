"""Write the papers whose figure maths printed a frac command name into _work/regen_needed.txt."""
import io
import os
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
LEAK = re.compile(r'"(?:tfrac|dfrac|cfrac)"')
names = []
for path in sorted((ROOT / "typst").glob("*/main.typ")):
    if LEAK.search(path.read_text(encoding="utf-8", errors="replace")):
        source = ROOT / "_work" / "flat" / (path.parent.name + ".tex")
        if source.is_file():
            names.append(path.parent.name)
lines = names
(ROOT / "_work" / "regen_needed.txt").write_text("\n".join(lines), encoding="utf-8")
print("wrote %d names" % len(names))
for n in names:
    print(" ", n[:60])
