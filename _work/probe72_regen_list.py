r"""Write the papers #72 touches, in the flat spelling `regen_list.py` walks.

The shape is a node label that opens maths behind a line break -- `\\` then `\(` -- so the list comes
from `_work/flat/*.tex` by that token, and the product-side witness (`#linebreak()\(` in
`typst/*/main.typ`) is printed next to it to show the two agree. A paper whose label writes the pair
with a space between the break and the delimiter already reached the maths path and is not in scope.
"""
import glob
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = r"E:\math"
B = chr(92)

picture = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
names = []
for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
    stem = os.path.basename(path)[:-4]
    text = open(path, encoding="utf-8", errors="replace").read()
    if any(B * 3 + "(" in pic for pic in picture.findall(text)):
        names.append(stem)

pages = []
for path in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
    text = open(path, encoding="utf-8").read()
    if "#linebreak()" + B + "(" in text:
        pages.append(os.path.basename(os.path.dirname(path)))

print("source writes \\\\( : %d papers" % len(names))
print("product prints #linebreak()%s( : %d papers" % (B, len(pages)))
unmatched = [p for p in pages if not any(p.startswith(n[:20]) for n in names)]
print("on the page but not from the source census: %d" % len(unmatched))
for name in unmatched[:6]:
    print("   %s" % name[:74])
# the five papers of #70 are in the same round's scope: a label behind a break can sit in a
# display-borne picture too, and one regen pass over the union is the cheaper, cleaner gate.
# The page-side papers join the list as well -- a label can reach the break shape through a paper
# macro, which the source census of a literal `\\\(` inside a picture does not see.
for extra in ("regen70.txt",):
    for stem in open(os.path.join(ROOT, "_work", extra), encoding="utf-8"):
        if stem.strip() and stem.strip() not in names:
            names.append(stem.strip())
for name in pages:
    if name not in names and os.path.exists(os.path.join(ROOT, "_work", "flat", name + ".tex")):
        names.append(name)
open(os.path.join(ROOT, "_work", "regen_needed.txt"), "w", encoding="utf-8").write(
    "\n".join(names) + "\n")
print("wrote _work/regen_needed.txt with %d names" % len(names))
