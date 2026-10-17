r"""Papers whose tikzcd cells hold a stacked environment -- the ones #30 can move.

Also reports any `aligned`/`array`/`matrix` inside tikzcd, which the same protection now covers.
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
STACK = re.compile(r"\\begin\{(gathered|aligned|substack|array|matrix)\}")

names = []
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    t = path.read_text(encoding="utf-8", errors="replace")
    hits = 0
    for m in re.finditer(r"\\begin\{(?:tikzcd|CD)\}.*?\\end\{(?:tikzcd|CD)\}", t, re.S):
        hits += len(STACK.findall(m.group(0)))
    if hits:
        names.append(path.stem)
        print("%2d  %s" % (hits, path.stem[:68]))
(ROOT / "_work" / "regen_needed.txt").write_text("\n".join(names), encoding="utf-8")
print("wrote %d names" % len(names))
