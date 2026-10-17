r"""#89: the same corner, pgf's page and ours, at 600 dpi.

The 300 dpi crops of the SLE corridor still look bitten at the inner edge of a corner after the run went
into one `merge-path`, while the isolated 12pt corner in `measure89d` looked clean -- so the two pages
are cropped around the SAME corner point at a zoom where a 6pt pen radius is 100 pixels. The control is
the statement verbatim (its own `scope[scale=.88]`, `line width=12pt`, `rounded corners=12pt`); ours is
the regenerated product page, and the corner is found by the arc whose tangent distance is 12pt.
"""
import io
import math
import os
import re
import subprocess
import sys
import tempfile

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz, macros, prep  # noqa: E402

BP_PT = 0.99651
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
PAPER = "An-explicit-exact-Hausdorff-gauge-for-SLE-September-26-2026"
STMT = (r"\draw[blue!12,line width=12pt,rounded corners=12pt]"
        "(3,.6)--(3,2.4)--(2.4,3.15)--(-2.4,3.15)--(-3.15,2.4)"
        "--(-3.15,-2.4)--(-2.4,-3.15)--(2.4,-3.15)--(2.55,-2.25)--(2.55,0)--(3.55,0);")

tmp = tempfile.mkdtemp(prefix="m89e_")
src = ("\\documentclass[10pt]{article}\n\\usepackage[margin=15mm]{geometry}\n"
       "\\usepackage{tikz}\n\\begin{document}\n\\pagestyle{empty}\n"
       "\\begin{tikzpicture}[x=1cm,y=1cm,font=\\small,line cap=round,line join=round]\n"
       "\\begin{scope}[shift={(3.35,6.2)},scale=.88]\n" + STMT + "\n\\end{scope}\n"
       "\\end{tikzpicture}\n\\end{document}\n")
io.open(os.path.join(tmp, "c.tex"), "w", encoding="utf-8").write(src)
r = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error",
                    "-output-directory", tmp, "c.tex"], cwd=tmp, capture_output=True,
                   text=True, encoding="utf-8", errors="replace")
ctrl = os.path.join(tmp, "c.pdf")
if not os.path.exists(ctrl):
    print((r.stdout or "")[-1200:])
    sys.exit(1)


def corners(page, want):
    """(corner, tangent distances) for every arc whose cut measures `want` page points."""
    got = []
    for d in page.get_drawings():
        items = [i for i in d["items"] if i[0] in ("l", "c")]
        k = 0
        while k < len(items):
            if items[k][0] != "c":
                k += 1
                continue
            start = (items[k][1].x, items[k][1].y)
            stop = (items[k][4].x, items[k][4].y)
            j = k + 1
            while j < len(items) and items[j][0] == "c" and math.hypot(
                    items[j][1].x - stop[0], items[j][1].y - stop[1]) < 0.05:
                stop = (items[j][4].x, items[j][4].y)
                j += 1
            prev = next_ = None
            for m in range(k - 1, -1, -1):
                if items[m][0] != "l":
                    break
                if math.hypot(items[m][2].x - items[m][1].x,
                              items[m][2].y - items[m][1].y) > 0.05:
                    prev = items[m]
                    break
            for m in range(j, len(items)):
                if items[m][0] != "l":
                    break
                if math.hypot(items[m][2].x - items[m][1].x,
                              items[m][2].y - items[m][1].y) > 0.05:
                    next_ = items[m]
                    break
            if prev is not None and next_ is not None:
                x1, y1, x2, y2 = prev[1].x, prev[1].y, prev[2].x, prev[2].y
                x3, y3, x4, y4 = next_[1].x, next_[1].y, next_[2].x, next_[2].y
                den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
                if abs(den) > 1e-6:
                    px = ((x1 * y2 - y1 * x2) * (x3 - x4) -
                          (x1 - x2) * (x3 * y4 - y3 * x4)) / den
                    py = ((x1 * y2 - y1 * x2) * (y3 - y4) -
                          (y1 - y2) * (x3 * y4 - y3 * x4)) / den
                    d0 = math.hypot(start[0] - px, start[1] - py) / BP_PT
                    d1 = math.hypot(stop[0] - px, stop[1] - py) / BP_PT
                    if abs(d0 - want) < 0.5:
                        got.append(((px, py), [round(d0, 2), round(d1, 2)]))
            k = j
    return got


def shoot(page, corner, name, half=22.0):
    rect = fitz.Rect(corner[0] - half, corner[1] - half, corner[0] + half, corner[1] + half)
    out = os.path.join(ROOT, "_work", name)
    page.get_pixmap(dpi=600, clip=rect).save(out)
    return name


doc = fitz.open(ctrl)
ours = fitz.open(os.path.join(ROOT, "typst", PAPER, "main.pdf"))
cpage = doc[0]
opage = ours[20]
cc = corners(cpage, 12.0)
oc = corners(opage, 12.0)
print("control corners=%d %s" % (len(cc), [c[1] for c in cc]))
print("product corners=%d %s" % (len(oc), [c[1] for c in oc]))
if cc:
    print("-> %s" % shoot(cpage, cc[0][0], "corner89e_control.png"))
if oc:
    print("-> %s" % shoot(opage, oc[0][0], "corner89e_product.png"))
    print("-> %s" % shoot(opage, oc[-1][0], "corner89e_product_last.png"))
print("tmp=%s" % tmp)
