r"""Can CeTz reproduce TeX's circle for a node whose size comes from its text?

`_work/measure_circle_pair_engines.py` measured both engines on identical bodies. TeX draws a circle
whose diameter is the CIRCUMSCRIPTION of the text box PLUS `inner sep` (0.6411cm for `$k$`, 0.7709 for
`ab`, 3.1137 for a long label), and where the author declares `minimum size=9mm` the drawn diameter is
exactly 0.90cm -- the declared measure is the diameter, and a bigger text wins (the long label stayed
3.1137). CeTz's point form draws the circumscription of the bare text (0.3403 / 0.4511 / 2.9134), i.e.
the same geometric rule with the padding missing, and its range form draws the circumscription of the
range (0.45 -> 1.2758, the sqrt(2) overshoot).

So the two candidate fixes each need one number confirmed:
  * point form + `padding:` -- does the padding reach the frame at all (the style is called `padding`
    in cetz's own docs, NOT `inset`, which the earlier probe showed is ignored), and does the result
    land on TeX's 0.6411 / 0.7709?
  * range form with the half-side divided by sqrt(2) -- already 0.9030 against TeX's 0.9000, but what
    happens when the TEXT is wider than the declared box, since TeX lets the circle grow?
Every case is measured from the drawn path on the compiled page, with a 1cm ruler in the same canvas.
"""
import os
import re
import subprocess
import sys
import tempfile

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(errors="replace")

CM = 28.3465
STROKE = "stroke: (thickness: 0.4pt), fill: none"
BODIES = ["$k$", "ab", "a rather long label"]

CASES = {
    "point+pad-em": "content((0, 0), [%s], frame: \"circle\", %s, padding: 0.3333em)",
    "point+pad-2pt": "content((0, 0), [%s], frame: \"circle\", %s, padding: 2pt)",
    "point+pad-em+anchor": "content((0, 0), [%s], frame: \"circle\", %s, padding: 0.3333em,"
                           " anchor: \"center\")",
    "range-sqrt2": "content((-0.3182, -0.3182), (0.3182, 0.3182), [%s], frame: \"circle\", %s)",
    "box-em+pad": "content((0, 0), [#box(inset: 0.3333em)[%s]], frame: \"circle\", %s)",
}

# what TeX drew for the same body, from _work/measure_circle_pair_engines.py
TEX = {"$k$": 0.6411, "ab": 0.7709, "a rather long label": 3.1137}

TYP = ('#import "@preview/cetz:0.5.0"\n'
       '#set page(width: 320pt, height: 160pt)\n'
       '#cetz.canvas({\n  import cetz.draw: *\n'
       '  line((0, -4), (1, -4), stroke: (thickness: 0.1pt, paint: luma(200)))\n'
       '  %s\n})\n')


def drawn(doc):
    page = doc[0]
    unit = None
    best = None
    for d in page.get_drawings():
        r = d["rect"]
        if 20 < r.width < 60 and r.height < 1.5:
            unit = r.width
        if r.width >= 3 and r.height >= 3 and r.width < 250:
            if best is None or r.width * r.height > best.width * best.height:
                best = r
    if unit is None or best is None:
        return None
    return best.width / unit


def main():
    print("%-22s %-22s %10s %10s %8s" % ("spelling", "body", "drawn cm", "tex cm", "ratio"))
    for name, tmpl in CASES.items():
        for body in BODIES:
            src_text = TYP % (tmpl % (body, STROKE) if "%s" in tmpl else tmpl)
            with tempfile.TemporaryDirectory() as tmp:
                src = os.path.join(tmp, "c.typ")
                open(src, "w", encoding="utf-8").write(src_text)
                r = subprocess.run(["typst", "compile", src, os.path.join(tmp, "c.pdf")],
                                   capture_output=True)
                if r.returncode:
                    print("%-22s %-22s  FAILED %s"
                          % (name, body, re.sub(r"\s+", " ", r.stderr.decode("utf8", "replace"))[:80]))
                    continue
                doc = fitz.open(os.path.join(tmp, "c.pdf"))
                got = drawn(doc)
                doc.close()
                if got is None:
                    print("%-22s %-22s  no path" % (name, body))
                    continue
                print("%-22s %-22s %10.4f %10.4f %8.3f"
                      % (name, body, got, TEX[body], got / TEX[body]))


if __name__ == "__main__":
    main()
