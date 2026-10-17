r"""Render the page that carries the most canvas text of a paper's figures.

A canvas label is the only figure text that reaches the PDF as words, so the page holding
the most distinct `content()` words is where the pictures are.  Used to put a family's
drawing in front of a reader rather than another page of maths.
"""
import glob
import os
import re
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SHOT = os.path.join(ROOT, "_work", "shot")
CONTENT = re.compile(r"^\s*content\(\([^)]*\),\s*\[(.*)\]\s*\)\s*$")
BOX = re.compile(r"\[([^\[\]]*)\]\s*\)")


def needles(typ):
    out = set()
    for line in open(typ, encoding="utf-8", errors="replace"):
        m = CONTENT.match(line)
        if not m:
            continue
        for w in re.findall(r"[A-Za-z]{5,}", BOX.sub(" ", m.group(1))):
            out.add(w)
    return sorted(out)


def main():
    sys.stdout.reconfigure(errors="replace")
    for a in sys.argv[1:]:
        pat, _, label = a.partition("=")
        hits = glob.glob(os.path.join(ROOT, "typst", pat))
        if not hits:
            print("no paper matches %r" % pat)
            continue
        name = os.path.basename(hits[0])
        ns = needles(os.path.join(hits[0], "main.typ"))
        d = fitz.open(os.path.join(hits[0], "main.pdf"))
        best, score = -1, 0
        for i, p in enumerate(d):
            txt = p.get_text()
            s = sum(1 for w in ns if w in txt)
            if s > score:
                best, score = i, s
        if best < 0:
            print("%-52s no canvas words found (%d needles)" % (name[:52], len(ns)))
            continue
        out = os.path.join(SHOT, "fam-%s-p%d.png" % (label or name[4:16], best + 1))
        d[best].get_pixmap(matrix=fitz.Matrix(2, 2)).save(out)
        print("%-52s needles=%d best page %d (%d matched) -> %s"
              % (name[:52], len(ns), best + 1, score, os.path.basename(out)))


if __name__ == "__main__":
    main()
