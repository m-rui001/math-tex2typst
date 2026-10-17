r"""For each flat source picture, does the page carry a canvas, a quoted raw block, or nothing?

The static refusal classifier counts 26 refused pictures but main.typ carries only 16 quoted raw
blocks, so ten refusals leave no trace at all. A dropped figure is worse than a quoted one: the
author's drawing and its caption are simply gone. This walks the papers that hold a
`\linewidth`-fraction basis and prints the three counts side by side.
"""
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PICTURE = re.compile(r"\\begin\{(tikzpicture|tikzcd)\}(.*?)\\end\{\1\}", re.S)
LINELIKE_BASIS = re.compile(r"[xy]\s*=\s*\.?\d*\s*\\(?:text|line|column)width")
RAW = re.compile(r'#raw\(block: true, lang: "latex"')
CANVAS = re.compile(r"#cetz\.canvas\(")

PAPERS = ["Finite-angular-cylinder", "Finite-generation-for-the-Kn", "Harmonic-heights",
          "Radius-of-comparison", "A-Fock-space", "Deterministic-nonbipartite",
          "Diagonal-Fourier", "Equality-and-rigidity", "Logarithmic-Kodaira",
          "Quasipolynomial-Bounds", "Squarefree-values"]

print("%-42s %6s %7s %7s" % ("paper", "pics", "canvas", "raw"))
for stem in PAPERS:
    srcs = [p for p in os.listdir(os.path.join(ROOT, "_work", "flat")) if p.startswith(stem)]
    if not srcs:
        print("%-42s  no flat source" % stem)
        continue
    src = open(os.path.join(ROOT, "_work", "flat", srcs[0]), encoding="utf-8", errors="replace").read()
    dirs = [d for d in os.listdir(os.path.join(ROOT, "typst")) if d.startswith(stem[:40])]
    typ = open(os.path.join(ROOT, "typst", dirs[0], "main.typ"), encoding="utf-8", errors="replace").read() if dirs else ""
    pics = list(PICTURE.finditer(src))
    basis = sum(1 for p in pics if LINELIKE_BASIS.search(p.group(2) or ""))
    print("%-42s %6d %7d %7d  linewidth-basis opts: %d"
          % (stem[:42], len(pics), len(CANVAS.findall(typ)), len(RAW.findall(typ)), basis))
