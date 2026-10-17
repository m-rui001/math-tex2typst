r"""Write the stems whose pictures contain a node the invisible-measure change rewrites.

A node is affected when it carries a written measure and asks for no frame -- exactly the branch
`emit_node` now wraps in a `#box`.
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(errors="replace")
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
FLAT = os.path.join(ROOT, "_work", "flat")

stems = set()
cur = None
orig = cetz.emit_node


def wrapped(at, inner_node, o, *a, **kw):
    width = kw.get("width")
    if width is None and len(a) >= 4:
        width = a[3]
    if width is not None and not cetz.box_visible(o):
        stems.add(cur)
    return orig(at, inner_node, o, *a, **kw)


cetz.emit_node = wrapped
for src in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
    cur = os.path.splitext(os.path.basename(src))[0]
    for p in PIC.findall(open(src, encoding="utf-8", errors="replace").read()):
        cetz.build(p)

out = os.path.join(ROOT, "_work", "regen_needed.txt")
with open(out, "w", encoding="utf-8") as fh:
    for stem in sorted(stems):
        fh.write(stem + "\n")
print("%d papers -> %s" % (len(stems), out))
