r"""Read the page that A-spectral-gap's figure 1 lands on, before and after the parbox rewrite.

The rewrite reaches `main.typ` as `#figure([table(columns: 2, table.cell(…))])`, and a function call
only evaluates inside a content block when it is spelled `#table(` -- without the hash Typst prints the
name as words.  So compiling is not the test; the test is what the page says.  Print, for the product
we have now and for the rewritten one, every line of the figure's page that carries the words the
figure is made of: `table`, `columns:`, `colspan`, the five cell headings, and the leaked LaTeX
spelling the old page showed (`\@c`, `\&`).
"""
import os
import sys

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
STEM = ("A-spectral-gap-throughout-the-high-temperature-"
        "Sherrington-Kirkpatrick-phase-September-24-2026")
NEEDLES = ["table(", "columns:", "colspan", "Ordinary rarity", "Weighted-mean estimate",
           "Variance on bad paths", "Directional covariance", "Total remaining variance",
           "\\@c", "\\&", "@c"]


def show(label, pdf):
    if not os.path.exists(pdf):
        print("%s: (no pdf) %s" % (label, pdf))
        return
    doc = fitz.open(pdf)
    hits = []
    for pno in range(len(doc)):
        text = doc[pno].get_text()
        if "Variance retention" in text or "table(" in text:
            for line in text.splitlines():
                if any(n in line for n in NEEDLES):
                    hits.append("p%d: %s" % (pno + 1, line.strip()[:78]))
    doc.close()
    print("=== %s ===" % label)
    for h in hits:
        print("  " + h)


def main():
    show("old (shipped product)", os.path.join(ROOT, "typst", STEM, "main.pdf"))
    show("new (parbox rewrite)", os.path.join(ROOT, "_work", "_pb_new", STEM, "out.pdf"))


if __name__ == "__main__":
    main()
