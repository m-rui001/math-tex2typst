r"""#101 leg C (the face leg): the corpus's own 10 rotated nodes, one page per engine.

#101a/#101b priced pgf and #101d priced our engine on a synthetic label (`uncapped band`).  What
closes the round is the same pair of rulers read on the labels the corpus actually writes -- one
page from pdflatex for the node as the author states it, one page from the fixed emitter for the
same statement, and the offsets taken in both cases relative to the dot the picture `\fill`s at the
declared coordinate.   Nothing here is a new gauge: the pgf page is #101b's `run_page()` (its own
`make_tex`, its own stale-pdf guard), the ruler is #101a's `ink_offsets()`, the typst page is
#81's `render()` on #101d's roomy head, and a page cut is refused by geometry (ink box on the page
rectangle) rather than by character matching, because these bodies are math.

  PYTHONIOENCODING=utf-8 python _work/probe101g_rot_face.py 2> _work/m101g_err.txt
      # -> _work/label101g_rot_face.txt
"""
import io
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
OUT = os.path.join(HERE, "label101g_rot_face.txt")
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))

import probe101a_rot_variants as p  # noqa: E402  the ruler
import probe101b_pgf_nodes as b  # noqa: E402  the pgf-side page builder
import probe101d_rot_typst as d  # noqa: E402  the roomy head + page_chars sentinel
import probe81_label_box_face as g  # noqa: E402  the renderer
from t2t import cetz  # noqa: E402

PIC = r"""\begin{tikzpicture}[x=1cm,y=1cm]
  \fill %s circle (1.2pt);
  \node[%s] at %s {%s};
\end{tikzpicture}
"""


def ink_on_page_edge(pdf):
    """A page cut, told from the geometry instead of the characters.

    #101d's `page_chars()` can only be an exact-word test for a known label; these bodies are math,
    and the extraction of `$-x_1$` is not the source string.  An ink box that touches the page
    rectangle is the thing that made the first run of #101d read a clipped label as a short one.
    """
    import fitz
    doc = fitz.open(pdf)
    page = doc[0]
    boxes = [fitz.Rect(s["bbox"]) for bl in page.get_text("dict")["blocks"] for l in bl.get("lines", [])
             for s in l["spans"] if s["text"].strip()]
    rect, r = page.rect, None
    if boxes:
        r = boxes[0]
        for other in boxes[1:]:
            r |= other
    doc.close()
    if r is None:
        return "NO INK"
    for side, near in (("top", r.y0 < 0.5), ("bottom", r.y1 > rect.height - 0.5),
                       ("left", r.x0 < 0.5), ("right", r.x1 > rect.width - 0.5)):
        if near:
            return "CLIPPED at the %s page edge -- not priced" % side
    return None


def read_line(r):
    if r is None:
        return "UNREADABLE"
    w, h, left, right, top, bottom = r
    return ("box %6.2f x %6.2f  left %7.2f right %7.2f top %7.2f bottom %7.2f"
            % (w, h, left, right, top, bottom))


def main():
    rows = []
    for n, ln in enumerate(io.open(b.TSV, encoding="utf-8"), 1):
        parts = ln.rstrip("\n").split("\t")
        if len(parts) == 5 and not ln.startswith("source"):
            rows.append((n,) + tuple(parts))

    lines = ["#101g: the 10 real rotate+anchor nodes on BOTH engines -- pt, ink offsets from the dot",
             "pgf side  = _work/probe101b_pgf_nodes.run_page (standalone, 10pt, same statement alone)",
             "our side  = cetz.build + _work/probe81_label_box_face.render (head of #101d, 10pt)",
             "ruler     = _work/probe101a_rot_variants.ink_offsets (span bbox union; y grows down)",
             "left/right/top/bottom = ink edge minus the dot centre, both engines relative to the "
             "same declared coordinate",
             ""]
    for i, (tsvline, paper, pic, anchor, opt, coord) in enumerate(rows):
        head = "NODE %02d  tsv %d  %s pic=%s  [%s]  at %s" % (i + 1, tsvline, paper[:34], pic, opt, coord)
        hits = [x for x in os.listdir(b.FLAT) if x.startswith(paper[:40])]
        if len(hits) != 1:
            lines.append(head)
            lines.append("  flat hits=%r -> NOSITE/AMBIGUOUS, skipped" % (hits,))
            lines.append("")
            continue
        src = io.open(os.path.join(b.FLAT, hits[0]), encoding="utf-8", errors="replace").read()
        found = b.find_node(src, opt, coord)
        if not found:
            lines.append(head)
            lines.append("  the statement is not in _work/flat/%s -> nothing to price" % hits[0])
            lines.append("")
            continue
        body, srcline, statement = found[0]
        lines.append(head)
        lines.append("  src line %d: %s" % (srcline, b.one_line(statement)))
        if len(found) > 1:
            lines.append("  (%d statements match the same options+coord; the first is priced)" % len(found))

        # -- pgf side
        pgf = b.run_page("m101g_pgf_%02d" % i, opt, body, coord)
        lines.append("  pgf   rc=%s pdf=%s bytes=%s mtime=%s"
                     % (pgf["rc"], os.path.basename(pgf["pdf"]) if pgf["mtime"] else "MISSING",
                        pgf["bytes"], pgf["mtime"]))
        lines.append("        %s" % read_line(pgf["read"]))

        # -- our side: the emitter's own words, on our own page
        canvas = cetz.build(PIC % (coord, opt, coord, body))
        if canvas is None:
            lines.append("  ours  REFUSED by cetz.build")
            lines.append("")
            continue
        line = d.body_line(canvas)
        got = g.render(canvas, "m101g_our_%02d" % i, head=d.HEAD)
        if got is None:
            lines.append("  ours  NO PDF    %s" % line)
            lines.append("")
            continue
        _, _, pdf = got
        ours = p.ink_offsets(pdf)
        cut = ink_on_page_edge(pdf)
        lines.append("  ours  %s" % read_line(ours))
        lines.append("        %s" % line)
        if cut:
            lines.append("        %s" % cut)
            ours = None
        if pgf["read"] and ours:
            pw, ph, pl, pr, pt_, pb = pgf["read"]
            ow, oh, ol, orr, ot, ob = ours
            lines.append("        delta (ours - pgf): box %+6.2f x %+6.2f  left %+6.2f right %+6.2f "
                         "top %+6.2f bottom %+6.2f" % (ow - pw, oh - ph, ol - pl, orr - pr, ot - pt_,
                                                       ob - pb))
        lines.append("")

    text = "\n".join(lines) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(text)
    print(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
