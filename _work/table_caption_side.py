r"""Where does a table caption sit in the LaTeX sources, and what does Typst do with each figure kind?

Leg 1 counts, over `_work/flat/*.tex`, every `table`-like float and whether its `\caption` comes before
or after the first tabular-ish body.  Leg 2 compiles one tall table twice -- `#figure(...)` as we emit it
today, and with `kind: table` -- and reports, from the rendered PDF, the caption's y against the first
and last row's y plus the page count, so "does the PRELUDE's `figure.where(kind: table)` rule ever fire"
is answered by a page and not by a guess.
"""
import io
import os
import re
import subprocess
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
WORK = os.path.join(ROOT, "_work")

FLOAT = re.compile(r"\\begin\{(table\*?|sidewaystable\*?|longtable)\}(.*?)\\end\{\1\}", re.S)
BODY = re.compile(r"\\begin\{(tabular\*?|tabularx|array|longtable)\}")


def corpus():
    above = below = noboth = 0
    papers = set()
    for name in sorted(os.listdir(FLAT)):
        if not name.endswith(".tex"):
            continue
        text = open(os.path.join(FLAT, name), encoding="utf-8", errors="replace").read()
        for env, inner in FLOAT.findall(text):
            cap = inner.find(r"\caption")
            body = BODY.search(inner)
            if cap < 0 or body is None:
                noboth += 1
                continue
            papers.add(name)
            if cap < body.start():
                above += 1
            else:
                below += 1
    return above, below, noboth, len(papers)


DOC = """#set page(paper: "us-letter", margin: 72pt)
#set figure(numbering: none)
%s
#figure(%s
  table(
    columns: 2,
    inset: 4pt,
    table.header([k], [v]),
%s
  ),
  caption: [Table 1: A very tall table.],
)
"""

ROWS = "".join("  [row %d], [%d],\n" % (i, i) for i in range(1, 61))


def render(kind_line, path):
    doc = DOC % ("#show figure.where(kind: table): set block(breakable: true)", kind_line, ROWS)
    src = path + ".typ"
    with open(src, "w", encoding="utf-8") as fh:
        fh.write(doc)
    subprocess.run(["typst", "compile", src, path], check=True,
                   stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    pdf = fitz.open(path)
    pages = pdf.page_count
    hits = []
    for pno in range(pages):
        for line in pdf[pno].get_text("dict")["blocks"]:
            if line["type"]:
                continue
            for ln in line["lines"]:
                txt = "".join(s["text"] for s in ln["spans"])
                hits.append((pno + 1, round(ln["bbox"][1], 1), round(ln["bbox"][3], 1), txt[:34]))
    pdf.close()
    return pages, hits


def main():
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    a, b, nb, papers = corpus()
    print("caption before body: %d   after body: %d   (no caption or no tabular: %d)   papers: %d"
          % (a, b, nb, papers))
    for label, kind_line in (("today (no kind)", ""), ("kind: table", "kind: table,")):
        pages, hits = render(kind_line, os.path.join(WORK, "kind_probe.pdf"))
        cap = [h for h in hits if h[3].startswith("Table 1:")]
        rows = [h for h in hits if h[3].startswith("row ")]
        print("%-16s pages=%d  caption=%s  first row=%s  last row=%s"
              % (label, pages, cap[0] if cap else None, rows[0] if rows else None,
                 rows[-1] if rows else None))


if __name__ == "__main__":
    main()
