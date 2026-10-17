r"""Which pages of a regenerated paper carry a drawing, so the eye can be pointed at them.

A converted figure is a CeTz canvas, and a canvas is dozens of small vector paths on one page while
prose math is a handful; the page with the most drawings is the page the picture landed on. Takes
paper dir prefixes and prints (page, drawing count) for every page above the cut.
"""
import io
import pathlib
import sys

import fitz

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
SHOT = ROOT / "_work" / "shot"
SHOT.mkdir(exist_ok=True)

for prefix in sys.argv[1:]:
    dirs = [d for d in (ROOT / "typst").iterdir() if d.is_dir() and d.name.startswith(prefix)]
    if not dirs:
        print("no paper dir for %s" % prefix)
        continue
    doc = fitz.open(str(dirs[0] / "main.pdf"))
    pages = [(i + 1, len(doc[i].get_drawings())) for i in range(doc.page_count)]
    heavy = [(p, n) for p, n in pages if n > 15]
    print("%s: %s" % (dirs[0].name[:50], heavy[:8]))
    for p, _n in heavy[:2]:
        out = SHOT / ("%s-p%d.png" % (dirs[0].name[:44], p))
        doc[p - 1].get_pixmap(dpi=130).save(str(out))
        print("   %s" % out)
    doc.close()
