r"""#96 receipt: what does a BARE `/` in a body equation put on the shipped page?

The census says the product's body maths carries a bare slash in **19,318 sites / 14,342 spans over 673 papers**
(`_work/probe96_face.py`, span count via `_work/probe96_reconcile.py`) while the
canvas side is 0.  The channel gauge explains the population: pandoc's Typst
writer escapes a slash the author *typed* (`G/P` -> `G \/ P`, which prints as ink) but it **linearizes
`\\frac{a}{b}` into a bare spaced `a / b`**.  The filing assumed Typst reads a bare `/` in math as a stacking
fraction whose denominator is the whole rest of the span, so the page signature to look for was a fraction bar
that is **too short for its own denominator**: ink to the right of the bar, sitting on the low line.  This reads
`get_drawings()` bars plus per-char ink boxes on the real PDFs, counts that signature per paper, and crops the
first few at 300 dpi to be looked at.

**VERDICT -- the signature does not discriminate.**  3 papers already give 51 flagged bars (worst deficit
375.2 pt) and both crops that were read at 300 dpi are false positives: `r96_0_0.png` is a box border,
`r96_2_1.png` the vinculum of a `\sqrt`.  Width asymmetry cannot separate one legal TeX fraction from another.
Attribution for this family is static only (`probe96_attrib.py`).

**VERDICT 2 -- and there is no runaway to look for.**  `_work/measure97_bar_scope.py` ruled on the bar directly:
a bare `/` stacks **one atom** on each side, and its bar comes back the same width with the same glyph count as
a `frac(a, b)` call.  #96 was withdrawn on that reading (轴 77), which is what this instrument was built to
confirm; kept as the reason a page-side width test must not be used as this family's judge.

  python _work/receipt96_body_slash.py                # three named papers
  python _work/receipt96_body_slash.py --papers 40    # a face estimate over the first 40 listed papers
"""
import csv
import os
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
TSV = os.path.join(WORK, "m94_bare_slash.tsv")
BAR_W_MIN = 6.0          # a fraction bar shorter than this is a subscript underscore at our scales
OVERHANG_PT = 8.0        # how far past the bar's right edge the low line has to run
CROP_PAD = 9.0           # pt of breathing room around the offending ink, when cropping


def bars_and_ink(page):
    """[(bar_rect, above_w, below_w, deficit_pt)] for bars whose low line is wider than their high line.

    TeX sets a fraction bar to max(numerator, denominator), so a faithful bar has ink of about the same
    width on both sides of it.  This searched for the asymmetry the filing predicted -- a bare `/` giving
    the denominator the rest of the span, so the ink *above* the bar falls short of the ink below it.  Neither
    half holds: 轴 77 measured the bar as wide as the one atom under it, and the VERDICT above shows this width
    test flags box borders and sqrt vinculums instead.
    """
    bars = []
    for d in page.get_drawings():
        for item in d["items"]:
            kind = item[0]
            if kind == "l":
                p0, p1 = item[1], item[2]
                if abs(p1.y - p0.y) > 0.4:
                    continue
                rect = fitz.Rect(min(p0.x, p1.x), min(p0.y, p1.y), max(p0.x, p1.x), max(p0.y, p1.y))
            elif kind == "re":
                rect = fitz.Rect(item[1])
                if rect.height > 1.2 or rect.width < BAR_W_MIN:
                    continue
            else:
                continue
            if rect.width >= BAR_W_MIN:
                bars.append(rect)

    chars = []
    raw = page.get_text("rawdict")
    for block in raw["blocks"]:
        for line in block.get("lines", []):
            for span in line["spans"]:
                for ch in span["chars"]:
                    x0, y0, x1, y1 = ch["bbox"]
                    if ch["c"].strip():
                        chars.append((x0, x1, (y0 + y1) / 2.0))

    def run(centres):
        if not centres:
            return 0.0
        return max(c[1] for c in centres) - min(c[0] for c in centres)

    flagged = []
    for bar in bars:
        near = [c for c in chars if c[0] > bar.x0 - 20 and c[1] < bar.x1 + 20]
        above = run([c for c in near if bar.y0 - 9.0 < c[2] < bar.y0 - 0.5])
        below = run([c for c in near if bar.y1 + 0.5 < c[2] < bar.y1 + 9.0])
        deficit = below - above
        if above > 0 and deficit > OVERHANG_PT:
            flagged.append((bar, above, below, deficit))
    return flagged


def crop(page, bar, deficit, name):
    rect = fitz.Rect(bar.x0 - 30, bar.y0 - 16, min(bar.x1 + deficit + CROP_PAD, page.rect.x1 - 4),
                     bar.y1 + 16)
    pix = page.get_pixmap(clip=rect, dpi=300)
    out = os.path.join(WORK, name)
    pix.save(out)
    return out


def main():
    argv = sys.argv[1:]
    limit = 3
    if "--papers" in argv:
        limit = int(argv[argv.index("--papers") + 1])
    rows = list(csv.DictReader(open(TSV, encoding="utf-8"), delimiter="\t"))
    body = [r for r in rows if r["kind"] == "body"]
    order = []
    for r in body:
        if r["paper"] not in order:
            order.append(r["paper"])
    order = order[:limit]

    total_bars = 0
    papers_hit = 0
    for paper in order:
        pdf = os.path.join(ROOT, "typst", paper, "main.pdf")
        if not os.path.exists(pdf):
            print("   %-46s NO PDF" % paper[:46])
            continue
        n_slash = sum(int(r["n_slash"]) for r in body if r["paper"] == paper)
        doc = fitz.open(pdf)
        hits = []
        for pno, page in enumerate(doc, 1):
            for bar, above, below, deficit in bars_and_ink(page):
                hits.append((pno, bar, above, below, deficit))
        doc.close()
        total_bars += len(hits)
        papers_hit += 1 if hits else 0
        print("   %-46s body bare `/`=%-5d runaway bars on the page=%d%s"
              % (paper[:46], n_slash, len(hits),
                 ("  worst deficit %.1fpt" % max(h[4] for h in hits)) if hits else ""))
        for i, (pno, bar, above, below, deficit) in enumerate(hits[:2]):
            doc = fitz.open(pdf)
            out = crop(doc[pno - 1], bar, deficit, "r96_%d_%d.png" % (order.index(paper), i))
            print("        crop p%d bar %.1fpt wide, ink above %.1fpt below %.1fpt -> %s"
                  % (pno, bar.width, above, below, os.path.basename(out)))
            doc.close()
    print("\n%d papers read, %d papers carry a runaway bar, %d bars total" % (len(order), papers_hit, total_bars))
    return 0


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
