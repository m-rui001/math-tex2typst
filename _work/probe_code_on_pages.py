r"""Any page that prints Typst code? One fitz pass over the corpus looking for call syntax in the text.

#65 was found because `b_table` emitted `table(` where markup needs `#table(`, and nothing in the
toolchain objects: Typst compiles it (it is valid markup text) and the static gate only reads
`main.typ`.  The only oracle is the rendered page, so grep every product PDF for the spellings a call
makes and a sentence never does -- a function name followed by `(`, or a named argument `foo:` in the
same shape Typst writes it.  Report per family how many pages and papers carry it, with two examples,
so the next round has a census rather than a hunch.
"""
import glob
import os
import sys

import fitz

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
# `#`-less calls and named arguments: what Typst writes in code mode, never in a sentence
FAMILIES = {
    "table code": ["table(", "table.cell", "columns:", "inset:", "rowspan:", "colspan:",
                   "table.header"],
    "grid/stack code": ["grid(", "stack(", "grid.cell", "dir:"],
    "box/text code": ["text(fill:", "text(size:", "align(", "box(width:", "set text("],
    "raw/figure code": ["raw(block", "figure(", "image("],
    "cetz code": ["cetz.canvas", "line(", "circle(", "content(", "frame:"],
}


def main():
    tally = {k: [0, set()] for k in FAMILIES}
    examples = []
    for pdf in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.pdf"))):
        stem = os.path.basename(os.path.dirname(pdf))
        doc = fitz.open(pdf)
        for pno in range(len(doc)):
            text = doc[pno].get_text()
            for fam, needles in FAMILIES.items():
                hit = [w for w in needles if w in text]
                if hit:
                    tally[fam][0] += 1
                    tally[fam][1].add(stem)
                    if len(examples) < 40:
                        for line in text.splitlines():
                            if any(w in line for w in hit):
                                examples.append("%s | %s p%d | %s"
                                                % (fam, stem[:34], pno + 1, line.strip()[:60]))
                                break
        doc.close()
    for fam, (pages, papers) in sorted(tally.items(), key=lambda kv: -kv[1][0]):
        print("%-16s pages %5d  papers %4d" % (fam, pages, len(papers)))
    print("\nfirst examples:")
    for e in examples[:18]:
        print("  " + e)


if __name__ == "__main__":
    main()
