r"""Read the page after #72: does the C1 clock figure set its label maths, and what is left?

The figure's labels were `Reset\\\(t\in[2,5]\)\\\(v'_\ell=0\)`, which the page printed as
`Reset (t[2,5]) (v’_=0)` -- the element-of sign deleted with its command name, the delimiters shown
as parentheses. Two readings: the page text of that figure, and every `#linebreak()` followed by an
escaped paren that still stands in the products, with the source line that wrote it, to tell a
formula still unconverted from a pair of prose parentheses Typst escapes correctly.
"""
import glob
import io
import os
import re
import sys

import pymupdf

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = r"E:\math"
B = chr(92)

folder = glob.glob(os.path.join(ROOT, "typst", "A-C1-Counterexample-to-the-Entropy-Conjecture*"))[0]
doc = pymupdf.open(glob.glob(os.path.join(folder, "*.pdf"))[0])
for page in doc:
    flat = " ".join(page.get_text().split())
    if "Readout" in flat and "Reset" in flat:
        i = flat.find("Reset")
        print("PAGE:", flat[i:i + 210])
        break
doc.close()

print()
left = []
for path in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
    text = open(path, encoding="utf-8").read()
    for m in re.finditer(r"#linebreak\(\)" + re.escape(B + "("), text):
        left.append((os.path.basename(os.path.dirname(path))[:50],
                     text[m.start():m.start() + 70].replace("\n", " ")))
print("labels still printing an escaped paren after a break: %d" % len(left))
for name, shown in left[:9]:
    print("  %-50s %s" % (name, shown))
