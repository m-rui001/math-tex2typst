r"""Does a LaTeX tie `~` survive into the page as a tilde?

`Sections~3--6` in a node label is one word-space that must not break, and Typst has no tie: the
tilde it is handed it prints. The read is the page text, with the products' own count of the shape
beside it so the face is known either way.
"""
import glob
import io
import os
import re
import sys

import pymupdf

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = r"E:\math"

folders = [os.path.dirname(p) for p in glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))]
hits = []
for folder in folders:
    text = open(os.path.join(folder, "main.typ"), encoding="utf-8").read()
    # a tie that reaches Typst markup: `~` between two words, not inside a code string
    for m in re.finditer(r"(?<=[A-Za-z0-9])~(?=[A-Za-z0-9])", text):
        hits.append((os.path.basename(folder)[:44],
                     text[max(0, m.start() - 40):m.start() + 30].replace("\n", " ")))
print("products carrying a tie between words: %d tokens in %d papers"
      % (len(hits), len({h[0] for h in hits})))
for name, shown in hits[:6]:
    print("  %-44s %s" % (name, shown))

target = [f for f in folders if f.endswith("Projective-Space-Bases-of-Lagrangian-Fibrations"
                                         "-September-26-2026")]
if target:
    pdf = glob.glob(os.path.join(target[0], "*.pdf"))
    if pdf:
        doc = pymupdf.open(pdf[0])
        for page in doc:
            flat = " ".join(page.get_text().split())
            if "Sections" in flat:
                i = flat.find("Sections")
                print("PAGE:", flat[max(0, i - 60):i + 90])
                break
        doc.close()
