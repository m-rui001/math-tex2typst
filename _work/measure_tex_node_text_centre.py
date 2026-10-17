r"""Where does TeX put a node's words inside a box whose size the author wrote down?

The Typst side is measured (`_work/measure_cetz_range_align.py`): a `content(range, body, frame:)`
lays its body at the range's TOP-LEFT (dX -26.1pt, dY +11.2pt for a 4.5pt word in a 2cm x 1cm box),
and `#align(center + horizon)` lands it dead in the middle (dX -0.1, dY -0.4). Whether that is the
rule to copy is TeX's call, so each node is drawn in a standalone document and both the frame's rect
and the ink's rect are read off the compiled page:

  * `minimum width=2cm, minimum height=1cm`          -- the sized node every flowchart uses
  * the same with two lines                          -- does a paragraph still sit mid-height?
  * `text width=2cm, minimum height=1cm`             -- the ragged-left case #39 kept ragged-left
  * `text width=2cm, align=center, minimum height=1cm`
  * a `circle, minimum size=1cm`                     -- the round case of this round
  * a node with no declared measure                  -- the reference: ink == frame

dX/dY are the ink's centre minus the frame's centre, positive dY meaning the ink sits ABOVE the
middle (fitz counts y downwards). The frame is the drawn rect, the ink every glyph on the page.
"""
import io
import os
import re
import subprocess
import sys
import tempfile

import fitz

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
PRE = (r"\documentclass[tikz,border=12pt]{standalone}\usepackage{tikz}" "\n\\begin{document}\n")

CASES = [
    ("min 2x1", r"\node[draw, minimum width=2cm, minimum height=1cm] at (0,0) {j};"),
    ("min 2x1 2 lines", r"\node[draw, minimum width=2cm, minimum height=1cm] at (0,0) "
                        r"{ab cd ef gh ij kl mn};"),
    ("textwidth", r"\node[draw, text width=2cm, minimum height=1cm] at (0,0) "
                  r"{ab cd ef gh ij kl mn};"),
    ("textwidth center", r"\node[draw, text width=2cm, align=center, minimum height=1cm] at (0,0) "
                         r"{ab cd ef gh ij kl mn};"),
    ("circle 1cm", r"\node[draw, circle, minimum size=1cm] at (0,0) {j};"),
    ("unsized", r"\node[draw] at (0,0) {j};"),
]


def measure(body):
    src = PRE + "\\begin{tikzpicture}\n" + body + "\n\\end{tikzpicture}\n\\end{document}\n"
    with tempfile.TemporaryDirectory() as tmp:
        path = os.path.join(tmp, "t.tex")
        open(path, "w", encoding="utf-8").write(src)
        r = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-output-directory",
                            tmp, path], capture_output=True)
        if r.returncode:
            return "FAILED " + re.sub(r"\s+", " ", r.stdout.decode("utf8", "replace"))[-90:]
        doc = fitz.open(os.path.join(tmp, "t.pdf"))
        page = doc[0]
        frame = None
        for d in page.get_drawings():
            rect = d["rect"]
            if rect.width > 3 and rect.height > 3:
                if frame is None or rect.width * rect.height > frame.width * frame.height:
                    frame = rect
        words = page.get_text("words")
        doc.close()
        if frame is None or not words:
            return "no frame (%s)" % ("yes" if frame else "no")
        x0 = min(w[0] for w in words)
        x1 = max(w[2] for w in words)
        y0 = min(w[1] for w in words)
        y1 = max(w[3] for w in words)
        return ("frame %5.1f x %5.1f  ink %5.1f x %5.1f  dX %+6.2f  dY %+6.2f"
                "  (top %+6.2f, bottom %+6.2f, left %+6.2f, right %+6.2f)"
                % (frame.width, frame.height, x1 - x0, y1 - y0,
                   (x0 + x1) / 2 - (frame.x0 + frame.x1) / 2,
                   (frame.y0 + frame.y1) / 2 - (y0 + y1) / 2,
                   y0 - frame.y0, frame.y1 - y1, x0 - frame.x0, x1 - frame.x1))


def main():
    for name, body in CASES:
        print("%-18s %s" % (name, measure(body)))


if __name__ == "__main__":
    main()
