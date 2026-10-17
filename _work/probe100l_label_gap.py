r"""How far does a label sit off its own arrow -- our page vs the pdflatex control?

The two canvases the `node distance` fix moved (`_work/probe100k_fixed_crops.py`) look clean at 300
dpi, but ours still carries its edge labels closer to the rule than TikZ does: on
`Relative-independence-of-the-separable-quotient-problem#0` the bottom label reads as if it were
strung on the arrow. The collision census cannot see that at all -- it prices **text against text**
(`ink on ink`) and **text against a drawn frame** (`foreign ink`), and an arrow is neither.

This measures the perpendicular gap from each label's ink box to the nearest long straight line the
page carries, on both pages, so the difference is a number rather than an impression.

  python _work/probe100l_label_gap.py            # the two canvases the fix moved
"""
import io
import os
import re
import sys

import fitz

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))

import probe81_label_box_face as g  # noqa: E402

CMP = os.path.join(HERE, "cmp")
CASES = [("Relative-independence-of-the-separable-quotient-problem", 0),
         ("The-Grothendieck-homotopy-hypothesis-via-elementary-expansions", 4)]
# a line is a rule when it is long and thin: an arrow shaft, not a node frame's edge
MIN_LEN = 40.0


def stem_for(prefix):
    hits = [d for d in os.listdir(os.path.join(ROOT, "typst")) if d.startswith(prefix)]
    assert len(hits) == 1, (prefix, hits)
    return hits[0]


def rules(page):
    """(x0, y, x1) for every horizontal rule the page drew, and the verticals likewise."""
    horiz, vert = [], []
    for dr in page.get_drawings():
        for item in dr["items"]:
            if item[0] != "l":
                continue
            a, b = item[1], item[2]
            if abs(a.y - b.y) < 0.6 and abs(a.x - b.x) >= MIN_LEN:
                horiz.append((min(a.x, b.x), (a.y + b.y) / 2.0, max(a.x, b.x)))
            elif abs(a.x - b.x) < 0.6 and abs(a.y - b.y) >= MIN_LEN:
                vert.append((min(a.y, b.y), (a.x + b.x) / 2.0, max(a.y, b.y)))
    return horiz, vert


def labels(page):
    out = []
    for blk in page.get_text("dict")["blocks"]:
        for ln in blk.get("lines", []):
            for sp in ln.get("spans", []):
                text = " ".join(sp["text"].split())
                if text:
                    out.append((fitz.Rect(sp["bbox"]), text))
    return out


def gaps(pdf):
    doc = fitz.open(pdf)
    page = doc[0]
    horiz, vert = rules(page)
    rows = []
    for box, text in labels(page):
        # the rule a label belongs to is one that spans it sideways -- a shaft under the words
        near = [y for x0, y, x1 in horiz if x0 - 2 <= (box.x0 + box.x1) / 2.0 <= x1 + 2]
        if not near:
            continue
        y = min(near, key=lambda v: abs(v - (box.y0 + box.y1) / 2.0))
        # the two clearances, in pt: `above` is the space under the label up to the rule (so a
        # positive `above` means the label hangs above the rule), `below` the space above it
        rows.append((round(y - box.y1, 2), round(box.y0 - y, 2), round(y, 2), text[:22]))
    doc.close()
    return rows


def main():
    sys.stdout.reconfigure(errors="replace")
    canv = g.canvases()
    lines = ["#100l: label ink vs the arrow it labels (top gap, bottom gap, rule y) -- pt"]
    for prefix, k in CASES:
        stem = stem_for(prefix)
        lines.append("\n### %s#%d" % (stem[:52], k))
        head, canvas = canv[(stem, k)]
        got = g.render(canvas, "m100l", head)
        san = re.sub(r"[^A-Za-z0-9]", "_", stem)[:40]
        for label, pdf in (("ours", got[2] if got else None),
                           ("ctl  ", os.path.join(CMP, "%s-%d.pdf" % (san, k)))):
            if not pdf or not os.path.isfile(pdf):
                lines.append("%s  NO PAGE" % label)
                continue
            for above, below, y, text in gaps(pdf):
                lines.append("%s  above %6.2f below %6.2f  rule y %7.2f  %r"
                             % (label, above, below, y, text))
    text = "\n".join(lines) + "\n"
    io.open(os.path.join(HERE, "label100l_label_gap.txt"), "w", encoding="utf-8").write(text)
    print(text)
    for name in os.listdir(g.TMP):
        if name.startswith("m100l"):
            os.remove(os.path.join(g.TMP, name))
    return 0


if __name__ == "__main__":
    sys.exit(main())
