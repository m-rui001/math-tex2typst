r"""#99g: the fix read through the emitter -- does the hole come out punched?

probe99d proved the page shapes (pgf punches, two filled `circle`s paint, `compound-path` punches).
This is the same three samples with the product side built by `cetz` itself, so what is read on the
page is the emission the batch will ship, not a hand-written approximation of it.

  python _work/probe99g_fix_pages.py            # -> _work/label99g_fix_pages.txt
"""
import io
import os
import subprocess
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DIR = os.path.join(ROOT, "_work", "m99d-annulus")
OUT = os.path.join(ROOT, "_work", "label99g_fix_pages.txt")
sys.path.insert(0, os.path.join(ROOT, "tools"))
B = chr(92)

from t2t import cetz  # noqa: E402

# the authors' own statements, each wrapped in a picture of its own
CASES = [
    ("circles 1.19/0.68", 1.19, 0.68,
     B + "fill[black!18,even odd rule] (2.20,-4.62) circle (1.19cm) (2.20,-4.62) circle (0.68cm);"),
    ("rects 3/2.15", 3.0, 2.15,
     B + "fill[blue!10,even odd rule] (-3,-3) rectangle (3,3) (-2.15,-2.15) rectangle (2.15,2.15);"),
    ("ellipse 3&2/2.70&1.5133", 3.0, 2.70,
     B + "fill[cyan!9,even odd rule] (0,0) ellipse (3 and 2) (0,0) ellipse (2.70 and 1.5133);"),
    ("no rule (control emit)", 1.19, 0.68,
     B + "fill[black!18] (2.20,-4.62) circle (1.19cm);"),
    ("single subpath", 1.19, 1.19,
     B + "fill[black!18,even odd rule] (2.20,-4.62) circle (1.19cm);"),
]
DPI = 600


def main():
    if not os.path.isdir(DIR):
        os.makedirs(DIR)
    lines = ["== what the emitter ships for each statement"]
    pages = []
    for name, outer, inner, stmt in CASES:
        pic = B + "begin{tikzpicture}" + stmt + B + "end{tikzpicture}"
        canvas = cetz.build(pic)
        lines.append("\n%s\n  %s" % (name, (canvas or "REFUSED").replace("\n", "\n  ")[:600]))
        pages.append((name, outer, inner, canvas))

    typ = "#import \"@preview/cetz:0.5.0\"\n"
    drawn = []
    for name, outer, inner, canvas in pages:
        if not canvas:
            lines.append("\n%s: no page (refused)" % name)
            continue
        # the pictures sit at different origins, so re-centre by putting each on its own page
        typ += "#page(width: 14cm, height: 12cm, margin: 2cm)[%s]\n" % canvas
        drawn.append((name, outer, inner))
    io.open(os.path.join(DIR, "emitter.typ"), "w", encoding="utf-8", newline="").write(typ)
    r = subprocess.run("typst compile emitter.typ emitter.pdf", cwd=DIR, capture_output=True,
                       text=True, shell=True, encoding="utf-8", errors="replace")
    lines.append("\ntypst rc=%d" % r.returncode)
    if r.returncode:
        lines.append(((r.stdout or "") + (r.stderr or ""))[-900:])
        text = "\n".join(lines) + "\n"
        io.open(OUT, "w", encoding="utf-8").write(text)
        print(text)
        return 1
    doc = fitz.open(os.path.join(DIR, "emitter.pdf"))
    lines.append("== page samples (hole = centre of the outer drawing's box)")
    for pno, (name, outer, inner) in enumerate(drawn):
        page = doc[pno]
        fills = [d for d in page.get_drawings() if d.get("fill") is not None]
        if not fills:
            lines.append("   %-26s fills=0" % name)
            continue
        box = max(fills, key=lambda d: d["rect"].get_area())["rect"]
        cx, cy = (box.x0 + box.x1) / 2.0, (box.y0 + box.y1) / 2.0
        scale = box.width / (2.0 * outer)
        mid = (outer + inner) / 2.0
        pix = page.get_pixmap(dpi=DPI)

        def at(x_pt, y_pt):
            ix, iy = int(round(x_pt * DPI / 72.0)), int(round(y_pt * DPI / 72.0))
            return None if not (0 <= ix < pix.width and 0 <= iy < pix.height) else pix.pixel(ix, iy)

        lines.append("   %-26s fills=%d hole=%s band=%s"
                     % (name, len(fills), at(cx, cy), at(cx + mid * scale, cy)))
    doc.close()
    text = "\n".join(lines) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(text)
    print(text[-2500:])
    return 0


if __name__ == "__main__":
    sys.exit(main())
