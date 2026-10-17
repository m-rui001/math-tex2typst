r"""amsart control for the same two norms measured on article.

682 papers in `_work/flat` use `article` and 42 use `amsart`. `all: false` is right for article --
pdflatex says the paragraph a heading introduces is flush left there -- but AMS classes have their own
`\@afterindent` behaviour and their own heading sizes, so before PRELUDE's `first-line-indent` and the
hard-coded 11.5pt/13pt are changed for every paper, measure the class that is not the majority.
"""
import os
import subprocess
import sys

import fitz

WORK = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "_work")

BODY = r"""
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
"""

KEEP = ("1", "First", "Alpha", "Second paragraph", "1.1", "Sub", "Third paragraph",
        "Fourth paragraph")


def run(cls):
    tex = ("\\documentclass[11pt]{%s}\n\\usepackage[margin=1in]{geometry}\n"
           "\\begin{document}\n\\title{t}\\author{a}\n%s\\end{document}\n"
           % (cls, ("\\maketitle\n" if cls == "amsart" else "") + BODY))
    src = os.path.join(WORK, "class_control.tex")
    with open(src, "w", encoding="utf-8") as fh:
        fh.write(tex)
    pdf_path = os.path.join(WORK, "class_control.pdf")
    if os.path.exists(pdf_path):
        os.remove(pdf_path)
    proc = subprocess.run(["pdflatex", "-interaction=nonstopmode", src], cwd=WORK,
                          stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    if not os.path.exists(pdf_path):
        print("  %s: pdflatex produced no pdf (rc=%d)" % (cls, proc.returncode))
        return
    pdf = fitz.open(pdf_path)
    print("  %s" % cls)
    for b in pdf[0].get_text("dict")["blocks"]:
        if b["type"]:
            continue
        for ln in b["lines"]:
            txt = "".join(s["text"] for s in ln["spans"]).strip()
            if txt and any(txt.startswith(k) for k in KEEP):
                print("     x0=%6.1f size=%5.2f  %s"
                      % (ln["bbox"][0], ln["spans"][0]["size"], txt[:46]))
    pdf.close()
    os.remove(pdf_path)


def main():
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    for cls in ("article", "amsart"):
        run(cls)


if __name__ == "__main__":
    main()
