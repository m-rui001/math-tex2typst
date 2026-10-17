r"""#103d: does the anchored node's own box reach the PAGE -- one canvas rendered twice, pixels read.

轴 72's ruling: a key is only proven on the page when one canvas is rendered twice and the two pages'
ink is compared. Here the two pages are the two laws, and neither is a synthetic form:

  now  -- the canvas as the product under `typst/` carries it (run151, the old law: the default `inner
          sep` written as 0.1cm, and an unturned anchored label given no pad at all),
  fix  -- the same source picture through the emitter as it stands after #103 (the pad priced at the
          class size, on EVERY node that names an anchor, turned or not).

`fix - now` is this round's ink. Before rendering, the two canvas strings are proved to differ by
`padding:` tokens and nothing else, so a difference in ink can only be the pad.

The third page is the control: the author's own picture compiled by pdflatex (`compare_figure.control`
at the paper's own body size, the rule 轴 67 wrote), cropped beside the two pages at 300 dpi for the
eyes -- the standing requirement that a round which moves figures be closed by looking at them.

  PYTHONIOENCODING=utf-8 python _work/probe103d_page_pair.py
      # -> _work/label103d_page_pair.txt and _work/m103d_*.png (look, then delete)
"""
import io
import os
import re
import sys

import fitz

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
FLAT = os.path.join(ROOT, "_work", "flat")
PROD = os.path.join(ROOT, "typst")
NEW = os.path.join(ROOT, "_work", "_m103c_out")
CMP = os.path.join(HERE, "cmp")
OUT = os.path.join(HERE, "label103d_page_pair.txt")
PAD = re.compile(r", padding: [0-9.a-z]+")
SCALE = 300.0 / 72.0
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))

import compare_figure  # noqa: E402
import probe81_label_box_face as ruler  # noqa: E402
import probe84_control_face as ctl  # noqa: E402  body_size, the picture's own font tier

# (prefix, canvas index, what this canvas is on the page) -- names globbed, never written from memory
CASES = [
    ("A-Charged-Reduction-of-the-Spacetime-Penrose-Inequality-in", 0,
     "west/south labels, `every node/.style={inner sep=2pt}`"),
    ("A-Coulomb-Ground-State-Density-without-Kohn-Sham-Ensemble-", 0,
     "west/east/south/north labels on the default sep"),
    ("A-CH-Obstruction-to-a-Prescribed-Categoricity-Threshold-Se", 0,
     "row/column labels pinned west and north"),
]


def ink(pdf):
    """Dark pixels of the whole page, from probe81's ruler, plus the page area for scale."""
    doc = fitz.open(pdf)
    area = doc[0].rect
    doc.close()
    return ruler.confirmed(pdf, [fitz.Rect(area)])[0]


def crop_to(pdf, out, clip=None):
    """The figure's ink at 300 dpi, its box taken from the project's own cropper."""
    doc = fitz.open(pdf)
    page = doc[0]
    box = compare_figure.crop(pdf, 0, out + ".probe.png")
    if box is None:
        doc.close()
        return None
    page.get_pixmap(matrix=fitz.Matrix(SCALE, SCALE),
                    clip=clip or box).save(out)
    doc.close()
    if os.path.exists(out + ".probe.png"):
        os.remove(out + ".probe.png")
    return box


def main():
    sys.stdout.reconfigure(errors="replace")
    lines = ["one canvas, two laws, the ink of the whole page at 300 dpi (probe81.confirmed)",
             "now = the product as shipped (run151)   fix = the same canvas regenerated through #103",
             "ctl = the author's picture as pdflatex draws it, at the paper's own body size",
             "both pages are laid out under the product's own header, so the two laws share a font",
"`stripped` is False only where a declared measure also grew by two seps (#box(width:)",
             ""]
    for prefix, idx, note in CASES:
        hits = [x for x in os.listdir(PROD) if x.startswith(prefix)]
        assert len(hits) == 1, (prefix, hits)
        stem = hits[0]
        path = os.path.join(PROD, stem, "main.typ")
        new = os.path.join(NEW, stem, "main.typ")
        src = os.path.join(FLAT, stem + ".tex")
        prod = io.open(path, encoding="utf-8").read()
        head = ruler.header_of(prod)
        old = block_at(prod, idx)
        built = io.open(new, encoding="utf-8").read() if os.path.isfile(new) else ""
        if old is None or not built or not os.path.isfile(src):
            lines.append("%s#%d  NO PAIR (product canvas %s / regenerated %s / flat source %s)"
                         % (stem[:44], idx, old is not None, bool(built), os.path.isfile(src)))
            continue
        # source order is the matcher, and it is only the matcher while nothing was dropped between
        # source and page (probe84's rule): two products and the author's pictures must all agree
        # on how many drawings this paper has, or the two canvases are not the same drawing
        counts = (prod.count("#cetz.canvas("), built.count("#cetz.canvas("),
                  len(compare_figure.PIC.findall(
                      io.open(src, encoding="utf-8", errors="replace").read())))
        if len(set(counts)) != 1:
            lines.append("%s#%d  canvases shipped %d / regenerated %d / source pictures %d"
                         % (stem[:44], idx, counts[0], counts[1], counts[2]))
            continue
        fix = block_at(built, idx)
        pads_old, pads_fix = len(PAD.findall(old)), len(PAD.findall(fix))
        same = PAD.sub("", old) == PAD.sub("", fix)
        po = ruler.render(old, "g103d_now%d" % idx, head=head)
        pf = ruler.render(fix, "g103d_fix%d" % idx, head=head)
        if po is None or pf is None:
            lines.append("%s#%d  COMPILE FAILED" % (stem[:44], idx))
            continue
        i_now, i_fix = ink(po[2]), ink(pf[2])
        size = ctl.body_size(head)
        os.makedirs(CMP, exist_ok=True)
        cpdf, _ = compare_figure.control(src, idx, [], size)
        shots = []
        for tag, pdf in (("ctl", cpdf), ("now", po[2]), ("fix", pf[2])):
            if not pdf:
                continue
            out = os.path.join(HERE, "m103d_%s%d_%s.png" % (prefix[:10], idx, tag))
            shots.append(tag if crop_to(pdf, out) else "%s(no ink)" % tag)
        lines.append("%s#%d  %s" % (stem[:44], idx, note))
        lines.append("        padding: tokens %d -> %d  (%+d)   pages identical once pads are "
                     "stripped: %s" % (pads_old, pads_fix, pads_fix - pads_old, same))
        lines.append("        ink now=%d fix=%d  this round=%+d   body %spt   crops: %s"
                     % (i_now, i_fix, i_fix - i_now, size, " ".join(shots)))
        lines.append("        pad spellings fixed: %s"
                     % ", ".join(sorted(set(PAD.findall(fix)))))
        lines.append("")
    text = "\n".join(lines) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(text)
    print(text)
    return 0


def block_at(text, idx):
    """The idx-th `#cetz.canvas(...)` of a product, bracket-matched by the census's own reader."""
    blocks = ruler.canvas_blocks(text)
    return blocks[idx] if idx < len(blocks) else None


if __name__ == "__main__":
    sys.exit(main())
