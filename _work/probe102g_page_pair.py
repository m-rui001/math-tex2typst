r"""#102g: does a dash named by pgf reach the PAGE -- one canvas rendered three ways, pixels read.

轴 72's ruling: a key is only proven on the page when one canvas is rendered twice and the two pages'
ink is compared, and the key has to be stripped from EVERY occurrence (leaving one behind on a closed
subpath is a false zero).  Three pages per picture here, because these canvases mix the two names the
emitter already read with the forms this round added:

  fix    -- what the product carries now,
  old    -- the same source through the emitter with `dash_argument` stubbed back to the two bare keys,
  bare   -- the fix's canvas with every `dash:` deleted from every `stroke:` of it.

`fix - old` is this round's ink, `fix - bare` the whole dash family's.  The ink is the dark pixels of
the whole page at 300 dpi, read by the project's own ruler (`probe81.confirmed`), and the assertion
that each pair differs only by `dash:` tokens is made on the strings before rendering.

Seven shapes, all from the corpus: the two compound names, `dash pattern=` with one pair and with two,
`dash dot`, a canvas whose dash spans many paths, and one whose ten dashed rules are all painted
`rgb("#b8b8b8")`.  The gauge counts DARK pixels (grey < 128), so that last canvas moves no ink at all:
the zero there belongs to the paint, not to the law, and the header says so out loud rather than
leaving it as an unexplained negative.

  PYTHONIOENCODING=utf-8 python _work/probe102g_page_pair.py
"""
import glob
import io
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.path.insert(0, HERE)
FLAT = os.path.join(HERE, "flat")
OUT = os.path.join(HERE, "label102g_page_pair.txt")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
DASH = re.compile(r", dash: \"[^\"]*\"|, dash: \((?:[^()]|\([^()]*\))*\)")

import fitz  # noqa: E402
from t2t import cetz  # noqa: E402
import probe81_label_box_face as ruler  # noqa: E402

CASES = [
    ("densely dashed", "A-Linear-Clock-for-Random-Walk-on-Tree", 0),
    ("densely dotted", "A-Counterexample-to-the-Infinite-Matroid", 0),
    ("dash pattern= one pair", "No-bigeodesics-in-planar-first-passage", 0),
    ("dash pattern= two pairs", "Uniform-Interior-C1", 1),
    ("dash dot", "SLE3-universality-for-weak-finite-range", 0),
    ("dash across many paths", "A-Negative-Solution-to-the-Finite-Lattice-Representation-Problem", 1),
    ("dash on light paint", "A-Fully-Polynomial-Randomized-Approximation", 1),
]


def old_law(o, thickness):
    """What `dash_argument` answered before #102: the two bare names, nothing else."""
    if o.get("dashed") is True:
        return '"dashed"'
    if o.get("dotted") is True:
        return '"dotted"'
    return None


def source(prefix, idx):
    hits = sorted(glob.glob(os.path.join(FLAT, prefix + "*.tex")))
    if not hits:
        return None, None
    text = io.open(hits[0], encoding="utf-8", errors="replace").read()
    pics = PIC.findall(text)
    return os.path.basename(hits[0])[:-4], pics[idx] if idx < len(pics) else None


def ink(pdf):
    """Dark pixels of the whole page, from probe81's ruler, plus the page area for scale."""
    doc = fitz.open(pdf)
    area = doc[0].rect
    doc.close()
    return ruler.confirmed(pdf, [fitz.Rect(area)])[0]


def main():
    sys.stdout.reconfigure(errors="replace")
    lines = ["a dash on the page -- one canvas rendered three ways (fix / old law / no dash at all)",
             "ink = dark pixels of the whole page at 300 dpi, read by probe81.confirmed",
             'the gauge counts DARK pixels only, so a dash on a rgb("#b8b8b8") rule moves no ink', ""]
    for case in CASES:
        name, prefix, idx = case
        stem, pic = source(prefix, idx)
        if pic is None:
            lines.append("%-24s NO SOURCE for %r" % (name, prefix))
            continue
        fix = cetz.build(pic)
        saved = cetz.dash_argument
        cetz.dash_argument = old_law
        try:
            old = cetz.build(pic)
        finally:
            cetz.dash_argument = saved
        if fix is None or old is None:
            lines.append("%-24s REFUSED by the emitter" % name)
            continue
        bare = DASH.sub("", fix)
        added = len(DASH.findall(fix)) - len(DASH.findall(old))
        # both pages must be the SAME drawing once every `dash:` is gone, or the two laws differ in
        # more than the dash and the ink difference would not belong to this round
        if DASH.sub("", fix) != DASH.sub("", old) or DASH.findall(bare):
            lines.append("%-24s FIX MOVES MORE THAN THE DASH" % name)
            continue
        pages = []
        for n, (tag, canvas) in enumerate((("fix", fix), ("old", old), ("bare", bare))):
            got = ruler.render(canvas, "g102_%s%d_%d" % (tag, CASES.index(case), n))
            pages.append(None if got is None else ink(got[2]))
        if None in pages:
            lines.append("%-24s COMPILE FAILED" % name)
            continue
        f, o, b = pages
        lines.append("%-24s %s#%d  dash tokens %d->%d (adds %d)"
                     "  ink fix=%d old=%d bare=%d  this round=%+d  family=%+d"
                     % (name, stem[:38], idx, len(DASH.findall(old)), len(DASH.findall(fix)),
                        added, f, o, b, f - o, f - b))
    text = "\n".join(lines) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(text)
    print(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
