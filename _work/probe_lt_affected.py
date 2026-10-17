"""Papers whose longtable carries both `\\endfirsthead` and `\\endhead` -- the doubled header."""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
HEAD = re.compile(r"\\endfirsthead.*?\\endhead", re.S)

names = []
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = path.read_text(encoding="utf-8", errors="replace")
    n = len(HEAD.findall(text))
    if n:
        names.append(path.stem)
        print("%2d  %s" % (n, path.stem[:64]))
(ROOT / "_work" / "regen_needed.txt").write_text("\n".join(names), encoding="utf-8")
print("wrote %d names" % len(names))
