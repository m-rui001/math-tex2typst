"""Find and shoot the page carrying a given caption fragment of a paper."""
import io
import pathlib
import sys

import fitz

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
prefix, needle = sys.argv[1], sys.argv[2]
d = [p for p in (ROOT / "typst").iterdir() if p.is_dir() and p.name.startswith(prefix)][0]
doc = fitz.open(str(d / "main.pdf"))
for n, page in enumerate(doc):
    if needle in page.get_text().replace("\n", " "):
        out = ROOT / "_work" / "shot" / ("%s-p%d.png" % (d.name[:44], n + 1))
        page.get_pixmap(dpi=130).save(str(out))
        print("page %d -> %s" % (n + 1, out))
        break
else:
    print("not found in %d pages" % doc.page_count)
doc.close()
