import sys, re
sys.path.insert(0, "_work/math-cite")
from t2t import mathconv

paths = []
import glob, os
for pre in ["Kadisons", "The-Restricted-Geometric", "Uniform-indices"]:
    paths.append(glob.glob(os.path.join("_work", "flat", pre + "*.tex"))[0])

# Only citations that live inside \text{...} (or bare) inside a display equation matter here.
# Enumerate every MATH_CITE match with its bracket note and keys.
for p in paths:
    src = open(p, encoding="utf-8").read()
    print("===", os.path.basename(p))
    for m in mathconv.MATH_CITE.finditer(src):
        whole = m.group(0)
        # re-grab the bracketed prefix from the raw text for reporting
        pre = re.search(r"(\\[a-zA-Z]+)\s*(\[[^\]]*\])?", whole)
        print("  CMD=", pre.group(1), "NOTE=", repr(pre.group(2)), "KEYS=", repr(m.group(1)))
