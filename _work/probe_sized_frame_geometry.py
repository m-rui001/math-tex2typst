# -*- coding: utf-8 -*-
"""Is a `content(..., frame: "rect")` box drawn at its declared range, or at the size the
content actually took?  A rounded sized node has to be drawn as a separate `rect` path (CeTz
builds the frame as a hardcoded line-strip with no radius), and that is only faithful if the
two coincide.  fitz reads the drawn rectangle off the page in cm."""

import os
import subprocess
import sys

import fitz

ROOT = r"E:\math"
TMP = os.path.join(ROOT, "_work", "_sized")
HEADER = '#import "@preview/cetz:0.5.0"\n'


def read(label, rng, body):
    os.makedirs(TMP, exist_ok=True)
    src = os.path.join(TMP, label + ".typ")
    open(src, "w", encoding="utf-8").write(
        HEADER +
        "#set page(width: 12cm, height: 8cm, margin: 0cm)\n"
        "#cetz.canvas({\n"
        "  import cetz.draw: *\n"
        "  line((0, 0), (6, 0), stroke: (thickness: 0.4pt))\n"
        "  content(%s, [%s], frame: \"rect\", stroke: (thickness: 0.4pt))\n"
        "})\n" % (rng, body))
    pdf = os.path.join(TMP, label + ".pdf")
    got = subprocess.run(["typst", "compile", src, pdf], capture_output=True)
    if got.returncode:
        print("%-10s FAILED %s" % (label, got.stderr.decode("utf-8", "replace")[:300]))
        return
    doc = fitz.open(pdf)
    page = doc[0]
    h = page.rect.height
    boxes = []
    for d in page.get_drawings():
        for item in d["items"]:
            if item[0] == "l":
                pts = [(p.x, h - p.y) for p in item[1:]]
                if len(pts) == 4 or (len(pts) == 5 and pts[0] == pts[-1]):
                    xs = [p[0] for p in pts]
                    ys = [p[1] for p in pts]
                    boxes.append((min(xs), min(ys), max(xs), max(ys)))
    doc.close()
    BP = 0.0352778
    for (x0, y0, x1, y1) in boxes:
        print("%-10s drawn rect: (%.3f, %.3f) - (%.3f, %.3f) cm   w=%.3f h=%.3f"
              % (label, x0 * BP, y0 * BP, x1 * BP, y1 * BP,
                 (x1 - x0) * BP, (y1 - y0) * BP))


def main():
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    read("short", "(0, 5), (2, 6)", "X")
    read("long", "(0, 5), (2, 6)", "a very long line of text that will not fit")
    print("declared range is 2.000 x 1.000 cm, its left edge sits 0cm from the canvas origin")


if __name__ == "__main__":
    main()
