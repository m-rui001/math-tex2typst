r"""Three legs about paragraph-level typesetting norms.

Leg A asks pdflatex what LaTeX does with the first paragraph after a section heading: Typst's
`first-line-indent: (amount: 1.5em, all: true)` in PRELUDE indents *every* paragraph, including the
one a heading just introduced, and if LaTeX does not, that rule is a fidelity defect on every page of
all 724 papers.

Leg B scans the product PDFs for a heading that is the last ink on its page (LaTeX forbids that with
`\@afterheading`; Typst has no keep-with-next on a bare `heading`).

Leg C asks typst whether `par(orphan-control:)` exists at all, so a widow/orphan fix is only filed if
the primitive is there to use.

Leg D reads each product's own `#set text(size: …)` and compares it with the two heading sizes PRELUDE
hard-codes (11.5pt / 13pt): a heading that is not visibly larger than the body it heads is a norm
violation, and PRELUDE never looks at the paper's font size.
"""
import os
import re
import subprocess
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
TYPST_DIR = os.path.join(ROOT, "typst")

TEX = r"""\documentclass[11pt]{article}
\usepackage[margin=1in]{geometry}
\begin{document}
\section{First}
Alpha beta gamma delta epsilon zeta eta theta iota kappa lambda mu nu xi omicron pi rho sigma tau
upsilon phi chi psi omega alpha beta gamma delta epsilon zeta eta theta iota kappa lambda mu nu.

Second paragraph here, and it keeps going for a while so that the first line is clearly a full one
and the difference in the left edge of the two paragraph openers is easy to read off the page.

\subsection{Sub}
Third paragraph, again after a heading, with enough words to reach the right margin twice over so
that the measurement is of the first line only and not of a short last line.

Fourth paragraph, this one is not after a heading at all, so it is the control for the indent that
LaTeX really does put on a paragraph that follows another paragraph in the same block of text.
\end{document}
"""

TEXT_SIZE = re.compile(r"#set text\(lang: \"en\", size: ([0-9.]+)pt\)")
HEAD_SIZES = (11.5, 13.0)


def leg_a():
    src = os.path.join(WORK, "indent_control.tex")
    with open(src, "w", encoding="utf-8") as fh:
        fh.write(TEX)
    subprocess.run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error", src], cwd=WORK,
                   stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    pdf = fitz.open(os.path.join(WORK, "indent_control.pdf"))
    for b in pdf[0].get_text("dict")["blocks"]:
        if b["type"]:
            continue
        for ln in b["lines"]:
            txt = "".join(s["text"] for s in ln["spans"])
            print("  x0=%6.1f size=%5.2f  %s"
                  % (ln["bbox"][0], ln["spans"][0]["size"], txt[:56]))
    pdf.close()


def page_lines(page):
    out = []
    for b in page.get_text("dict")["blocks"]:
        if b["type"]:
            continue
        for ln in b["lines"]:
            txt = "".join(s["text"] for s in ln["spans"]).strip()
            if txt:
                out.append((fitz.Rect(ln["bbox"]), txt, max(s["size"] for s in ln["spans"])))
    return out


def leg_b(limit=12):
    flagged = []
    for name in sorted(os.listdir(TYPST_DIR)):
        pdf_path = os.path.join(TYPST_DIR, name, "main.pdf")
        if not os.path.exists(pdf_path):
            continue
        pdf = fitz.open(pdf_path)
        for pno in range(pdf.page_count):
            page = pdf[pno]
            # the page number sits in the bottom margin; only ink above it counts
            lines = [l for l in page_lines(page) if l[0].y1 < page.rect.height - 60]
            if len(lines) < 3:
                continue
            bottom = max(lines, key=lambda l: l[0].y1)
            if bottom[2] in HEAD_SIZES and bottom[1] not in ("References",):
                flagged.append((name, pno + 1, bottom[2], bottom[1]))
        pdf.close()
    print("headings left alone at the bottom of a page: %d" % len(flagged))
    for f in flagged[:limit]:
        print("  %s p%d (%.1fpt) %r" % (f[0][:46], f[1], f[2], f[3][:60]))


def leg_c():
    for src in ("#set par(orphan-control: 2)\nHello\n", "#set par(widow-control: 2)\nHello\n"):
        path = os.path.join(WORK, "orphan_probe.typ")
        with open(path, "w", encoding="utf-8") as fh:
            fh.write(src)
        run = subprocess.run(["typst", "compile", path, os.path.join(WORK, "orphan_probe.pdf")],
                             stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        print("  %-38s rc=%d %s" % (src.splitlines()[0], run.returncode,
                                     run.stderr.decode("utf-8", "replace").strip()[:100]))


def leg_d():
    tally = {}
    weak = []
    for name in sorted(os.listdir(TYPST_DIR)):
        typ = os.path.join(TYPST_DIR, name, "main.typ")
        if not os.path.exists(typ):
            continue
        got = TEXT_SIZE.search(open(typ, encoding="utf-8").read(4000))
        size = float(got.group(1)) if got else None
        tally[size] = tally.get(size, 0) + 1
        if size is not None and size >= min(HEAD_SIZES):
            weak.append((name, size))
    print("body font sizes: %s" % sorted((k, v) for k, v in tally.items() if k))
    print("papers whose body is at least as large as a heading: %d" % len(weak))
    for w in weak[:10]:
        print("  %s body=%.1fpt" % (w[0][:56], w[1]))


def main():
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    print("A. pdflatex control: x0 of each line (text block starts at 72.3)")
    leg_a()
    print("C. typst primitives")
    leg_c()
    print("D. body size vs hard-coded heading sizes")
    leg_d()
    print("B. product scan")
    leg_b()


if __name__ == "__main__":
    main()
