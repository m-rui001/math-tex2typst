"""Papers whose figures a `(name) -- (name)` edge runs through, i.e. the ones #26 changes.

A paper needs no regeneration when no picture connects two named nodes with a straight segment:
its canvases come out byte-for-byte the same as before the clipping change.
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
NODE_DEF = re.compile(r"\\(?:node|coordinate)\b[^;]*?\(([-\w][-\w ]*[-\w]|[-\w])\)")
# a `(a) -- (b)` / `(a) -| (b)` edge, both ends a bare name
EDGE = re.compile(r"\(([-\w][-\w ]*[-\w]|[-\w])\)\s*(?:--|-!\||\|-|-\|)\s*\(")
ANCHOR = re.compile(r"\([-\w][-\w ]*[-\w]\s*\.\s*[-\w ]+\)")

hits = []
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = path.read_text(encoding="utf-8", errors="replace")
    n = 0
    for pic in PIC.findall(text):
        names = set(NODE_DEF.findall(pic))
        for m in EDGE.finditer(pic):
            if m.group(1) in names:
                n += 1
        n += len(ANCHOR.findall(pic))
    if n:
        hits.append((n, path.stem))
print("papers needing regen: %d" % len(hits))
for n, name in sorted(hits, reverse=True)[:15]:
    print("  %3d  %s" % (n, name[:60]))
(ROOT / "_work" / "regen_needed.txt").write_text(
    "\n".join(name for _n, name in hits), encoding="utf-8")
print("wrote _work/regen_needed.txt")
