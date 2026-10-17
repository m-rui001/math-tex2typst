r"""What a `text width=` node's frame really is, and where its text sits inside it.

§7's remaining figure defect is that `box_args` never sends a `width:` for a node whose author
wrote `text width=4cm`, so Typst draws a frame that hugs the words instead of the declared
paragraph. Before the converter can promise a number it has to know which of two readings TeX
takes -- is the declared dimension the TEXT paragraph, with the frame `+ 2*inner sep` outside it,
or the frame itself, with the paragraph squeezed inside -- and whether a short line sits at the
left edge, centred, or wherever `align=` says.

pdflatex draws each case and fitz reads the page: the stroked rectangle's width, and the gap from
its left edge to the first glyph and from the last glyph to its right edge. A glyph gap of ~0 on
one side and a large one on the other is a left-aligned paragraph; equal gaps are a centred one.
"""
import os
import re
import subprocess
import sys
import tempfile

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(errors="replace")

CM = 28.3465
CASES = [
    # name, node options, label
    ("tw4cm-short", "text width=4cm,draw", "ab"),
    ("tw4cm-sep0", "text width=4cm,draw,inner sep=0pt", "ab"),
    ("tw4cm-sep8", "text width=4cm,draw,inner sep=8pt", "ab"),
    ("tw4cm-left", "text width=4cm,draw,align=left", "ab"),
    ("tw4cm-center", "text width=4cm,draw,align=center", "ab"),
    ("tw4cm-right", "text width=4cm,draw,align=right", "ab"),
    ("tw4cm-2rows", "text width=4cm,draw", "aaaaaaaaaa\\\\bbbbbbbbbb"),
    ("tw2cm-long", "text width=2cm,draw",
     "aaaaaaaaaa bbbbbbbbbb cccccccccc dddddddddd"),
    ("tw4cm-align-top", "text width=4cm,draw,align=top", "ab"),
    ("tw4cm-align-below", "text width=4cm,draw,align=below", "ab"),
    ("tw4cm-align-mid", "text width=4cm,draw,align=mid", "ab"),
    ("tw4cm-align-right-top", "text width=4cm,draw,align=right top", "ab"),
    ("tw2cm-sep0-left", "text width=2cm,draw,inner sep=0pt", "aaaaaaaaaa bbbbbbbbbb cccccccccc"),
    ("mw4cm", "minimum width=4cm,draw", "ab"),
    ("bare", "draw", "ab"),
]

DOC = r"""\documentclass[10pt]{article}
\usepackage{tikz}
\begin{document}
%(body)s
\end{document}
"""


def picture(case):
    name, opts, label = case
    return (r"\begin{tikzpicture}[baseline]\node[%s] (%s) at (0,0) {%s};%%"
            "\n\\typeout{CASE %s}\n\\end{tikzpicture}\n" % (opts, name, label, name))


def measure(page):
    """(frame width, left glyph gap, right glyph gap) for the single rect on the page."""
    rects = []
    for path in page.get_drawings():
        r = path["rect"]
        if r.width > 10 and r.height > 5 and r.width < 300:
            rects.append(r)
    if not rects:
        return None
    rect = max(rects, key=lambda r: r.width * r.height)
    words = [w for w in page.get_text("words") if w[1] > rect.y0 - 2 and w[3] < rect.y1 + 2]
    if not words:
        return (rect.width, None, None)
    left = min(w[0] for w in words)
    right = max(w[2] for w in words)
    return (rect.width, left - rect.x0, rect.x1 - right)


def main():
    with tempfile.TemporaryDirectory() as tmp:
        body = "\n".join(picture(c) + "\n\\clearpage\n" for c in CASES)
        tex = os.path.join(tmp, "tw.tex")
        open(tex, "w", encoding="utf-8").write(DOC.replace("%(body)s", body))
        subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory", tmp, tex],
                       capture_output=True)
        doc = fitz.open(os.path.join(tmp, "tw.pdf"))
        print("%-14s %9s | %8s %8s %8s" % ("case", "frame/cm", "Lgap/cm",
                                               "Rgap/cm", "text/cm"))
        for i, case in enumerate(CASES):
            if i >= doc.page_count:
                print("%-14s  (no page)" % case[0])
                continue
            got = measure(doc[i])
            if got is None:
                print("%-14s  (no frame found)" % case[0])
                continue
            w, lg, rg = got
            fmt = lambda v: "%8.3f" % (v / CM) if v is not None else "     n/a"
            text = (w - lg - rg) / CM if lg is not None else float("nan")
            print("%-14s %9.3f | %8s %8s %8.3f"
                  % (case[0], w / CM, fmt(lg), fmt(rg), text))
            print("               declared=%s" % case[1][:34])
        doc.close()


if __name__ == "__main__":
    main()
