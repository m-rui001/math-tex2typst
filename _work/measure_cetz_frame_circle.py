r"""What circle does CeTz actually draw for `frame: "circle"` -- and can a single point carry a frame?

The converter's range form (`content((-0.45,-0.45),(0.45,0.45), [$k$], frame: "circle")`) is what
`minimum size=9mm` produces today, and the ledger called its half-extent 0.45cm "correct" -- but that
reading came from the canvas STRING, not from the page. CeTz's own source
(`.../cetz/0.5.0/src/draw/shapes.typ:1256`) computes the frame as the circle through three anchors of
the laid-out content box, `calculate-circle-center-3pt(north-west, south-west, south-east)`, which for
a square box is the CIRCUMSCRIBED circle -- radius = half-side x sqrt(2). If that is what reaches the
page, every round node in the corpus is 41 % too big, and the same formula on a non-square box is a
different story again.

The other question decides the fix's shape: `frame:` is applied to the content block's own measured
anchors, so does `content(point, [text], frame: "circle")` -- a point, no range -- compile and draw a
circle around the TEXT? If it does, the shape needs no measure from this converter at all, and Typst's
own layout is what sizes it (which is what TeX does).

A ruler line of exactly one canvas unit is drawn in every case, so the numbers are read in units and
not in points; every path's bounding box is printed so the circle is identified by shape, not assumed.
"""
import pathlib
import re
import subprocess
import sys
import tempfile

import fitz

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
sys.stdout.reconfigure(errors="replace")

HEADER = '#import "@preview/cetz:0.5.0"\n'
STROKE = 'stroke: (thickness: 0.4pt), fill: none'
CASES = [
    ("range-0.45-k", 'content((-0.45, -0.45), (0.45, 0.45), [$k$], frame: "circle", %s)' % STROKE),
    ("range-0.5-k", 'content((-0.5, -0.5), (0.5, 0.5), [$k$], frame: "circle", %s)' % STROKE),
    ("range-rect-k", 'content((-0.45, -0.45), (0.45, 0.45), [$k$], frame: "rect", %s)' % STROKE),
    ("point-k", 'content((0, 0), [$k$], frame: "circle", %s)' % STROKE),
    ("point-long", 'content((0, 0), [a rather long label], frame: "circle", %s)' % STROKE),
    ("point-box1cm", 'content((0, 0), [#box(width: 1cm, inset: 0.3333em, %s)[[$k$]]],'
                     ' frame: "circle")' % STROKE),
    ("point-inset", 'content((0, 0), [$k$], frame: "circle", %s, inset: 2pt)' % STROKE),
]


def paths(page, unit):
    """Every non-degenerate path on the page, as (bbox width, height, centre x, centre y) in units."""
    out = []
    for d in page.get_drawings():
        r = d["rect"]
        if r.width < 0.2 or r.height < 0.2:
            continue
        out.append((r.width / unit, r.height / unit,
                    ((r.x0 + r.x1) / 2 - page.rect.width / 2) / unit,
                    ((r.y0 + r.y1) / 2 - page.rect.height / 2) / unit,
                    len(d["items"]), d["items"][0][0] if d["items"] else "-"))
    return out


def main():
    for name, body in CASES:
        src_text = (HEADER + "#set page(width: 220pt, height: 220pt)\n"
                    "#cetz.canvas({\n  import cetz.draw: *\n"
                    "  line((0, 0), (1, 0), stroke: (thickness: 0.1pt, paint: luma(200)))\n"
                    "  %s\n})\n" % body)
        with tempfile.TemporaryDirectory() as tmp:
            src = pathlib.Path(tmp) / "c.typ"
            src.write_text(src_text, encoding="utf-8")
            r = subprocess.run(["typst", "compile", str(src), str(pathlib.Path(tmp) / "c.pdf")],
                               capture_output=True)
            print("== %-14s rc=%d %s" % (name, r.returncode,
                                         re.sub(r"\s+", " ", r.stderr.decode("utf8", "replace"))[:150]))
            if r.returncode:
                continue
            doc = fitz.open(str(pathlib.Path(tmp) / "c.pdf"))
            page = doc[0]
            # the ruler is the widest flat horizontal path; its width is one canvas unit in pt
            unit = None
            for d in page.get_drawings():
                rr = d["rect"]
                if rr.height < 1.5 and 20 < rr.width < 60:
                    unit = rr.width
                    break
            if unit is None:
                print("   no ruler found; drawings: %s"
                      % [(round(x["rect"].width, 2), round(x["rect"].height, 2))
                         for x in page.get_drawings()][:6])
                doc.close()
                continue
            for w, h, cx, cy, n, kind in paths(page, unit):
                if abs(w - 1.0) < 0.02 and h < 0.1:
                    continue          # the ruler itself
                print("   bbox %.4f x %.4f units at (%+.3f, %+.3f)  items=%d %s"
                      % (w, h, cx, -cy, n, kind))
            print("   (one canvas unit = %.3f pt = %.4f cm)" % (unit, unit / 28.3465))
            doc.close()


if __name__ == "__main__":
    main()
