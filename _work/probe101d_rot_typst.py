r"""#101 leg B: where does OUR `#page_rotate(...) + anchor:` put the words, on a page?

`_work/label100h_rot_anchors.txt` and `_work/label101a_rot_variants.txt` priced pgf's law on both
rungs: it turns the node and then puts the TURNED anchor on the point, so the centre is
`point - R(-theta) * anchor_vector`, `inner sep` enters the box whole (+2*sep on both axes), and the
font size enters only through the box.  What the corpus pages show instead is decided by two things
this probe reads together: the line our own emitter writes for each of those forms, and where the
words of that line land relative to the node's point -- the point being the dot the same picture
`\fill`s at the coordinate.

One picture per form, same body text and same size as the pgf side (`uncapped band` at 10pt), so a
row here and a row of #101a differ by nothing but the engine.  The ruler is #101a's own
`ink_offsets()`, imported, not copied.

  python _work/probe101d_rot_typst.py emit     # print what the emitter writes (no typst)
  python _work/probe101d_rot_typst.py          # render and measure -- > _work/label101d_rot_typst.txt
"""
import io
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
OUT = os.path.join(HERE, "label101d_rot_typst.txt")
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))

import probe101a_rot_variants as p  # noqa: E402  (the same ruler: its ink_offsets)
import probe81_label_box_face as g  # noqa: E402  (the same renderer: its render)
from t2t import cetz  # noqa: E402

# 10pt, so a row is comparable with the pdflatex side, which is standalone's default size.  The
# margins are the whole story of the first run of this probe: with CeTz's origin near the page corner
# a turned label sticks out ABOVE the page, and a page cut reads as a truncated label -- the ink
# bbox's `y0` sitting on 0.0 was the tell.  Room on all four sides, and `clipped()` below says so.
HEAD = (cetz.HEADER + '#set page(width: 40cm, height: 34cm, '
        'margin: (top: 15cm, bottom: 4cm, left: 14cm, right: 4cm))\n'
        '#set text(size: 10pt)\n')
PIC = r"""\begin{tikzpicture}[x=1cm,y=1cm]
  \fill (0,0) circle (1.2pt);
  \node[%s] at (0,0) {uncapped band};
\end{tikzpicture}
"""
# the forms of #100h/#101a, so the two engines are read on the same list
CASES = [
    "rotate=90",
    "anchor=center,rotate=90",
    "anchor=east,rotate=90",
    "anchor=west,rotate=90",
    "anchor=north,rotate=90",
    "anchor=south,rotate=90",
    "anchor=south,rotate=-90",
    "anchor=east,rotate=-90",
    "anchor=south,rotate=90,inner sep=3pt",
    r"anchor=south,rotate=90,font=\footnotesize",
    "anchor=south,rotate=45",
    "anchor=south,rotate=34",
    "anchor=west,rotate=-63",
    "anchor=south",
    "anchor=east",
]


def canvas_of(opt):
    return cetz.build(PIC % opt)


def body_line(canvas):
    """The `content(...)` line the node became -- the emitter's own words, not a guess at them."""
    for line in canvas.splitlines():
        if "content(" in line or "page_rotate" in line:
            return line.strip()
    return "(no content line)"


def page_chars(pdf):
    """The characters the page carries, so a page cut cannot be read as a short label.

    The first run of this probe put CeTz's origin by the page corner and every turned label came back
    missing its tail -- `'uncappe'` for `uncapped band`, with the ink bbox's `y0` at the page edge.
    A row whose chars are not the node's words is a clipped row, and saying so is this gauge's job.
    """
    import fitz
    doc = fitz.open(pdf)
    out = "".join(s["text"] for b in doc[0].get_text("dict")["blocks"]
                  for l in b.get("lines", []) for s in l["spans"])
    doc.close()
    return out


def main():
    emit_only = len(sys.argv) > 1 and sys.argv[1] == "emit"
    lines = ["#101d: our emitter and our page for the rotated-anchor forms -- pt", ""]
    for i, opt in enumerate(CASES):
        canvas = canvas_of(opt)
        if canvas is None:
            lines.append("%-42s REFUSED" % opt)
            continue
        line = body_line(canvas)
        if emit_only:
            lines.append("%-42s %s" % (opt, line))
            continue
        got = g.render(canvas, "m101d_%d" % i, head=HEAD)
        if got is None:
            lines.append("%-42s NO PDF  %s" % (opt, line))
            continue
        _, _, pdf = got
        r = p.ink_offsets(pdf)
        if r is None:
            lines.append("%-42s UNREADABLE  %s" % (opt, line))
            continue
        chars = page_chars(pdf).replace(" ", "")
        if chars != "uncappedband":
            lines.append("%-42s CLIPPED on the page, chars=%r -- not priced" % (opt, chars))
            continue
        w, ht, left, right, top, bottom = r
        lines.append("%-42s ink box %6.2f x %6.2f  left %7.2f right %7.2f top %7.2f bottom %7.2f"
                     % (opt, w, ht, left, right, top, bottom))
        lines.append("%-42s   %s" % ("", line))
    text = "\n".join(lines) + "\n"
    if not emit_only:
        io.open(OUT, "w", encoding="utf-8").write(text)
    print(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
