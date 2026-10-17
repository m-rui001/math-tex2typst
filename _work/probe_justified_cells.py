r"""Count fat word spaces, measured on the space glyph itself.

The first version of this gauge compared the distance between consecutive words on a baseline. That
measured nothing: a formula sitting between two words is not extracted as a word, so the distance
spans the formula and every prose line in the corpus looked stretched (723 of 724 papers). Ask a
narrower question instead -- how wide is the *space character* -- because justification in Typst
widens the space's advance, and a real space cannot be confused with a missing glyph. A body space on
these pages is 2.6-3.6 pt; the cell that started this (`Weighted-mean estimate`, a narrow column
forced to fill its width) is 18.3 pt.
"""
import glob
import os
import statistics
import sys

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
# prose justification reaches about 8 pt here (measured: widest fat space per paper 7.7-10.1), while
# the narrow-column cell that started this measured 18.3 pt. Ask above the prose range.
FLOOR = 12.0


def spaces(page):
    out = []
    for block in page.get_text("rawdict")["blocks"]:
        for line in block.get("lines", []):
            for span in line.get("spans", []):
                for ch in span.get("chars", []):
                    if ch["c"] == " ":
                        out.append((ch["bbox"][2] - ch["bbox"][0],
                                    round(line["bbox"][1], 1)))
    return out


def main():
    only = sys.argv[1] if len(sys.argv) > 1 else "*"
    papers = flagged = 0
    rows = []
    typical_all = []
    for pdf in sorted(glob.glob(os.path.join(ROOT, "typst", only, "main.pdf"))):
        papers += 1
        doc = fitz.open(pdf)
        fat, widths = 0, []
        for page in doc:
            found = spaces(page)
            widths.extend(w for w, _ in found)
            fat += sum(1 for w, _ in found if w > FLOOR)
        doc.close()
        if widths:
            typical_all.append(statistics.median(widths))
        if fat:
            flagged += 1
            rows.append((fat, os.path.basename(os.path.dirname(pdf)),
                         round(statistics.median(widths), 2),
                         round(max(widths), 1)))
    rows.sort(reverse=True)
    print("median space width over the corpus: %.2f pt (max %.1f pt)"
          % (statistics.median(typical_all), max(r[3] for r in rows) if rows else 0))
    for fat, stem, med, mx in rows[:20]:
        print("%-58s %5d fat spaces  median %.2f  widest %.1f" % (stem[:58], fat, med, mx))
    print("\nspaces wider than %.1f pt: %d in %d papers of %d scanned"
          % (FLOOR, sum(r[0] for r in rows), flagged, papers))


if __name__ == "__main__":
    main()
