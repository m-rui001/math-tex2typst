r"""Does a `set par(justify: false)` written inside a content block reach a table's cells?

The candidate fix for stretched cells is to wrap the emitted grid in a block that turns justification
off. Before running the corpus on that guess, ask Typst three things on a controlled document: the
wrapped table's word gaps come down to normal, the wrap is legal markup where the grid is emitted
bare, and the `set` rule does not leak past the block so the prose after it stays justified. Measure
with fitz, because the question is about the rendered gaps, not about whether it compiles.
"""
import os
import re
import subprocess
import sys
import tempfile

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

CELL = "Weighted-mean estimate alpha beta gamma delta"
NAMES = " ".join("word%02d" % i for i in range(30))


def para(filler):
    return " ".join([filler] * 8) + " " + NAMES


def doc(wrap):
    grid = "#table(\n  columns: 2,\n  inset: 4pt,\n  table.cell[%s], table.cell[short],\n)" % CELL
    if wrap:
        grid = "#[\n  #set par(justify: false)\n  %s\n]" % grid
    return ("#set par(justify: true, leading: 0.75em)\n"
            "#set page(width: 240pt, height: 400pt)\n"
            "Some prose that must stay justified: %s\n\n" % para("prose") +
            grid + "\n\n" +
            "Trailing prose that must stay justified too: %s\n" % para("trail"))


def gaps(pdf, needle):
    doc = fitz.open(pdf)
    out = []
    for page in doc:
        rows = {}
        for w in page.get_text("words"):
            rows.setdefault(round((w[1] + w[3]) / 2.0), []).append(w)
        for key in sorted(rows):
            ws = sorted(rows[key], key=lambda w: w[0])
            if needle in " ".join(w[4] for w in ws):
                out.append(max((b[0] - a[2] for a, b in zip(ws, ws[1:])), default=0))
    doc.close()
    return out


def run(wrap):
    with tempfile.TemporaryDirectory() as d:
        src = os.path.join(d, "a.typ")
        out = os.path.join(d, "a.pdf")
        open(src, "w", encoding="utf-8").write(doc(wrap))
        p = subprocess.run(["typst", "compile", src, out], capture_output=True)
        if p.returncode:
            return None, p.stderr.decode("utf-8", "replace")[:200]
        return (max(gaps(out, "Weighted-mean") or [0]),
                max(gaps(out, "prose") or [0]),
                max(gaps(out, "trail") or [0])), ""


def main():
    for wrap in (False, True):
        got, err = run(wrap)
        label = "wrapped" if wrap else "as emitted"
        if got is None:
            print("%-11s -> COMPILE FAILED: %s" % (label, err))
            continue
        print("%-11s -> cell line max gap %.1f pt | prose max gap %.1f pt | trailing prose %.1f pt"
              % (label, got[0], got[1], got[2]))


if __name__ == "__main__":
    main()
