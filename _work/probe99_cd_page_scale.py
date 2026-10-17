r"""Does a canvas coordinate land where the gauge's page puts the ink?

`probe98` read two identical 97pt-wide cell bodies, declared 4.255cm apart, as 105.1pt of ink-centre
distance.  4.255cm at the page's own scale is 120.6pt, so either the page shrinks the drawing or the
ink of a wide maths body does not sit where its `content()` point says.

`probe99` settled the scale question with three symmetric `$M$` cells: 5cm of centres measured
141.73pt and 2cm measured 56.69pt -- exactly 28.35pt per cm, no squeeze.  What is left is placement:
Typst centres a box on the anchor, so a cell's ink centre should be its coordinate, whatever the
width.  This reads that directly on a real diagram -- `The-height-three-chromatic-overlap…#1`, the
canvas whose rebuilt version collides while the author's pdflatex page does not.

Every `content()` line of the rebuilt canvas is paired with the words that landed near it, so a cell
whose ink sits off its anchor by more than a few points shows up as its own row.  The one number that
matters is the ink-centre distance of the two 97pt cells against the 4.255cm their anchors declare.

  python _work/probe99_cd_page_scale.py
  python _work/probe99_cd_page_scale.py real
"""
import os
import re
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
sys.path.insert(0, WORK)
sys.path.insert(0, os.path.join(ROOT, "tools"))
import probe81_label_box_face as g  # noqa: E402
from t2t import cetz  # noqa: E402

CANVAS = ('#cetz.canvas({\n  import cetz.draw: *\n'
          '  content((0, 0), [$M$])\n  content((5, 0), [$M$])\n'
          '  content((0, -2), [$M$])\n})')

STEM = "The-height-three-chromatic-overlap"
ANCHOR = re.compile(r"content\(\((-?[\d.]+), (-?[\d.]+)\)")
CM = 28.346456692913385  # a centimetre in points, the unit the gauge page uses


def main():
    page = g.HEAD + (g.PAGE if "#set text" in g.PAGE else g.PAGE + "#set text(size: 11pt)\n")
    got = g.render(CANVAS, "99", page)
    if not got:
        print("the gauge would not compile the synthetic canvas")
        return 1
    doc = fitz.open(got[2])
    words = [(w[0], w[1], w[2], w[3], w[4]) for w in doc[0].get_text("words")]
    doc.close()
    for x0, y0, x1, y1, text in words:
        print("  %-6r x %.2f..%.2f  y %.2f..%.2f" % (text, x0, x1, y0, y1))
    if len(words) < 3:
        print("expected three words, got %d" % len(words))
        return 1
    row = [w for w in words if abs(w[1] - words[0][1]) < 1]
    col = [w for w in words if abs(w[0] - words[0][0]) < 1]
    dx = (max(w[2] for w in row) - min(w[0] for w in row)) - (row[0][2] - row[0][0])
    dy = (max(w[3] for w in col) - min(w[1] for w in col)) - (col[0][3] - col[0][1])
    print("\n5cm of centres -> %.2fpt = %.2f pt/cm" % (dx, dx / 5))
    print("2cm of centres -> %.2fpt = %.2f pt/cm" % (dy, dy / 2))
    return 0


def rebuilt():
    """The canvas under test, from the flat source the batch itself reads."""
    import glob
    matches = glob.glob(os.path.join(WORK, "flat", STEM + "*.tex"))
    if not matches:
        raise SystemExit("no flat source for %s" % STEM)
    src = open(matches[0], encoding="utf-8", errors="replace").read()
    # the picture index is over every picture in the source, the way the census keys canvases
    pics = [cetz.strip_envelope(m.group(0)) for m in cetz.PICTURE_ENV.finditer(src)]
    return pics[1], cetz.build_cd(pics[1])


CD = re.compile(r"\\begin\{(tikzcd|CD)\}")


def real():
    pic, canvas = rebuilt()
    if not canvas:
        raise SystemExit("the diagram is refused")
    print(canvas)
    page = g.HEAD + (g.PAGE if "#set text" in g.PAGE else g.PAGE + "#set text(size: 11pt)\n")
    got = g.render(canvas, "99b", page)
    if not got:
        print("the rebuilt canvas would not compile")
        return 1
    doc = fitz.open(got[2])
    words = [(w[0], w[1], w[2], w[3], w[4]) for w in doc[0].get_text("words")]
    doc.close()
    print("\n%d words on the page" % len(words))
    anchors = ANCHOR.findall(canvas)
    print("anchors declared: %s" % " ".join("(%s, %s)" % a for a in anchors))
    for x0, y0, x1, y1, text in sorted(words, key=lambda w: (w[1], w[0])):
        print("  %-24r x %.2f..%.2f  y %.2f..%.2f  centre %.2f"
              % (text[:24], x0, x1, y0, y1, (x0 + x1) / 2))
    wide = [w for w in words if w[2] - w[0] > 40]
    if len(wide) >= 2:
        a, b = sorted(wide, key=lambda w: w[0])[:2]
        gap = b[0] - a[2]
        print("\nthe two widest words: ink gap %.2fpt = %.3fcm" % (gap, gap / CM))
    return 0


if __name__ == "__main__":
    sys.exit(real() if "real" in sys.argv else main())
