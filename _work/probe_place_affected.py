"""Papers whose figures place a node with 'of $(...)$' -- the calc-reference form this fix reads.

Only pictures that contain one change; every other canvas comes out byte-for-byte the same.
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
# a node/coordinate option that positions relative to a calc reference
CALC_OF = re.compile(r"\bof\s+\$[^$]*\$")

names = []
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = path.read_text(encoding="utf-8", errors="replace")
    n = sum(len(CALC_OF.findall(pic)) for pic in PIC.findall(text))
    if n:
        names.append(path.stem)
        print("%2d  %s" % (n, path.stem[:64]))
(ROOT / "_work" / "regen_needed.txt").write_text("\n".join(names), encoding="utf-8")
print("wrote %d names" % len(names))
