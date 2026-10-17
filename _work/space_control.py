r"""Line spacing and heading spacing, LaTeX against our own PRELUDE, on the same words.

pdflatex sets \baselineskip from the class (13.6pt for an 11pt article) and puts 3.5ex above a
\section with 2.3ex below; PRELUDE sets `leading: 0.75em` and never touches heading spacing, so both
come out of Typst's own defaults. What a reader sees is the baseline-to-baseline distance and the gap
around a heading, so those are what gets measured here -- from the rendered pages, not from a manual.

Also prints the font each side actually used, because a baseline distance is only comparable between
two documents that set the same typeface.
"""
import os
import subprocess
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
sys.path.insert(0, os.path.join(ROOT, "tools"))

WORDS = ("Alpha beta gamma delta epsilon zeta eta theta iota kappa lambda mu nu xi omicron pi rho "
         "sigma tau upsilon phi chi psi omega alpha beta gamma delta epsilon zeta eta theta iota "
         "kappa lambda mu nu xi omicron pi rho sigma tau upsilon phi chi psi omega alpha beta.")

TEX = r"""\documentclass[11pt]{article}
\usepackage[margin=1in]{geometry}
\begin{document}
%s

\section{First section}
%s

\subsection{A subsection}
%s
\end{document}
""" % (WORDS, WORDS, WORDS)


def lines_of(pdf_path, page=0):
    pdf = fitz.open(pdf_path)
    rows = []
    for b in pdf[page].get_text("dict")["blocks"]:
        if b["type"]:
            continue
        for ln in b["lines"]:
            txt = "".join(s["text"] for s in ln["spans"]).strip()
            if txt:
                rows.append((round(ln["bbox"][1], 2), round(ln["spans"][0]["size"], 2),
                             ln["spans"][0]["font"], txt))
    pdf.close()
    rows.sort()
    return rows


def report(label, rows, heads):
    print(label)
    body = [r for r in rows if r[1] not in heads]
    gaps = [round(b[0] - a[0], 2) for a, b in zip(body, body[1:])]
    print("  font=%s size=%.2f  baseline gaps=%s" % (body[0][2], body[0][1], gaps[:6]))
    for i, r in enumerate(rows):
        if r[1] in heads:
            prev = rows[i - 1][0] if i else r[0]
            nxt = rows[i + 1][0] if i + 1 < len(rows) else r[0]
            print("  heading size=%.2f above=%.2f below=%.2f  %r"
                  % (r[1], round(r[0] - prev, 2), round(nxt - r[0], 2), r[3][:26]))


def latex_side():
    src = os.path.join(WORK, "space_control.tex")
    with open(src, "w", encoding="utf-8") as fh:
        fh.write(TEX)
    subprocess.run(["pdflatex", "-interaction=nonstopmode", src], cwd=WORK,
                   stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    rows = lines_of(os.path.join(WORK, "space_control.pdf"))
    report("pdflatex article 11pt", [r for r in rows if r[3] != "1"], (14.35, 11.96))


def typst_side():
    from t2t import convert, prep
    paper = prep.Preamble()
    paper.geometry = {"margin": "1in"}
    body = convert._prelude(paper)
    body += "\n%s\n\n= First section\n%s\n\n== A subsection\n%s\n" % (WORDS, WORDS, WORDS)
    src = os.path.join(WORK, "space_typst.typ")
    with open(src, "w", encoding="utf-8") as fh:
        fh.write(body)
    run = subprocess.run(["typst", "compile", src], stdout=subprocess.PIPE,
                         stderr=subprocess.PIPE)
    if run.returncode:
        print("typst failed: %s" % run.stderr.decode("utf-8", "replace")[:200])
        return
    report("typst with our PRELUDE",
           [r for r in lines_of(os.path.join(WORK, "space_typst.pdf")) if r[3] != "1"],
           (11.5, 13.0))


def main():
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    latex_side()
    typst_side()


if __name__ == "__main__":
    main()
