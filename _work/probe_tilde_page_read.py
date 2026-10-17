r"""Read a page for the tie the products carry, to see what the reader is given.

Typst has no tie in markup, so `article~27` is expected to print the tilde; the reference list is
where most of the 782 tokens stand, and the paper whose bibliography writes them is the cheapest
place to look.
"""
import glob
import io
import os
import sys

import pymupdf

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = r"E:\math"

for folder in sorted(glob.glob(os.path.join(ROOT, "typst", "A-Coulomb-Ground-State-Density*"))):
    text = open(os.path.join(folder, "main.typ"), encoding="utf-8").read()
    stem = os.path.basename(folder)
    pdf = glob.glob(os.path.join(folder, "*.pdf"))
    print("=== %s  pdf=%s" % (stem[:60], bool(pdf)))
    if not pdf:
        continue
    doc = pymupdf.open(pdf[0])
    for page in doc:
        flat = " ".join(page.get_text().split())
        for needle in ("article", "Part"):
            i = flat.find(needle + "~")
            if i >= 0:
                print("  PAGE:", flat[max(0, i - 50):i + 60])
                break
        else:
            continue
        break
    doc.close()
