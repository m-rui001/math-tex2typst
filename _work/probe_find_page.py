"""Find the page a string lands on, then screenshot it (fitz search over one paper's PDF)."""
import io
import pathlib
import sys

import fitz

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
pdf, needle = sys.argv[1], sys.argv[2]
doc = fitz.open(str(ROOT / "typst" / pdf / "main.pdf"))
for i, page in enumerate(doc, start=1):
    text = page.get_text().replace("\n", " ")
    if needle in text:
        print("page %d: %s" % (i, text[max(0, text.find(needle) - 90):text.find(needle) + 90]))
doc.close()
