r"""What do the 23 pages carry TODAY for the hash and fused labels, and after the round?

B's `_work/probe_b_hash_before.py` read the five hash papers off the built PDFs and found the
quoted fallback printing the CONVERTER's internal names (`phi_H^1`, `chi`, `times`,
`arrow.r.bar`) rather than the author's maths.  The fused family has the same shape (`T_"yx"^i`
prints the quoted-word spelling, `partial  W_s0` prints the symbol's name), and #92's fix is only
believed once the rebuilt page shows the glyphs.  Same needle list, run it before and after the
regen: the before-run is the account, the after-run is the receipt.

Read-only against `typst/<paper>/main.pdf`; no typst, no tools/.

  python _work/probe92_pages.py            # every paper in the two families
  python _work/probe92_pages.py fused      # only the six fused papers
"""
import os
import re
import sys

import pymupdf

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")

# needle -> the internal spelling the fallback prints, from `_work/m92_sites_29.txt`
PAPERS = [
    ("hash", "A-nondegenerate-counterexample-to-the-Morse-number-Arnold-bound-September-23-2026",
     ["phi_H", "chi (M)"]),
    ("hash", "A-two-dimensional-area-law-from-a-global-spectral-gap-September-24-2026", ["A_h"]),
    ("hash", "Edit-Distance-in-l1-Matching-Bounds-up-to-Constants-in-the-Exponent-September-27-2026",
     ["#"]),
    ("hash", "Localization-costs-and-information-growth-for-Grigorchuk-groups-September-27-2026",
     ["# net", "2^j"]),
    ("hash", "Sharp-integral-fillings-in-CAT(0)-spaces-September-23-2026",
     ["arrow.r.bar", "F_#"]),
    ("fused", "Eventual-Categoricity-for-Abstract-Elementary-Classes-September-24-2026",
     ["W_s", "q_s", "partial W"]),
    ("fused", "Exact-Derandomization-of-Logarithmic-Space-Lossy-samplers-September-22-2026",
     ["1^n"]),
    ("fused", "Localization-costs-and-information-growth-for-Grigorchuk-groups-September-27-2026",
     ["# net", "2^j"]),
    ("fused", "Smooth-Anisotropic-Uniqueness-in-the-Calderon-problem-September-24-2026",
     ["T_y", "yx"]),
    ("fused", "The-complexity-of-identifying-a-graph-by-Weisfeiler-Leman-September-22-2026",
     ["l1", "l 1"]),
    ("fused", "The-hypercube-Ramsey-number-has-linear-order", ["n2", "N lt"]),
]

want = sys.argv[1] if len(sys.argv) > 1 else None
# the fallback prints the converter's own spellings, and body prose almost never carries one:
# an underscore, a hash, a caret or a broken control word is the line-shape filter that separates
# a figure label from a sentence.
SOURCEISH = re.compile(r"[_#^]|lt\.eq|gt\.eq|dot\.op|arrow\.|partial |times |operatorname")
for fam, stem, needles in PAPERS:
    if want and fam != want:
        continue
    hits = []
    for cand in (d for d in os.listdir(os.path.join(ROOT, "typst"))
                 if d.startswith(stem[:40])):
        pdf = os.path.join(ROOT, "typst", cand, "main.pdf")
        if not os.path.exists(pdf):
            hits.append(("NO PDF", 0, ""))
            continue
        doc = pymupdf.open(pdf)
        for pno in range(doc.page_count):
            for line in doc[pno].get_text().splitlines():
                if any(n in line for n in needles) and (SOURCEISH.search(line)
                                                        or len(line.strip()) < 60):
                    hits.append((cand[:30], pno + 1, line.strip()[:100]))
        doc.close()
    print("\n== %s  %s  needles=%s" % (fam, stem[:52], needles))
    for where, page, line in hits[:12]:
        print("   %-32s p%-3s %s" % (where, page, re.sub(r"\s+", " ", line)))
    if not hits:
        print("   (no line carries any needle)")
