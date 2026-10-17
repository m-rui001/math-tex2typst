r"""Does Typst's `box` treat a declared `height:` as a minimum, like pgf does?

#61 is the 54 statements that put `rounded corners` on a node whose size the author wrote down.
Those nodes go through CeTz's `content(range, body, frame: "rect")`, and the frame is a hardcoded
line-strip in the package (`src/draw/shapes.typ:1248`) with no place for a `radius:`.  The one
alternative spelling is Typst's own `#box(width:, height:, radius:, inset:)` -- but only if it keeps
the two behaviours the range path already has: the declared measure must be a MINIMUM (pgf grows the
frame around a tall label; `_work/probe_sized_frame_geometry.py` measured CeTz doing the same,
1.000cm -> 1.091cm when the body wrapped), and the words must sit mid-height.

This prints, for each case, the rectangle Typst actually stroked and where the ink landed, in pt.
"""
import os
import subprocess
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SCRATCH = os.path.join(ROOT, "_work", "_sized")

BODY = "#set page(width: 12cm, height: 8cm, margin: 1cm)\n"

CASES = [
    ("short fits 2x1",
     '#box(width: 2cm, height: 1cm, inset: 0pt, stroke: 1pt + black)[A]'),
    ("tall overflows 2x1",
     '#box(width: 2cm, height: 1cm, inset: 0pt, stroke: 1pt + black)'
     '[A#parbreak()B#parbreak()C]'),
    ("wide overflows h=1cm w=1cm",
     '#box(width: 1cm, height: 1cm, inset: 0pt, stroke: 1pt + black)'
     '[#set text(size: 10pt); some long words that need room]'),
    ("radius on sized box",
     '#box(width: 2cm, height: 1cm, inset: 0pt, radius: 8pt, stroke: 1pt + black)[A]'),
    ("no height declared",
     '#box(width: 2cm, inset: 0pt, stroke: 1pt + black)[A#parbreak()B]'),
]


def render(src):
    os.makedirs(SCRATCH, exist_ok=True)
    typ = os.path.join(SCRATCH, "c.typ")
    pdf = os.path.join(SCRATCH, "c.pdf")
    with open(typ, "w", encoding="utf-8") as f:
        f.write(src)
    # typst leaves its previous output in place when the compile fails.
    if os.path.exists(pdf):
        os.remove(pdf)
    got = subprocess.run(["typst", "compile", typ, pdf], capture_output=True)
    if not os.path.exists(pdf):
        return None, got.stderr.decode("utf-8", "replace")
    doc = fitz.open(pdf)
    page = doc[0]
    rects, curves = [], 0
    for d in page.get_drawings():
        r = d["rect"]
        if d["items"] and d["items"][0][0] == "re":
            rects.append(r)
        if any(item[0] == "c" for item in d["items"]):
            curves += 1
    ink = [b for b in page.get_text("blocks") if b[6] == 0]
    doc.close()
    return (rects, curves, ink), None


def main():
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    for label, box in CASES:
        got, err = render(BODY + box + "\n")
        if got is None:
            print("== %s  COMPILE FAILED\n%s" % (label, err))
            continue
        rects, curves, ink = got
        if not rects:
            print("== %s  no rectangle drawn" % label)
            continue
        r = rects[0]
        print("== %s  curved items %d" % (label, curves))
        print("     box rect %.4f x %.4f cm" % (r.width / 28.346, r.height / 28.346))
        if ink:
            b = ink[0]
            top, bot = b[1], b[3]
            print("     ink band %.4f..%.4f cm  mid %.4f  box mid %.4f  offset %+.4f cm"
                  % (top / 28.346, bot / 28.346, (top + bot) / 2 / 28.346,
                     (r.y0 + r.y1) / 2 / 28.346,
                     ((top + bot) / 2 - (r.y0 + r.y1) / 2) / 28.346))


if __name__ == "__main__":
    main()
