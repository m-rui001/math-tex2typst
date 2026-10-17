r"""How far below a `content()` anchor does a label's ink actually hang, at the size papers ship?

`cd_label_off` clears an arrow by ``CD_LABEL_GAP + half of the label's own extent across the line``,
and the extent for a horizontal arrow is `CD_LABEL_H`.  What has to clear the shaft is the label's
*ink*, and the anchor Typst centres on is the middle of its line box -- so the constant is only right
if the ink is centred on that anchor.  It is not: maths hangs off the baseline, and a subscript or an
italic `f` reaches below it.  This measures, for the label bodies `build_cd` really writes, how far
the dark pixels extend above and below the anchor, by rendering each at 300 dpi and thresholding
(Typst ships text as text, so there are no glyph outlines to read off `get_drawings`).

The two numbers per label are what `CD_LABEL_H` has to cover: an offset of ``gap + down`` puts the
ink's lowest point `gap` above the shaft.
"""
import io
import os
import re
import subprocess
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace", newline="")
from t2t import cetz  # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))
TMP = os.path.join(HERE, "_m48down")
CM = 0.0352778
HEAD = ('#import "@preview/cetz:0.5.0"\n'
        '#set page(width: 20cm, height: 60cm, margin: (x: 72.3pt, y: 72.3pt))\n'
        '#set text(lang: "en", size: 11pt)\n')
CONTENT = re.compile(r"content\(\([^)]*\), \[\$([^$]*)\$\]\)")
# the shapes a CD label takes in this corpus, from the cases `measure48_cd_bend.py` measured
BODIES = ['A \\arrow[r,"f"] & B', 'A \\arrow[r,"\\pi"] & B', 'A \\arrow[r,"X_1"] & B',
          'A \\arrow[r,"a / b"] & B', 'A \\arrow[r,"group and residue duality"] & B',
          'A \\arrow[r,"ab"] & B', 'A \\arrow[r] & M_{n}(R)']


def dark_rows(pix, y_of):
    """The first and last pixel row holding ink, as cm offsets from the anchor row."""
    top, bottom = None, None
    for row in range(pix.height):
        s = pix.samples[row * pix.stride:(row + 1) * pix.stride]
        if any(c < 128 for c in s[:pix.width * pix.n]):
            if top is None:
                top = row
            bottom = row
    scale = 72 / 300 * CM
    return ((y_of - top) * scale, (bottom - y_of) * scale)  # above the anchor, below it


def main():
    seen, bodies = set(), []
    for body in BODIES:
        canvas = cetz.build_cd(cetz.strip_envelope("\\begin{tikzcd}" + body + "\\end{tikzcd}"))
        found = CONTENT.findall(canvas or "")
        if '"' not in body:
            continue  # a cell, not a label: cells are placed by `cd_columns`, not by this law
        # `build_cd` writes an arrow's labels after its line, so the last content is the label
        spell = found[-1]
        if spell not in seen:
            seen.add(spell)
            bodies.append(spell)
    spots = "\n  ".join("content((8, %.1f), [$%s$])" % (-2.0 * i, s)
                        for i, s in enumerate(bodies))
    os.makedirs(TMP, exist_ok=True)
    open(os.path.join(TMP, "down.typ"), "w", encoding="utf-8").write(
        HEAD + "#cetz.canvas({\n  import cetz.draw: *\n  " + spots + "\n})\n")
    done = subprocess.run(["typst", "compile", "--root", ROOT, "down.typ"], cwd=TMP,
                          capture_output=True, text=True, encoding="utf-8", errors="replace")
    pdf = os.path.join(TMP, "down.pdf")
    if not os.path.exists(pdf):
        raise RuntimeError("typst refused the canvas:\n" + done.stdout + done.stderr)
    doc = fitz.open(pdf)
    page = doc[0]
    # one label per row, rows 2 cm apart, so the page's text lines are the labels in order; a line's
    # box centre is the anchor Typst placed it at
    lines = sorted([fitz.Rect(l["bbox"]) for b in page.get_text("dict")["blocks"]
                    for l in b.get("lines", [])], key=lambda r: r.y0)
    print("== ink extent around the anchor a `content()` point is (11pt, 300 dpi)")
    worst_below = 0.0
    for i, spell in enumerate(bodies):
        if i >= len(lines):
            print("   %-42r no line on the page" % spell[:42])
            continue
        box = lines[i]
        band = fitz.Rect(box.x0 - 6, box.y0 - 6, box.x1 + 6, box.y1 + 6)
        above, below = dark_rows(page.get_pixmap(dpi=300, clip=band),
                                 (band.height / 2) * 300 / 72)
        worst_below = max(worst_below, below)
        print("   %-42r ink %.3f above the anchor, %.3f below   (line box %.3f tall)"
              % (spell[:42], above, below, box.height * CM))
    print("== CD_LABEL_GAP %.3f cm: the offset has to reach %.3f below the anchor, so a one-line "
          "label's height term is %.3f (now %.2f)"
          % (cetz.CD_LABEL_GAP, worst_below, 2 * worst_below, cetz.CD_LABEL_H))


if __name__ == "__main__":
    main()
