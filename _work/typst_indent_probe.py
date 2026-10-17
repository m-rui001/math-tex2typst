r"""Two Typst-norm questions about the figures we emit for tables.

Leg A: PRELUDE carries `#show figure.where(kind: table): set block(breakable: true)` while `b_table`
emits `#figure(...)` with no `kind`, and the products hold exactly one `kind: table` per file -- the
rule line itself. That does NOT make the rule dead: a figure's kind defaults to `auto` and resolves
to `table` from its body, which the suite's long-table test proves by splitting only while the rule
is there. What still needs measuring is whether declaring the kind moves the caption, because Typst
is documented to put a table figure's caption above it and the LaTeX sources put `\caption` after
the tabular 117 times against 12 before, so a caption that jumps above would be unfaithful.

Leg B: `first-line-indent: (amount: 1.5em, all: true)` indents every paragraph. pdflatex says the
paragraph a heading introduces is not indented (x0 72.0) while the next one is (88.9). Measure what
`all: false` does in Typst, and whether em-relative heading sizes reproduce today's 11.5pt/13pt for
an 11pt paper exactly -- the corpus is 722 papers at 11pt, 1 at 10pt, 1 at 12pt, and that 12pt paper
today gets 11.5pt subsection headings, smaller than its own body.
"""
import os
import subprocess
import sys

import fitz

WORK = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "_work")

SHORT = """#set page(paper: "us-letter", margin: 72pt)
#set figure(numbering: none)
#show figure.where(kind: table): set block(breakable: true)
Intro paragraph so the figure is not the first thing on the page.

#figure(
  %s
  table(
    columns: 2,
    inset: 4pt,
    table.header([k], [v]),
    [one], [1],
    [two], [2],
  ),
  caption: [Table 1: A short table.],
)

Trailing paragraph.
"""

PAR = """#set page(paper: "us-letter", margin: 72pt)
#set text(lang: "en", size: %(size)spt)
#set par(justify: true, first-line-indent: (amount: 1.5em, all: %(all)s), leading: 0.75em)
#set heading(numbering: none)
#show heading: set text(size: %(sub)s)
#show heading.where(level: 1): set text(size: %(top)s)

= First
Alpha beta gamma delta epsilon zeta eta theta iota kappa lambda mu nu xi omicron pi rho sigma tau
upsilon phi chi psi omega alpha beta gamma delta epsilon zeta eta theta iota kappa lambda mu nu.

Second paragraph here, and it keeps going for a while so that the first line is clearly a full one
and the difference in the left edge of the two paragraph openers is easy to read off the page.

== Sub
Third paragraph, again after a heading, with enough words to reach the right margin twice over so
that the measurement is of the first line only and not of a short last line.

Fourth paragraph, this one is not after a heading at all, so it is the control for the indent that
LaTeX really does put on a paragraph that follows another paragraph in the same block of text.
"""

KEEP = ("First", "Alpha", "Second paragraph", "Sub", "Third paragraph", "Fourth paragraph",
        "Table 1:", "one", "two", "Intro", "Trailing", "k")


def render(doc, path):
    src = path[:-4] + ".typ"
    with open(src, "w", encoding="utf-8") as fh:
        fh.write(doc)
    run = subprocess.run(["typst", "compile", src, path], stdout=subprocess.PIPE,
                         stderr=subprocess.PIPE)
    if run.returncode:
        return None, run.stderr.decode("utf-8", "replace")[:160]
    pdf = fitz.open(path)
    rows = []
    for pno in range(pdf.page_count):
        for b in pdf[pno].get_text("dict")["blocks"]:
            if b["type"]:
                continue
            for ln in b["lines"]:
                txt = "".join(s["text"] for s in ln["spans"]).strip()
                if txt:
                    rows.append((pno + 1, round(ln["bbox"][0], 1), round(ln["bbox"][1], 1),
                                 round(ln["spans"][0]["size"], 2), txt))
    pdf.close()
    return rows, ""


def main():
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    print("A. short table, with and without kind: table")
    for kind in ("", "kind: table,"):
        rows, err = render(SHORT % kind, os.path.join(WORK, "kind_short.pdf"))
        if rows is None:
            print("   FAILED %s" % err)
            continue
        print("   %r" % (kind or "no kind",))
        for pno, x0, y0, size, txt in rows:
            if any(txt.startswith(k) for k in KEEP):
                print("      p%d x0=%6.1f y0=%6.1f size=%5.2f  %s" % (pno, x0, y0, size, txt[:40]))

    print("B. first-line-indent and heading sizes")
    variants = [
        ("today: all:true 11.5pt/13pt @11pt", dict(size=11, all="true", sub="11.5pt", top="13pt")),
        ("all:false 11.5pt/13pt @11pt", dict(size=11, all="false", sub="11.5pt", top="13pt")),
        ("all:false %gpt/%gpt @12pt" % (round(12 * 11.5 / 11, 2), round(12 * 13 / 11, 2)),
         dict(size=12, all="false", sub="%gpt" % round(12 * 11.5 / 11, 2),
              top="%gpt" % round(12 * 13 / 11, 2))),
        ("all:false 11.5pt/13pt @12pt", dict(size=12, all="false", sub="11.5pt", top="13pt")),
    ]
    for label, args in variants:
        rows, err = render(PAR % args, os.path.join(WORK, "par_probe.pdf"))
        if rows is None:
            print("   %-36s FAILED %s" % (label, err))
            continue
        print("   %s" % label)
        for pno, x0, y0, size, txt in rows:
            if any(txt.startswith(k) for k in KEEP):
                print("      x0=%6.1f size=%5.2f  %s" % (x0, size, txt[:44]))


if __name__ == "__main__":
    main()
