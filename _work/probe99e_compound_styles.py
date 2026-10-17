r"""#99e: does `compound-path` ignore the styles its sub-shapes carry?

`translate_path` builds each sub-shape string with its own `, fill: C, stroke: none` tail already
inside the call (`_style` at cetz.py:3589, applied at the `circle` site 3963 and the `rect` sites
4134/4137). If the grouping into one `compound-path` keeps those tails harmless -- CeTz reads only the
sub-paths' `segments` and paints with the compound's own style -- the fix is one emission site plus the
option reader. If the sub-shapes still paint themselves, the tails have to be suppressed per site and
the change is three times as wide.

Two pages of the circle annulus decide it: sub-shapes bare, and sub-shapes carrying the very tail the
emitter writes today. A punched hole reads at paper, a painted one at the fill.

  python _work/probe99e_compound_styles.py
"""
import io
import os
import subprocess
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DIR = os.path.join(ROOT, "_work", "m99d-annulus")
OUT = os.path.join(ROOT, "label99e_compound_styles.txt")
PAINT = "#d1d1d1"

CASES = {
    "bare subs": ("compound-path({circle((0, 0), radius: 1.19); circle((0, 0), radius: 0.68)}, "
                  "fill: rgb(\"%s\"), fill-rule: \"even-odd\", stroke: none)" % PAINT),
    "subs carry fill": ("compound-path({circle((0, 0), radius: 1.19, fill: rgb(\"%s\"), stroke: none); "
                        "circle((0, 0), radius: 0.68, fill: rgb(\"%s\"), stroke: none)}, "
                        "fill: rgb(\"%s\"), fill-rule: \"even-odd\", stroke: none)"
                        % (PAINT, PAINT, PAINT)),
    "inner sub white": ("compound-path({circle((0, 0), radius: 1.19, fill: rgb(\"%s\"), stroke: none); "
                        "circle((0, 0), radius: 0.68, fill: white, stroke: none)}, "
                        "fill: rgb(\"%s\"), fill-rule: \"even-odd\", stroke: none)" % (PAINT, PAINT)),
}
DPI = 600


def main():
    if not os.path.isdir(DIR):
        os.makedirs(DIR)
    typ = "#import \"@preview/cetz:0.5.0\"\n" + "".join(
        "#page(width: 12cm, height: 10cm, margin: 2cm)[#cetz.canvas({\n"
        "import cetz.draw: *\n%s\n})]\n" % body for body in CASES.values())
    io.open(os.path.join(DIR, "substyles.typ"), "w", encoding="utf-8", newline="").write(typ)
    r = subprocess.run("typst compile substyles.typ substyles.pdf", cwd=DIR, capture_output=True,
                       text=True, shell=True, encoding="utf-8", errors="replace")
    lines = ["rc=%d" % r.returncode]
    if not os.path.isfile(os.path.join(DIR, "substyles.pdf")):
        lines.append(((r.stdout or "") + (r.stderr or ""))[-800:])
    else:
        doc = fitz.open(os.path.join(DIR, "substyles.pdf"))
        for pno, name in enumerate(CASES):
            page = doc[pno]
            fills = [d for d in page.get_drawings() if d.get("fill") is not None]
            if not fills:
                lines.append("%-18s filled drawings=0" % name)
                continue
            box = max(fills, key=lambda d: d["rect"].get_area())["rect"]
            cx, cy = (box.x0 + box.x1) / 2.0, (box.y0 + box.y1) / 2.0
            scale = box.width / (2.0 * 1.19)
            pix = page.get_pixmap(dpi=DPI)

            def at(x_pt, y_pt):
                ix, iy = int(round(x_pt * DPI / 72.0)), int(round(y_pt * DPI / 72.0))
                return None if not (0 <= ix < pix.width and 0 <= iy < pix.height) else pix.pixel(ix, iy)

            lines.append("%-18s fills=%d hole=%s band=%s"
                         % (name, len(fills), at(cx, cy), at(cx + 0.935 * scale, cy)))
        doc.close()
    text = "\n".join(lines) + "\n"
    io.open(os.path.join(ROOT, "_work", OUT.split(os.sep)[-1]), "w", encoding="utf-8").write(text)
    print(text)
    return 0


if __name__ == "__main__":
    main()
