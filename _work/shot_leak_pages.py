r"""Render the figure pages where a canvas text run prints a command name as a word.

Takes the first N `content()` lines whose maths contains a quoted word from LEAKS, finds
the page of main.pdf that carries the same text, and saves a PNG of it.  What the reader
sees is the verdict; the source is only the pointer.
"""
import glob
import os
import re
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SHOT = os.path.join(ROOT, "_work", "shot")
CONTENT = re.compile(r"^\s*content\(\([^)]*\),\s*\[(.*)\]\s*\)\s*$")
MATH = re.compile(r"\$([^$]*)\$", re.S)
QUOTED = re.compile(r'"([A-Za-z][A-Za-z0-9]{1,20})"')
LEAKS = ["mathbb", "mathcal", "overline", "widetilde", "otimes", "notin", "langle",
         "mathsf", "bar", "ast", "cong", "sharp"]


def main(limit=8):
    sys.stdout.reconfigure(errors="replace")
    if not os.path.isdir(SHOT):
        os.makedirs(SHOT)
    done = 0
    for tpath in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
        name = os.path.basename(os.path.dirname(tpath))
        text = open(tpath, encoding="utf-8", errors="replace").read()
        for line in text.splitlines():
            m = CONTENT.match(line)
            if not m:
                continue
            body = m.group(1)
            bad = [w for reg in MATH.finditer(body)
                   for w in QUOTED.findall(reg.group(1)) if w in LEAKS]
            if not bad:
                continue
            pdf = os.path.join(ROOT, "typst", name, "main.pdf")
            if not os.path.exists(pdf):
                continue
            # a needle the page text will carry: the plain words around the leak
            needle = re.sub(r"\$[^$]*\$", " ", body)
            needle = re.sub(r'"[A-Za-z]+"', " ", needle)
            words = [w for w in re.findall(r"[A-Za-z]{4,}", needle)]
            doc = fitz.open(pdf)
            hit = []
            if words:
                hit = [i for i, p in enumerate(doc) if p.search_for(words[0])]
            print("%-46s leak=%s  words=%s  page=%s" %
                  (name[:46], bad[:3], words[:2], hit[:2]))
            print("     %s" % body[:150])
            if hit:
                doc[hit[0]].get_pixmap(matrix=fitz.Matrix(2, 2)).save(
                    os.path.join(SHOT, "leak-%s-p%d.png" % (name[4:20], hit[0] + 1)))
            doc.close()
            done += 1
            if done >= limit:
                return
            break


if __name__ == "__main__":
    main()
