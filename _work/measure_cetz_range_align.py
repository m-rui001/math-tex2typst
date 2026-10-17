r"""Where does a `content(range, body, frame:)` put its words, and can `#align` move them?

The Kurosh control centres `$j$` in a 12mm box; the product puts it on the box's left border
(`_work/shot_A-Counterexample-to-Kuro_p36.png` vs `_work/latex_kurosh2.png`). The canvas says
`content((6.65, 2.575), (7.85, 3.225), [$j$], frame: "rect")` -- a range, no box, no alignment -- so
the question is whether CeTz lays the body out INSIDE the range (Typst's left-aligned paragraph) or
centres it there. Read the drawn rect and the ink rect off the compiled page and report the text's
centre relative to the frame's, in pt, for each spelling:

  * bare body                      -- what the converter sends today
  * `#align(center)[body]`         -- the fix #39 already uses on the `#box(width:)` path
  * a wide body ("wide label")     -- so a centred short word cannot hide a left-aligned long one
  * `#align(left)` / `#align(right)`
  * the same inside `frame: "circle"`, since the round nodes of this round are drawn the same way

A word whose ink centre sits at the frame centre is centred; at frame-left + half its own width it is
Typst's default paragraph alignment.
"""
import io
import os
import re
import subprocess
import sys
import tempfile

import fitz

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))

TYP = ('#import "@preview/cetz:0.5.0"\n'
       '#set page(width: 220pt, height: 90pt)\n'
       '#cetz.canvas({\n  import cetz.draw: *\n  %s\n})\n')

CASES = [
    ("rect bare", 'content((0, 0), (2, 1), [$j$], frame: "rect")'),
    ("rect center", 'content((0, 0), (2, 1), [#align(center)[$j$]], frame: "rect")'),
    ("rect left", 'content((0, 0), (2, 1), [#align(left)[$j$]], frame: "rect")'),
    ("rect right", 'content((0, 0), (2, 1), [#align(right)[$j$]], frame: "rect")'),
    ("rect bare wide", 'content((0, 0), (2, 1), [wide label], frame: "rect")'),
    ("rect center wide", 'content((0, 0), (2, 1), [#align(center)[wide label]], frame: "rect")'),
    ("rect bare 2 lines", 'content((0, 0), (2, 1), [ab#linebreak()cd],'
                          ' frame: "rect")'),
    ("circle bare", 'content((0, 0), (1, 1), [$j$], frame: "circle")'),
    ("circle center", 'content((0, 0), (1, 1), [#align(center)[$j$]], frame: "circle")'),
    # a body wider than its frame: does centring push ink out symmetrically, or eat one side?
    ("rect center over", 'content((0, 0), (0.6, 0.4), [#align(center)[wide label]],'
                         ' frame: "rect")'),
    ("rect bare over", 'content((0, 0), (0.6, 0.4), [wide label], frame: "rect")'),
    # the vertical half of the same law: is there an align that drops the ink to mid-height?
    ("rect horizon", 'content((0, 0), (2, 1), [#align(center + horizon)[$j$]],'
                     ' frame: "rect")'),
    ("rect horizon 2 lines", 'content((0, 0), (2, 1), [#align(center + horizon)'
                             '[ab#linebreak()cd]], frame: "rect")'),
    ("rect horizon 1cm box", 'content((0, 0), (2, 2), [#align(center + horizon)[$j$]],'
                             ' frame: "rect")'),
    ("point horizon", 'content((0, 0), [#align(center + horizon)[$j$]], frame: "rect")'),
]


def measure(src):
    with tempfile.TemporaryDirectory() as tmp:
        path = os.path.join(tmp, "c.typ")
        open(path, "w", encoding="utf-8").write(src)
        r = subprocess.run(["typst", "compile", path, os.path.join(tmp, "c.pdf")],
                           capture_output=True)
        if r.returncode:
            err = re.sub(r"\s+", " ", r.stderr.decode("utf-8", "replace"))
            return "FAILED " + err[:90]
        doc = fitz.open(os.path.join(tmp, "c.pdf"))
        page = doc[0]
        frame = None
        for d in page.get_drawings():
            rect = d["rect"]
            if rect.width > 3 and rect.height > 3:
                if frame is None or rect.width * rect.height > frame.width * frame.height:
                    frame = rect
        words = page.get_text("words")
        doc.close()  # Windows holds the file open until the handle goes
        if frame is None or not words:
            return "no frame or no words"
        x0 = min(w[0] for w in words)
        x1 = max(w[2] for w in words)
        y0 = min(w[1] for w in words)
        y1 = max(w[3] for w in words)
        ink = (x0 + x1) / 2.0
        fc = (frame.x0 + frame.x1) / 2.0
        yc = (y0 + y1) / 2.0
        fcy = (frame.y0 + frame.y1) / 2.0
        return ("frame %.1f x %.1f  ink %.1f x %.1f  dX %+.1fpt  dY %+.1fpt"
                "  (top %+.1f, bottom %+.1f, left %+.1f, right %+.1f)"
                % (frame.width, frame.height, x1 - x0, y1 - y0, ink - fc, fcy - yc,
                   y0 - frame.y0, frame.y1 - y1, x0 - frame.x0, x1 - frame.x1))


def main():
    for name, body in CASES:
        print("%-18s %s" % (name, measure(TYP % body)))


if __name__ == "__main__":
    main()
