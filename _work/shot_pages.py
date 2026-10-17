r"""Render given pages of a paper's main.pdf to PNGs in _work/shot.

usage: python _work/shot_pages.py <paper-dir-prefix> <page> [page ...]
"""
import io
import pathlib
import sys

import fitz

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
SHOT = ROOT / "_work" / "shot"
SHOT.mkdir(exist_ok=True)

prefix = sys.argv[1]
pages = [int(p) for p in sys.argv[2:]]
dirs = [d for d in (ROOT / "typst").iterdir() if d.is_dir() and d.name.startswith(prefix)]
if not dirs:
    raise SystemExit("no paper dir for %s" % prefix)
name = dirs[0].name
doc = fitz.open(str(dirs[0] / "main.pdf"))
for p in pages:
    pix = doc[p - 1].get_pixmap(dpi=130)
    out = SHOT / ("%s-p%d.png" % (name[:44], p))
    pix.save(str(out))
    print(out)
doc.close()
