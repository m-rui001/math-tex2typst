r"""Convert the three owned papers' pictures through the production picture path.

This is the isolation protocol's recipe: split the document, read the preamble for the line width,
expand the paper's own macros inside the picture, then hand it to build(). The live typst/main.typ
already holds the "before" answer, so only the sandbox tree runs here.

Usage: python corpus_three.py <tree-on-sys.path>
"""
import re
import sys

sys.path.insert(0, sys.argv[1])
from t2t import cetz, convert, prep

FLAT = r"E:\math\_work\flat\%s.tex"
PAPERS = ("Finite-cylinder-approximation-of-ruled-sets-September-27-2026",
          "Universal-Tensor-Squares-for-Symmetric-Groups-September-24-2026",
          "Critical-strip-crossing-mass-on-the-honeycomb-lattice-September-26-2026")

for paper in PAPERS:
    src = open(FLAT % paper, encoding="utf-8", errors="replace").read()
    pre_text, body = prep.split_document(src)
    p = prep.parse_preamble(pre_text)
    cm = convert.line_cm(p)
    found = re.findall(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", body, re.S)
    drawn = 0
    for pic in found:
        pic = prep.expand_macros(pic, p.macros)
        got = cetz.build(pic, line_cm=cm)
        if got is not None:
            drawn += 1
    print("%-58s pictures=%d drawn=%d" % (paper[:58], len(found), drawn))
