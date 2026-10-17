r"""#52: what a CeTz shape draws when the converter says nothing about its stroke, per call.

#49 and #50 taught this for a node's frame: Typst answers its own default -- 1pt black, read off the
PDF below -- where the author asked for a rule of pgf's default 0.4pt, or no rule at all.  The same
silence sits on every geometry call a `\path` statement emits, and there the two defaults disagree in
both directions: a bare `\draw (a)--(b);` should be a 0.4pt rule and gets 1pt, and a `\fill[arrred]
(a) circle (1.9pt);` should have no rule at all and gets a black ring 1pt wide around a red disc
(`_work/render_pair.py` put that pair side by side on `A-projective-fourfold…` fig 2).

So each call is compiled three ways and fitz says what the page holds: no `stroke:` argument,
`stroke: none`, and `stroke: (thickness: 0.4pt)`.  A fourth spelling puts an arrow mark on a
`stroke: none` line, because the mark is the next thing this round has to decide about a `\path`.
"""
import os
import subprocess
import sys

import fitz

OUT = os.path.dirname(os.path.abspath(__file__))
TMP = os.path.join(OUT, "fillstroke")

BODIES = [
    ("line, no stroke arg", "line((0, 0), (2, 0))"),
    ("line, stroke: none", "line((0, 0), (2, 0), stroke: none)"),
    ("line, thickness 0.4pt", "line((0, 0), (2, 0), stroke: (thickness: 0.4pt))"),
    ("rect, fill only", "rect((0, 0), (2, 1), fill: rgb(\"#ff0000\"))"),
    ("rect, fill + stroke: none", "rect((0, 0), (2, 1), fill: rgb(\"#ff0000\"), stroke: none)"),
    ("circle, fill only", "circle((1, 0.5), radius: 0.4, fill: rgb(\"#ff0000\"))"),
    ("circle, fill + none", "circle((1, 0.5), radius: 0.4, fill: rgb(\"#ff0000\"), stroke: none)"),
    ("arc, no stroke arg", "arc((1, 0), (2, 0), (1, 1))"),
    ("arc, stroke: none", "arc((1, 0), (2, 0), (1, 1), stroke: none)"),
    ("curve, no stroke arg", "curve((0, 0), (1, 1), (2, 0))"),
    ("curve, stroke: none", "curve((0, 0), (1, 1), (2, 0), stroke: none)"),
    ("line none + arrow mark", "line((0, 0), (2, 0), stroke: none, mark: (end: (symbol: \">>\")))"),
    ("line 0.4pt + arrow mark",
     "line((0, 0), (2, 0), stroke: (thickness: 0.4pt), mark: (end: (symbol: \">>\")))"),
]


def main():
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    os.makedirs(TMP, exist_ok=True)
    for i, (name, body) in enumerate(BODIES):
        src = ('#import "@preview/cetz:0.5.0"\n'
               '#set page(width: 6cm, height: 3cm, margin: 0.4cm)\n'
               '#cetz.canvas({\n  import cetz.draw: *\n  %s\n})\n' % body)
        typ = os.path.join(TMP, "fs%d.typ" % i)
        pdf = os.path.join(TMP, "fs%d.pdf" % i)
        with open(typ, "w", encoding="utf-8") as f:
            f.write(src)
        r = subprocess.run(["typst", "compile", typ, pdf],
                           stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                           encoding="utf-8", errors="replace")
        if not os.path.exists(pdf):
            print("%-26s [FAILED] %s" % (name, " ".join((r.stdout or "").split())[:150]))
            continue
        doc = fitz.open(pdf)
        strokes, widths, fills = [], [], []
        for dr in doc[0].get_drawings():
            def hx(c):
                return "#%02x%02x%02x" % tuple(int(round(255 * v)) for v in c)
            if dr.get("color"):
                strokes.append(hx(dr["color"]))
                widths.append("%.3g" % (dr.get("width") or 0))
            if dr.get("fill"):
                fills.append(hx(dr["fill"]))
        print("%-26s stroke=%-22s width=%-12s fill=%s"
              % (name, ",".join(sorted(set(strokes))) or "-",
                 ",".join(sorted(set(widths))) or "-",
                 ",".join(sorted(set(fills))) or "-"))
        doc.close()


if __name__ == "__main__":
    main()
