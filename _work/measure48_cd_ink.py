r"""What ink box does one of OUR tikzcd labels actually produce, at the size it ships at?

`cd_label_off` hangs a label at ``gap + half the label's own extent along the arrow's normal``, and the
two extents it uses are constants of our own invention: `CD_LABEL_H = 0.35cm` for a one-line label's
height and `cd_width`'s `0.55 + 0.17 * characters` for its width.  tikz-cd's side of that law is
measured (`_work/measure48_cd_bend.py`: a plain label's ink hangs 0.077cm off the shaft, so its centre
is 0.077 + half of its own height away).  To copy the law rather than its number I have to know what
*our* labels measure -- a canvas in a paper's `main.typ` inherits `#set text(size: 11pt)`, not a
diagram scale of its own.

The label bodies are taken out of the canvases `build_cd` really emits, so the strings are the ones the
converter writes (after pandoc's math conversion, not the author's TeX), and each is re-drawn alone at a
spacious row under the product's own page head.  A phrase comes out as several words on the page, so the
ink of one label is the y-cluster of words whose gaps are under a third of a centimetre; the cluster's
box is what the offset law has to clear.
"""
import io
import os
import re
import subprocess
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace", newline="")
from t2t import cetz  # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))
TMP = os.path.join(HERE, "_m48ink")
CM = 0.0352778
HEAD = ('#import "@preview/cetz:0.5.0"\n'
        '#set page(width: 20cm, height: 60cm, margin: (x: 72.3pt, y: 72.3pt))\n'
        '#set text(lang: "en", size: 11pt)\n')
CONTENT = re.compile(r"content\(\([^)]*\), \[\$([^$]*)\$\]\)")

CASES = [
    ("bare arrow", 'A \\arrow[r] & B'),
    ("f", 'A \\arrow[r,"f"] & B'),
    ("two letters", 'A \\arrow[r,"ab"] & B'),
    ("ten letters", 'A \\arrow[r,"abcdefghij"] & B'),
    ("phrase", 'A \\arrow[r,"group and residue duality"] & B'),
    ("greek pi", 'A \\arrow[r,"\\pi"] & B'),
    ("subscript", 'A \\arrow[r,"X_1"] & B'),
    ("fraction", 'A \\arrow[r,"a / b"] & B'),
    ("cell A", 'A \\arrow[r] & B'),
    ("long cell", 'A \\arrow[r] & M_{n}(R)'),
]


def clusters(canvas, name):
    """The ink boxes of the canvas's labels, top to bottom, as (text, width, height, glyph box).

    Two boxes are read for each label: the box Typst reports for the text (`words`, which at 11pt is
    the whole line's height, 0.388cm for a single letter) and the box of the *dark pixels* the page
    actually puts down, from a 300 dpi render.  The second is what the offset law has to clear,
    because it is on tikz-cd's side of the comparison -- its label box there measured 0.137 x 0.246cm
    (`_work/measure48_cd_bend.py`), which is a font box, not ink.  Glyph *outlines* are not an option:
    Typst ships text as text, and `get_drawings()` under a label holds nothing but the diagram's own
    strokes, which is why the first cut of this probe printed `glyph ink none` on all 27 rows.
    """
    os.makedirs(TMP, exist_ok=True)
    path = os.path.join(TMP, name + ".typ")
    open(path, "w", encoding="utf-8").write(HEAD + canvas + "\n")
    done = subprocess.run(["typst", "compile", "--root", ROOT, name + ".typ"], cwd=TMP,
                          capture_output=True, text=True, encoding="utf-8", errors="replace")
    pdf = os.path.join(TMP, name + ".pdf")
    if not os.path.exists(pdf):
        raise RuntimeError("typst refused the canvas:\n" + done.stdout + done.stderr)
    doc = fitz.open(pdf)
    words = sorted([(w[4], fitz.Rect(w[:4])) for w in doc[0].get_text("words")],
                   key=lambda w: (w[1].y0, w[1].x0))
    got = []
    for g in _group(words):
        top = min(x.y0 for _, x in g)
        bottom = max(x.y1 for _, x in g)
        band = fitz.Rect(min(x.x0 for _, x in g) - 3, top - 3,
                         max(x.x1 for _, x in g) + 3, bottom + 3) & doc[0].rect
        got.append((" ".join(t for t, _ in g),
                    (max(x.x1 for _, x in g) - min(x.x0 for _, x in g)) * CM,
                    (bottom - top) * CM,
                    _dark_box(doc[0].get_pixmap(dpi=300, clip=band))))
    doc.close()
    return got


def _group(words):
    """Words whose vertical gap is under a third of a centimetre: one label's worth."""
    out, group = [], []
    for txt, r in words:
        if group and (r.y0 - group[-1][1].y1) / CM > 0.35:
            out.append(group)
            group = []
        group.append((txt, r))
    if group:
        out.append(group)
    return out


def _dark_box(pix):
    """(width, height) in cm of the dark pixels of a pixmap, or None when it holds none."""
    samples = pix.samples
    n = pix.n
    xs, ys = [], []
    for y in range(pix.height):
        row = y * pix.stride
        for x in range(pix.width):
            px = samples[row + x * n:row + x * n + n]
            if any(c < 128 for c in px):
                xs.append(x)
                ys.append(y)
    if not xs:
        return None
    scale = CM * 72 / 300  # one pixel of a 300 dpi render, in cm
    return ((max(xs) - min(xs) + 1) * scale, (max(ys) - min(ys) + 1) * scale)


def main():
    bodies = []
    for name, body in CASES:
        core = cetz.strip_envelope("\\begin{tikzcd}" + body + "\\end{tikzcd}")
        canvas = cetz.build_cd(core)
        if not canvas:
            print("%-14s refused" % name)
            continue
        for spell in CONTENT.findall(canvas):
            if (name, spell) not in bodies:
                bodies.append((name, spell))
    spots = "\n  ".join("content((8, %.1f), [$%s$])" % (-1.5 * i, spell)
                        for i, (_n, spell) in enumerate(bodies))
    canvas = "#cetz.canvas({\n  import cetz.draw: *\n  " + spots + "\n})"
    print("== the labels build_cd writes for these %d cases, drawn alone at 11pt" % len(bodies))
    got = clusters(canvas, "labels")
    for i, (txt, w, h, box) in enumerate(got):
        name, spell = bodies[i]
        print("   %-14s '$%s$'  text box %.3f x %.3f   glyph ink %s   cd_width %.3f"
              % (name, spell, w, h,
                 "%.3f x %.3f" % box if box else "none", cetz.cd_width(spell)))
    print("== CD_LABEL_H %.2f cm, cd_width 0.55 + 0.17 * characters; %d ink rows for %d labels"
          % (cetz.CD_LABEL_H, len(got), len(bodies)))


if __name__ == "__main__":
    main()
