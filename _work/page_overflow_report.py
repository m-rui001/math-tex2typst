r"""Ink that reaches past the page's own margin box, measured off the rendered PDFs.

A typesetting norm, not a guess: `main.typ` opens with `#set page(paper: "us-letter", margin: …)`,
so the text block is known per paper and anything printed outside it is overflowing -- a figure too
wide for the column, an unbreakable formula, a table cell that refuses to wrap. fitz reports the
final box of every span and every drawing, so the page settles what sticks out and by how many
points. Page numbering sits in the margin by design and is excluded.

Usage: python _work/page_overflow_report.py [min-points] [top-count]
"""
import glob
import os
import re
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TYPST = os.path.join(ROOT, "typst")

PAGE = re.compile(r"#set page\((.*?)\)\n")
MARGIN = re.compile(r"margin:\s*(\{[^}]*\}|[^,)]+)")
SIDE = re.compile(r"(left|right|top|bottom|x|y):\s*([0-9.]+)pt")
NUM = re.compile(r"^([0-9.]+)pt$")
US_LETTER = (612.0, 792.0)


def margins_of(paper):
    """-> (left, top, right, bottom) in pt, read from the product's own `#set page` line."""
    path = os.path.join(TYPST, paper, "main.typ")
    head = open(path, encoding="utf-8", errors="replace").read(4000)
    m = PAGE.search(head)
    if not m:
        return None
    got = MARGIN.search(m.group(1))
    if not got:
        return None
    val = got.group(1).strip()
    sides = dict(SIDE.findall(val.strip("{}")))
    if not sides and NUM.match(val):
        one = float(NUM.match(val).group(1))
        return (one, one, one, one)
    left = float(sides["left"]) if "left" in sides else (float(sides["x"]) if "x" in sides else 72.3)
    right = float(sides["right"]) if "right" in sides else left
    top = float(sides["top"]) if "top" in sides else (float(sides["y"]) if "y" in sides else 72.3)
    bottom = float(sides["bottom"]) if "bottom" in sides else top
    return (left, top, right, bottom)


def ink(page):
    """-> [(box, what)] for every text span and drawing on the page."""
    out = []
    for blk in page.get_text("dict")["blocks"]:
        for ln in blk.get("lines", []):
            for sp in ln.get("spans", []):
                if sp["text"].strip():
                    out.append((fitz.Rect(sp["bbox"]), "text:" + sp["text"].strip()[:24]))
    for dr in page.get_drawings():
        r = fitz.Rect(dr["rect"])
        if r.width > 1 and r.height > 1:
            out.append((r, "draw"))
    for im in page.get_image_info():
        out.append((fitz.Rect(im["bbox"]), "image"))
    return out


def main():
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    floor = float(sys.argv[1]) if len(sys.argv) > 1 else 2.0
    top = int(sys.argv[2]) if len(sys.argv) > 2 else 40
    rows = []
    papers = sorted(os.path.basename(os.path.dirname(p))
                    for p in glob.glob(os.path.join(TYPST, "*", "main.pdf")))
    for paper in papers:
        mg = margins_of(paper)
        pdf = os.path.join(TYPST, paper, "main.pdf")
        if mg is None or not os.path.isfile(pdf):
            continue
        left, top_m, right, bottom = mg
        doc = fitz.open(pdf)
        worst = {}
        for no, page in enumerate(doc, 1):
            w, h = page.rect.width, page.rect.height
            box = fitz.Rect(left, top_m, w - right, h - bottom)
            for r, what in ink(page):
                if r.y0 > box.y1:      # below the text block: the page number
                    continue
                out = max(box.x0 - r.x0, r.x1 - box.x1, box.y0 - r.y0, r.y1 - box.y1)
                if out > floor:
                    side = ("left" if box.x0 - r.x0 == out else
                            "right" if r.x1 - box.x1 == out else
                            "top" if box.y0 - r.y0 == out else "bottom")
                    key = (side, what.split(":")[0])
                    if out > worst.get(key, (0,))[0]:
                        worst[key] = (out, no, what)
        doc.close()
        for (side, kind), (out, no, what) in worst.items():
            rows.append((out, paper, side, kind, no, what))
    rows.sort(reverse=True)
    print("papers with ink past the margin box: %d" % len({r[1] for r in rows}))
    print("rows (over pt, paper, side, kind, page, worst item): %d" % len(rows))
    for out, paper, side, kind, no, what in rows[:top]:
        print("%7.1f  %-58s %-6s %-5s p%-4d %s" % (out, paper[:58], side, kind, no, what))
    by_kind = {}
    for out, paper, side, kind, no, what in rows:
        by_kind.setdefault((side, kind), set()).add(paper)
    print("--- papers per (side, kind)")
    for key in sorted(by_kind, key=lambda k: -len(by_kind[k])):
        print("%-16s %d papers" % ("%s/%s" % key, len(by_kind[key])))


if __name__ == "__main__":
    main()
