r"""Does Typst spend a per-axis `inset:` the way pgf spends `inner xsep` / `inner ysep`?

The padding fix (#46) reads the node's own `inner sep`; pgf spells the same gap per axis with
`inner xsep` and `inner ysep` (16 + 11 declarations over 11 papers, `_work/flat`). A Typst `box`
takes `inset:` as a length or as a dictionary, so the question the fix turns on is measured here on
both axes: is `inset: (x: A, y: B)` spent A on the left and right and B above and below, does a mixed
pair (an absolute axis with the `0.3333em` default on the other) still compile, and what does an
`inset:` that only names one axis leave the other at?

Each case compiles as its own page; fitz reads the stroked rectangle's width and height and the four
gaps from its edges to the first/last glyph. A case Typst refuses prints `refused` with the error's
first line.
"""
import os
import re
import subprocess
import sys
import tempfile

import fitz

sys.stdout.reconfigure(errors="replace")

STROKE = 'stroke: (thickness: 0.4pt), '
BODY = '[ab]'
CASES = [
    ("plain-7pt", 'inset: 7pt'),
    ("axis-x7y6", 'inset: (x: 7pt, y: 6pt)'),
    ("axis-x7-default-em", 'inset: (x: 7pt, y: 0.3333em)'),
    ("axis-only-x", 'inset: (x: 7pt)'),
    ("axis-lrtb", 'inset: (left: 7pt, right: 7pt, top: 6pt, bottom: 6pt)'),
    ("no-inset", ''),
]
GRAMMAR = re.compile(r"[^a-z]")


def measure(page):
    rects = [p["rect"] for p in page.get_drawings()
             if p["rect"].width > 4 and p["rect"].height > 3]
    if not rects:
        return None
    rect = max(rects, key=lambda r: r.width * r.height)
    words = [w for w in page.get_text("words")
             if w[0] >= rect.x0 - 1 and w[2] <= rect.x1 + 1]
    if not words:
        return (rect.width, rect.height, None, None, None, None)
    return (rect.width, rect.height,
            min(w[0] for w in words) - rect.x0, rect.x1 - max(w[2] for w in words),
            min(w[1] for w in words) - rect.y0, rect.y1 - max(w[3] for w in words))


def main():
    with tempfile.TemporaryDirectory() as tmp:
        pages = []
        for name, inset in CASES:
            body = '#box(' + STROKE + (inset + ', ' if inset else '') + BODY + ')'
            src = os.path.join(tmp, name + ".typ")
            out = os.path.join(tmp, name + ".pdf")
            open(src, "w", encoding="utf-8").write(
                "#set page(width: 12cm, height: 6cm, margin: 1cm)\n"
                "#set text(size: 10pt)\n" + body + "\n")
            r = subprocess.run(["typst", "compile", src, out], capture_output=True)
            if r.returncode:
                err = (r.stderr or b"").decode("utf-8", "replace")
                first = next((l for l in err.splitlines() if "error" in l), "(no output)")
                print("%-22s REFUSED: %s" % (name, first[:110]))
                continue
            pages.append((name, out))
        print("%-22s %7s %7s %7s %7s %7s %7s" % ("case", "w/pt", "h/pt", "L", "R", "T", "B"))
        for name, out in pages:
            doc = fitz.open(out)
            got = measure(doc[0])
            doc.close()
            if got is None:
                print("%-22s  (no frame)" % name)
                continue
            fmt = lambda v: "%7.3f" % v if v is not None else "    n/a"
            print("%-22s %s" % (name, " ".join(fmt(v) for v in got)))


if __name__ == "__main__":
    main()
