# -*- coding: utf-8 -*-
"""How far does a long curve on a page bulge away from its own chord?

Reads the bezier items out of a PDF (pdflatex control and the generated product page), keeps the
long ones, and prints each curve's chord length and its maximum perpendicular deviation in cm.
That pair is what `to[bend left=theta]` decides, so the two documents can be compared on a real
page instead of by eye from a crop.
"""
import glob
import math
import os
import sys

import fitz

ROOT = r"E:\math"
BP = 0.0352778


def arcs(pdf, page_no, min_chord=1.0):
    doc = fitz.open(pdf)
    page = doc[page_no]
    height = page.rect.height
    out = []
    for d in page.get_drawings():
        for item in d["items"]:
            if item[0] != "c":
                continue
            p0, c1, c2, p1 = item[1], item[2], item[3], item[4]
            pts = [(p.x, height - p.y) for p in (p0, c1, c2, p1)]
            a, b = pts[0], pts[3]
            chord = math.hypot(b[0] - a[0], b[1] - a[1]) * BP
            if chord < min_chord:
                continue
            # deviation of the two controls off the chord line, in cm
            dev = []
            for p in pts[1:3]:
                vx, vy = b[0] - a[0], b[1] - a[1]
                cross = vx * (p[1] - a[1]) - vy * (p[0] - a[0])
                dev.append(abs(cross) / math.hypot(vx, vy) * BP)
            out.append((chord, max(dev), min(dev), d["color"]))
    doc.close()
    return sorted(out, reverse=True)


def main():
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    for label, path, page in (
            # the control PDF's stem has every non-alphanumeric replaced, so it has to be globbed
            ("control", glob.glob(os.path.join(ROOT, "_work", "cmp",
                                               "*Kurosh*Division_Rin-2.pdf"))[0], 0),
            ("product", glob.glob(os.path.join(ROOT, "typst",
                                               "A-Counterexample-to-Kuroshs-*/main.pdf"))[0], 35)):
        print("== %s" % label)
        for chord, hi, lo, color in arcs(path, page):
            print("   chord %.3f cm  control deviation %.3f / %.3f cm  ratio %.3f  color %s"
                  % (chord, hi, lo, hi / chord, color))


if __name__ == "__main__":
    main()
