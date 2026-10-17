r"""Look at the two loops on the page: our old product, our new one, and TikZ's own control.

The geometry was priced against pgf's dumped numbers (`_work/probe98_loop_build.py`) and the churn
against the old law on one base (`_work/probe98_loop_stub_diff.py`: 932 pictures, 2 canvases changed).
What is left is the standing rule that a figure round closes by looking: the same canvas block, laid out
one per page by the census's own renderer, before and after, cropped at 300 dpi, next to the pdflatex
control page for the same source picture.

  python _work/probe98_page_shot.py

Reads the new products out of `typst/`, the old ones from `_work/m98_before_*.typ` (copied aside by
`_work/probe98_regen_two.py`), and writes `_work/m98_shot_*.png` -- delete them once seen.
"""
import glob
import io
import os
import sys

import fitz

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))
import probe81_label_box_face as g  # noqa: E402
import probe84_control_face as C  # noqa: E402
import compare_figure  # noqa: E402

TARGETS = (
    ("Finite-algebraic-envelopes", 1),
    ("Arithmetic-classification", 0),
)


def product_canvases(path):
    text = io.open(path, encoding="utf-8", errors="replace").read()
    head = g.header_of(text)
    return {i: block for i, block in enumerate(g.canvas_blocks(text))}, head


def shot(block, head, name):
    """Render one canvas on its own page and crop the figure's ink at 300 dpi."""
    got = g.render(block, name, head)
    if not got:
        return None, None
    _rects, _ink, pdf = got
    doc = fitz.open(pdf)
    page = doc[0]
    box = fitz.Rect()
    for dr in page.get_drawings():
        box |= dr["rect"]
    for blk in page.get_text("dict")["blocks"]:
        for ln in blk.get("lines", []):
            for sp in ln.get("spans", []):
                if sp["text"].strip():
                    box |= fitz.Rect(sp["bbox"])
    box = fitz.Rect(box.x0 - 8, box.y0 - 8, box.x1 + 8, box.y1 + 8) & page.rect
    out = os.path.join(HERE, "m98_shot_%s.png" % name)
    page.get_pixmap(clip=box, dpi=300).save(out)
    doc.close()
    return pdf, os.path.basename(out)


def main():
    new_all = g.canvases()
    for prefix, idx in TARGETS:
        stem = {s for (s, _k) in new_all if s.startswith(prefix)}
        if len(stem) != 1:
            print("SKIP %s: %d products match" % (prefix, len(stem)))
            continue
        stem = stem.pop()
        old = glob.glob(os.path.join(HERE, "m98_before_%s*.typ" % prefix[:20]))
        blocks, head = product_canvases(os.path.join(ROOT, "typst", stem, "main.typ"))
        print("== %s#%d" % (stem[:60], idx))
        for label, block in (("after", blocks[idx]),
                             ("before", product_canvases(old[0])[0][idx] if old else None)):
            if block is None:
                print("  %-6s no saved product" % label)
                continue
            name = "%s_%s_%d" % (prefix[:12], label, idx)
            pdf, png = shot(block, head, name)
            print("  %-6s %s" % (label, png or "RENDER REFUSED"))
            if pdf:
                doc = fitz.open(pdf)
                rects, ink = g.boxes_and_ink(doc[0])
                doc.close()
                print("         frames=%d ink=%d  %s"
                      % (len(rects), len(ink),
                         ["%r@%.1f,%.1f" % (t[0][:12], (t[1][0] + t[1][2]) / 2,
                                            (t[1][1] + t[1][3]) / 2) for t in ink[:4]]))
        pdf, _ = compare_figure.control(os.path.join(HERE, "flat", stem + ".tex"),
                                        idx, [], C.body_size(head))
        if pdf is None:
            print("  control  pdflatex produced nothing")
            continue
        out = os.path.join(HERE, "m98_shot_%s_control_%d.png" % (prefix[:12], idx))
        print("  control  %s" % (os.path.basename(out)
                                 if compare_figure.crop(pdf, 0, out) else "no ink to crop"))
    return 0


if __name__ == "__main__":
    sys.exit(main())
