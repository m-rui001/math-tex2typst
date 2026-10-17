"""Print the page index of the first page whose text contains a needle."""
import sys
import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

pdf, needles = sys.argv[1], sys.argv[2].split("|")
doc = fitz.open(pdf)
try:
    for i, page in enumerate(doc):
        text = page.get_text()
        hit = [n for n in needles if n in text]
        if hit:
            print("page %d (1-based) %s" % (i + 1, hit))
finally:
    doc.close()
