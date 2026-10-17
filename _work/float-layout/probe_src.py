r"""Print the flat LaTeX source around each caption that reaches the page as a bodyless float.

The typst side is already measured (`_work/probe_empty_where.py`); what is missing is what the
author actually wrote. Prints the enclosing float/region so the mechanism can be identified per
case rather than guessed from the name of the prep routine that might have handled it.
"""
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
FLAT = os.path.join(ROOT, "_work", "flat")

CASES = [
    ("An-integral-scalar", "reflected resolution"),
    ("Complex-Matrix-Multiplication", "Exact coefficients"),
    ("Conditional-information-under", "Fourier substitutions"),
    ("Conditional-information-under", "Two-sweep inputs"),
    ("Conditional-information-under", "Sweep bounds and their Fourier"),
    ("The-Grothendieck-homotopy", "A tree in one depth"),
    ("The-Grothendieck-homotopy", "solid arrows form the tree"),
    ("The-maximum-number-of-mutually-unbiased", "SHA-256 digests"),
    ("The-sharp-factor-of-IID", "two averages in the half-path"),
]


def flat_for(prefix):
    for name in os.listdir(FLAT):
        if name.startswith(prefix) and name.endswith(".tex"):
            return os.path.join(FLAT, name)
    return None


for prefix, needle in CASES:
    path = flat_for(prefix)
    src = open(path, encoding="utf-8", errors="replace").read()
    print("=" * 90)
    print("%s :: %s" % (os.path.basename(path), needle))
    for m in re.finditer(re.escape(needle), src):
        s = max(0, m.start() - 1600)
        e = min(len(src), m.end() + 900)
        print("--- occurrence at %d ---" % m.start())
        print(src[s:e])
        print()
