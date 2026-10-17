r"""What does the page show TODAY for the 10 `hash-or-dollar` labels?

They reach Typst as a quoted string of the CONVERTED text (`"# Fix ( phi_H^1)= chi (M)+128"`),
so the question is whether the page prints the glyphs or the internal names (`phi`, `chi`).
Read-only, no typst.
"""
import sys

import pymupdf

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
PAPERS = {
    "Morse": ("typst/A-nondegenerate-counterexample-to-the-Morse-number-Arnold-bound-"
              "September-23-2026/main.pdf", ["Sixteen cap insertions", "Unbounded deficit"]),
    "area-law": ("typst/A-two-dimensional-area-law-from-a-global-spectral-gap-September-24-2026/"
                 "main.pdf", ["A_h"]),
    "Edit-Distance": ("typst/Edit-Distance-in-l1-Matching-Bounds-up-to-Constants-in-the-"
                      "Exponent-September-27-2026/main.pdf", ["#"]),
    "Sharp-integral": ("typst/Sharp-integral-fillings-in-CAT(0)-spaces-September-23-2026/main.pdf",
                       ["F"]),
}
for name, (path, needles) in PAPERS.items():
    doc = pymupdf.open(path)
    print("== %s ==" % name)
    for pno in range(doc.page_count):
        txt = doc[pno].get_text()
        for line in txt.splitlines():
            if any(n in line for n in needles) and ("Fix" in line or "_" in line or "#" in line):
                print("  p%d: %r" % (pno + 1, line[:110]))
    doc.close()
