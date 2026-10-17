r"""Show each multi-label float in the two measured papers, as source and as generated Typst.

Read-only over _work/flat and typst.
"""
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
FLOAT = re.compile(r"\\begin\{(figure|table)\*?\}.*?\\end\{\1\*?\}", re.S)
LABEL = re.compile(r"\\label\{([^}]*)\}")

PAPERS = [
    "A-boundary-field-gap-for-the-spin-one-Heisenberg-chain-September-24-2026",
    "Positive-scalar-curvature-and-uniform-codimension-two-width-September-23-2026",
]

for stem in PAPERS:
    src = open(os.path.join(FLAT, stem + ".tex"), encoding="utf-8", errors="replace").read()
    print("=" * 90)
    print(stem)
    for match in FLOAT.finditer(src):
        labels = LABEL.findall(match.group(0))
        if len(labels) < 2:
            continue
        print("--- float with %d labels: %s" % (len(labels), labels))
        print(match.group(0))
