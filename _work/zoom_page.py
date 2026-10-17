r"""Raster one rectangle of one generated page, at a dpi chosen by hand.

`clip_figure` grows a needle into a figure; sometimes the question is about a two-millimetre detail --
here whether a `fill=white` label node really interrupts the line it sits on, which a whole-page
raster at 170 dpi cannot answer. Rectangles come from the page's own coordinates, so the tool that
found the figure's box is the tool that zooms it.
"""
import pathlib
import sys

import pymupdf

ROOT = pathlib.Path(__file__).resolve().parents[1]
STEM = sys.argv[1]
PAGE = int(sys.argv[2]) - 1
X0, Y0, X1, Y1 = (float(a) for a in sys.argv[3].split(","))
DPI = int(sys.argv[4]) if len(sys.argv) > 4 else 400
TAG = sys.argv[5] if len(sys.argv) > 5 else "zoom"

doc = pymupdf.open(str(ROOT / "typst" / STEM / "main.pdf"))
page = doc[PAGE]
rect = pymupdf.Rect(X0, Y0, X1, Y1) & page.rect
out = ROOT / "_work" / ("zoom_%s.png" % TAG)
pix = page.get_pixmap(dpi=DPI, clip=rect)
pix.save(str(out))
print("%s p%d %s -> %s (%dx%d px)" % (STEM[:30], PAGE + 1, rect, out.name, pix.width, pix.height))
doc.close()
