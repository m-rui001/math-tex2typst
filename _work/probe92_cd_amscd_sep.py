r"""What separation does amscd's own `CD` put between its cells, at 11pt?

`xy_to_tikzcd` hands a converted `CD` diagram to `build_cd` with `[column sep=large,row sep=large]`,
a choice made against the old layout law, which read a separation as a centre distance.  Since
`_work/probe90_cd_sep_law.py` says tikz-cd's `column sep`/`row sep` are the edge-to-edge gap between
the two cell boxes, that head now places cells at `large + (box[a] + box[b])/2`, and the corpus's six
`CD` canvases move with it.  So the number the CD translation should write is whichever tikz-cd
separation reproduces amscd's own spacing -- which needs amscd measured.

One row of two cells, once with one letter each and once with ten, and the same pair stacked.  The
`CD` arrow is drawn by stretching its shaft to fill the space between the columns, so a word-level
read cannot tell where the arrow ends and the second cell begins; this walks the page's CHARACTERS
and groups them by which cell's alphabet they belong to, leaving the shaft's `-.=|>` glyphs as the
arrow's own ink.

  python _work/probe92_cd_amscd_sep.py
"""
import os
import subprocess
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TMP = os.path.join(ROOT, "_work", "_m92")

# amscd's `CD` is a maths environment -- write it bare and TeX reports `Missing $ inserted`
DOC = ("\\documentclass[11pt,border=6pt]{standalone}\n\\usepackage{amscd}\n\\begin{document}\n"
       "\\[\n%s\n\\]\n\\end{document}\n")
HORIZ = "\\begin{CD} %s @>>> %s \\end{CD}"
VERT = "\\begin{CD} %s \\\\ %s \\end{CD}"
NARROW = ("A", "B")
WIDE = ("ABCDEFGHIJ", "KLMNOPQR")
STEPS = {"tiny": 1, "small": 2, "scriptsize": 3, "normal": 4, "large": 6, "huge": 8}
ARROW = set("-=.|>~")


def chars(pdf):
    """(box, character) for every glyph the page carries, read one level below the words."""
    doc = fitz.open(pdf)
    got = []
    for block in doc[0].get_text("rawdict")["blocks"]:
        for line in block.get("lines", []):
            for span in line["spans"]:
                for ch in span["chars"]:
                    text = ch["c"]
                    if text.strip():
                        got.append((fitz.Rect(ch["bbox"]), text))
    doc.close()
    return got


def read(name, src, left, right):
    os.makedirs(TMP, exist_ok=True)
    tex = os.path.join(TMP, name + ".tex")
    open(tex, "w", encoding="utf-8").write(DOC % src)
    subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", TMP, tex],
                   capture_output=True, cwd=TMP, text=True, errors="replace")
    pdf = os.path.join(TMP, name + ".pdf")
    if not os.path.exists(pdf):
        return None
    got = chars(pdf)

    def group(alphabet):
        sel = [box for box, text in got if set(text) <= set(alphabet)]
        if not sel:
            return None
        return fitz.Rect(min(b.x0 for b in sel), min(b.y0 for b in sel),
                         max(b.x1 for b in sel), max(b.y1 for b in sel))

    a, b = group(left), group(right)
    if not a or not b:
        return None
    shaft = [box for box, text in got
             if set(text) <= ARROW and box.x0 > a.x1 - 1 and box.x1 < b.x0 + 1]
    centre = ((b.x0 + b.x1) / 2 - (a.x0 + a.x1) / 2) if kind_of(name) == "column" \
        else ((b.y0 + b.y1) / 2 - (a.y0 + a.y1) / 2)
    gap = (b.x0 - a.x1) if kind_of(name) == "column" else (b.y0 - a.y1)
    return (round(centre, 2), round(gap, 2), round(a.width, 2), round(b.width, 2),
            round(a.height, 2), round(sum(s.width for s in shaft), 2))


def kind_of(name):
    return name.split("-")[0]


def main():
    for kind, form in (("column", HORIZ), ("row", VERT)):
        print("--- %s ---" % kind)
        for left, right in (NARROW, WIDE):
            got = read("%s-%s" % (kind, left), form % (left, right), left, right)
            if not got:
                print("  %-11s pdflatex produced nothing / cells not found" % left)
                continue
            centre, gap, wa, wb, ha, shaft = got
            print("  %-11s centre %7.2f pt = %5.3f cm   ink gap %6.2f   cell ink %.1f + %.1f"
                  "   shaft %.1f pt, cell height %.1f"
                  % (left, centre, centre / 28.3465, gap, wa, wb, shaft, ha))
    print("\nwhat build_cd gives for two one-letter cells (its box 0.672cm wide, 0.545cm tall):")
    for kind, base in (("column", 0.231), ("row", 0.174)):
        line = "  %-7s" % kind
        for name in sorted(STEPS, key=STEPS.get):
            line += "  %s %5.2fpt" % (name, (base * STEPS[name] + 0.672) * 28.3465)
        print(line)
    return 0


if __name__ == "__main__":
    sys.exit(main())
