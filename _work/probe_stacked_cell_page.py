r"""Do the lines of a stacked cell reach the page?

pandoc's LaTeX reader has no `\shortstack` and no `\makecell`: it drops the command together with its
braced argument, so in the products the text under a row separator inside such a cell simply was not
there -- 34 uses over 11 flat sources, and the A-spectral-gap figure whose row above the arrow came
out empty. `prep.unstack_cells` rewrites the construct as one cell whose lines break with `\newline`.

Judge it on the page, not in the source: for every stacked cell in the flat sources, take the words of
each line and ask whether the rendered PDF of that paper contains them. Whitespace is stripped from
both sides first, because fitz inserts gaps between letters of a justified line (the same trap
_work/caption_page_report.py records).
"""
import glob
import os
import re
import sys

import fitz

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
STACKED = re.compile(r"\\(?:shortstack|makecell)\*?\s*(?:\[[^\]]*\])?\s*\{")
BREAK = re.compile(r"\\\\\s*(?:\[[^\]]*\])?")
WORD = re.compile(r"[A-Za-z]{3,}")
# a reference or citation carries a key, not prose: `\eqref{elim:four-charge}` asks the page for the
# number it resolves to, never for the letters of the key
KEYED = re.compile(r"\\(?:eqref|autoref|nameref|pageref|cref|Cref|vref|ref|label"
                   r"|cite[a-zA-Z]*)\s*(?:\[[^\]]*\])?\s*\{[^{}]*\}")


def group_end(src, open_at):
    depth = 0
    for k in range(open_at, len(src)):
        if src[k] == "{":
            depth += 1
        elif src[k] == "}":
            depth -= 1
            if depth == 0:
                return k
    return -1


def pages(stem):
    pdf = os.path.join(ROOT, "typst", stem, "main.pdf")
    if not os.path.exists(pdf):
        return None
    doc = fitz.open(pdf)
    out = "".join(p.get_text() for p in doc)
    doc.close()
    return re.sub(r"\s+", "", out)


def main():
    hits = miss = nopdf = 0
    for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        src = open(path, encoding="utf-8", errors="replace").read()
        stem = os.path.basename(path)[:-4]
        cells = []
        i = 0
        while True:
            m = STACKED.search(src, i)
            if not m:
                break
            end = group_end(src, m.end() - 1)
            if end < 0:
                break
            cells.append(BREAK.split(src[m.end():end]))
            i = end
        if not cells:
            continue
        text = pages(stem)
        if text is None:
            nopdf += 1
            continue
        for cell in cells:
            for line in cell:
                plain = KEYED.sub(" ", line)                     # a key is not prose
                plain = re.sub(r"\$[^$]*\$", " ", plain)         # math is not prose
                plain = re.sub(r"\\[A-Za-z]+\*?", " ", plain)    # \small, \Downarrow are not
                words = WORD.findall(plain)
                if not words:
                    continue
                # a line's words must stand in order on the page, with only a short span between
                # them -- that span is an inline formula or a two-letter word the needle drops
                needle = r"\S{0,12}?".join(map(re.escape, words))
                if re.search(needle, text):
                    hits += 1
                else:
                    miss += 1
                    print("MISS %-58s %s" % (stem[:58], " ".join(words)[:70]))
    print("\nstacked lines on the page: %d found / %d missing / %d papers with no pdf"
          % (hits, miss, nopdf))


if __name__ == "__main__":
    main()
