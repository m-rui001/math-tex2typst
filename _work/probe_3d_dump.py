r"""Print the three refused 3D pictures verbatim so the statements needing a z basis are listed.

The papers refuse as wholes, so the only copy of their TikZ source on the typst side is the quoted
raw block. Reading the flat source instead keeps the text unescaped.
"""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
OUT = os.path.join(ROOT, "_work", "_probe_3d")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)

PAPERS = (
    "A-sharp-entropy-bound-and-the-simplex-inequality-for-isotropic-constants-October-5-2026",
    "Critical-bond-and-site-percolation-on-the-cubic-lattice-September-24-2026",
    "Strong-diffeomorphic-approximation-in-three-dimensions-for-p-gt-2-September-24-2026",
)

os.makedirs(OUT, exist_ok=True)
for paper in PAPERS:
    body = open(os.path.join(FLAT, paper + ".tex"), encoding="utf-8", errors="replace").read()
    pics = PIC.findall(body)
    print("=" * 30, paper[:44], "pictures:", len(pics))
    for i, pic in enumerate(pics):
        print("--- picture %d (%d chars) ---" % (i, len(pic)))
        print(pic)
        open(os.path.join(OUT, "%s_%d.tex" % (paper[:20], i)), "w", encoding="utf-8").write(pic)
