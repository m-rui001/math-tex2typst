r"""#91 reconciliation leftovers: where does the weight the source asks for actually sit?

`probe134_pen_products.py` compares the heaviest pen a paper's option tables price against the
heaviest `thickness:` its products emit.  Four papers ask for a weight and emit NO rule at all, so
the ask must be sitting somewhere the emitter never draws -- read those pictures' statements back and
say which.  The other direction matters just as much: some papers carry a heavier rule than the ask
table records, which would mean the walk over option tables misses a spelling.
"""
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
FLAT = os.path.join(ROOT, "_work", "flat")
TYPST = os.path.join(ROOT, "typst")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)

from t2t import cetz

for stem in sys.argv[1:]:
    text = io.open(os.path.join(FLAT, stem + ".tex"), encoding="utf-8",
                   errors="replace").read()
    for pic in PIC.findall(text):
        print("=== %s" % stem[:70])
        print(pic.strip()[:1500])
        canvas = cetz.build(pic)
        print("--- canvas (%s)" % ("None, refused" if canvas is None else "%d chars" % len(canvas)))
        if canvas:
            for line in canvas.splitlines():
                if "stroke" in line or "set line" in line or "pen" in line:
                    print("   %s" % line.strip()[:180])
            for line in canvas.splitlines():
                if "line width" in line:
                    print("   WIDTH %s" % line.strip()[:180])
