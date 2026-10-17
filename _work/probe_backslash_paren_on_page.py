r"""Read how the page prints a `\( ... \)` that stands inside a converted formula.

The maths path leaves the TeX inline-math delimiters in the emitted formula (704 papers carry one),
and the question is only what the page shows: Typst has no `\(`, so the pair either prints as literal
backslashes, as the parentheses they are not, or vanishes with the delimiter reading. Which of the
three decides whether `\( K \)` is a defect at all.
"""
import io
import os
import re
import sys

import pymupdf

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = r"E:\math"

CASES = [("A-CH-Obstruction-to-a-Prescribed-Categoricity", "categorical in some"),
         ("A-Capacity-Criterion-for-Four-State-Potts", "uniform spin in")]

for stem, needle in CASES:
    folder = None
    for name in os.listdir(os.path.join(ROOT, "typst")):
        if name.startswith(stem):
            folder = os.path.join(ROOT, "typst", name)
            break
    src = open(os.path.join(folder, "main.typ"), encoding="utf-8").read()
    line = next((l for l in src.split("\n") if needle in l), "")
    print("=== %s\n  TYPST: %s" % (stem, line.strip()[:190]))
    pdf = next((p for p in os.listdir(folder) if p.endswith(".pdf")), None)
    if not pdf:
        print("  no pdf")
        continue
    doc = pymupdf.open(os.path.join(folder, pdf))
    for page in doc:
        text = page.get_text()
        if needle in text.replace("\n", " "):
            flat = " ".join(text.split())
            i = flat.find(needle)
            print("  PAGE : %s" % flat[max(0, i - 40):i + 150])
            break
    doc.close()
