"""Can CeTz's `frame:` path take `stroke: none`, and does the border really go away?

Three canvases in one typst document, each a sized node with a fill and no `draw`:
the current spelling (no stroke argument at all), `stroke: none`, and `stroke: (paint: red)`
as the positive control.  fitz then says how many stroked paths each page holds, so the
answer is the PDF, not the manual.
"""
import os
import subprocess
import sys

import fitz

OUT = os.path.dirname(os.path.abspath(__file__))
TMP = os.path.join(OUT, "framestroke")

BODIES = [
    ("frame only   (no stroke arg)", 'content((0, 0), (2, 1), [ab], frame: "rect", fill: rgb("#ff0000"))'),
    ("frame + stroke: none",        'content((0, 0), (2, 1), [ab], frame: "rect", fill: rgb("#ff0000"), stroke: none)'),
    ("frame + stroke: (paint: red)",'content((0, 0), (2, 1), [ab], frame: "rect", fill: rgb("#ff0000"), stroke: (paint: rgb("#0000ff")))'),
    ("circle + stroke: none",       'content((1, 0.5), [ab], frame: "circle", padding: 0.2cm, fill: rgb("#ff0000"), stroke: none)'),
    ("circle no stroke arg",        'content((1, 0.5), [ab], frame: "circle", padding: 0.2cm, fill: rgb("#ff0000"))'),
    ("empty-node circle + none",    'circle((1, 0.5), radius: 0.2, fill: rgb("#ff0000"), stroke: none)'),
    ("empty-node circle no arg",    'circle((1, 0.5), radius: 0.2, fill: rgb("#ff0000"))'),
    # is Typst's own default rule the 0.4pt the converter names for a valueless `draw`?
    ("frame, stroke: (thickness: 0.4pt)", 'content((0, 0), (2, 1), [ab], frame: "rect", fill: rgb("#ff0000"), stroke: (thickness: 0.4pt))'),
    ("circle, stroke: (thickness: 0.4pt)", 'circle((1, 0.5), radius: 0.2, fill: rgb("#ff0000"), stroke: (thickness: 0.4pt))'),
]


def run_one(i, name, body):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    src = ('#import "@preview/cetz:0.5.0"\n'
           '#set page(width: 8cm, height: 4cm, margin: 0.5cm)\n'
           '#cetz.canvas({\n  import cetz.draw: *\n  %s\n})\n' % body)
    typ = os.path.join(TMP, "fs%d.typ" % i)
    pdf = os.path.join(TMP, "fs%d.pdf" % i)
    with open(typ, "w", encoding="utf-8") as f:
        f.write(src)
    r = subprocess.run(["typst", "compile", typ, pdf],
                       stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                       encoding="utf-8", errors="replace")
    if not os.path.exists(pdf):
        print("%-34s [FAILED] %s" % (name, " ".join((r.stdout or "").split())[:160]))
        return
    d = fitz.open(pdf)
    strokes, fills, widths = [], [], []
    for dr in d[0].get_drawings():
        def hx(c):
            return "#%02x%02x%02x" % tuple(int(round(255 * v)) for v in c)
        if dr.get("color"):
            strokes.append(hx(dr["color"]))
            widths.append("%.3g" % (dr.get("width") or 0))
        if dr.get("fill"):
            fills.append(hx(dr["fill"]))
    print("%-34s stroke=%s width=%s fill=%s"
          % (name, sorted(set(strokes)) or "-", sorted(set(widths)) or "-",
             sorted(set(fills)) or "-"))
    d.close()


def main():
    os.makedirs(TMP, exist_ok=True)
    for i, (name, body) in enumerate(BODIES):
        run_one(i, name, body)


if __name__ == "__main__":
    main()
