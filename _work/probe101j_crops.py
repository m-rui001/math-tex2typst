r"""#101 leg F (the picture leg): the rotated labels looked at, at 300 dpi, on both engines.

#101g priced the corpus's own rotated nodes with a ruler (`_work/label101g_rot_face.txt`), and a
ruler is not a picture -- the standing rule for a round that moves figures is to close it with
rendered pages, and a displacement of a few pt is exactly what a 150 dpi full page cannot show
(`_work/probe100k_fixed_crops.py` is the template: one canvas, cropped to its ink at 300 dpi, with
the engine beside it).

Two populations, because the round touched both:
  * the 12 `rotate=`+`anchor=` statements of `_work/m100_rot_anchor.tsv`, each rendered alone on
    pdflatex (`probe101b.run_page`) and alone on our emitter (`cetz.build` + `probe81.render`);
  * the canvas §7 had on file for this law -- `A-Linear-Clock-for-Random-Walk...#0`, whose two
    labels moved 5.04 and 4.80 -- rendered whole from `typst/` next to the pdflatex control page the
    control leg already wrote under `_work/cmp/`.

Nothing here measures: it prints the files and their crops, and the eyes do the rest.

  PYTHONIOENCODING=utf-8 python _work/probe101j_crops.py 2> _work/m101j_err.txt
      # -> _work/m101j_*.png   (look, then delete)
"""
import io
import os
import re
import sys

import fitz

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
CMP = os.path.join(HERE, "cmp")
OUT = os.path.join(HERE, "label101j_crops.txt")
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))

import probe101b_pgf_nodes as b  # noqa: E402  the tsv and the pgf-side page builder
import probe101d_rot_typst as d  # noqa: E402  the roomy head
import probe81_label_box_face as g  # noqa: E402  the renderer
from probe100i_page_pair import ink_box  # noqa: E402
from t2t import cetz  # noqa: E402

DPI = 300.0 / 72.0
PIC = r"""\begin{tikzpicture}[x=1cm,y=1cm]
  \fill %s circle (1.2pt);
  \node[%s] at %s {%s};
\end{tikzpicture}
"""
# the canvas §7 filed for this law, by prefix: a paper directory's date suffix is not to be written
# from memory (`_work` registry: names can only be globbed)
FILED = ("A-Linear-Clock-for-Random-Walk", 0)


def stem_for(prefix):
    hits = [x for x in os.listdir(os.path.join(ROOT, "typst")) if x.startswith(prefix)]
    assert len(hits) == 1, (prefix, hits)
    return hits[0]


def crop(pdf, out):
    doc = fitz.open(pdf)
    page = doc[0]
    box = ink_box(page)
    if box.is_empty:
        doc.close()
        return "no ink"
    box = fitz.Rect(box.x0 - 6, box.y0 - 6, box.x1 + 6, box.y1 + 6) & page.rect
    page.get_pixmap(matrix=fitz.Matrix(DPI, DPI), clip=box).save(out)
    doc.close()
    return "%dx%d px  ink %.2f x %.2f pt" % (box.width * DPI, box.height * DPI,
                                             box.width, box.height)


def main():
    sys.stdout.reconfigure(errors="replace")
    lines = ["#101j: the rotated labels as pictures -- 300 dpi crops, pgf beside ours", ""]

    rows = []
    for n, ln in enumerate(io.open(b.TSV, encoding="utf-8"), 1):
        parts = ln.rstrip("\n").split("\t")
        if len(parts) == 5 and not ln.startswith("source"):
            rows.append((n,) + tuple(parts))
    for i, (tsvline, paper, pic, anchor, opt, coord) in enumerate(rows):
        hits = [x for x in os.listdir(b.FLAT) if x.startswith(paper[:40])]
        lines.append("NODE %02d  tsv %d  %s  [%s] at %s" % (i + 1, tsvline, paper[:34], opt, coord))
        if len(hits) != 1:
            lines.append("  flat hits=%r -> NOSITE, skipped" % (hits,))
            lines.append("")
            continue
        src = io.open(os.path.join(b.FLAT, hits[0]), encoding="utf-8", errors="replace").read()
        found = b.find_node(src, opt, coord)
        if not found:
            lines.append("  statement not in the flat source -> nothing to draw")
            lines.append("")
            continue
        body = found[0][0]
        pgf = b.run_page("m101j_pgf_%02d" % i, opt, body, coord)
        if pgf["mtime"] and pgf["pdf"]:
            lines.append("  pgf   " + crop(pgf["pdf"], os.path.join(HERE, "m101j_%02d-pgf.png" % i)))
        else:
            lines.append("  pgf   NO PAGE  rc=%s" % pgf["rc"])
        canvas = cetz.build(PIC % (coord, opt, coord, body))
        if canvas is None:
            lines.append("  ours  REFUSED by cetz.build")
            lines.append("")
            continue
        got = g.render(canvas, "m101j_our_%02d" % i, head=d.HEAD)
        if got is None:
            lines.append("  ours  NO PDF   %s" % d.body_line(canvas))
        else:
            lines.append("  ours  " + crop(got[2], os.path.join(HERE, "m101j_%02d-our.png" % i)))
            lines.append("        %s" % d.body_line(canvas))
        lines.append("")

    stem, k = FILED
    full = stem_for(stem)
    canv = g.canvases().get((full, k))
    san = re.sub(r"[^A-Za-z0-9]", "_", full)[:40]
    lines.append("FILED CANVAS  %s#%d" % (full[:52], k))
    if canv is None:
        lines.append("  not in the census population")
    else:
        got = g.render(canv[1], "m101j_filed", head=canv[0])
        if got is None:
            lines.append("  ours  NO PDF")
        else:
            lines.append("  ours  " + crop(got[2], os.path.join(HERE, "m101j_filed-our.png")))
        ctl = os.path.join(CMP, "%s-%d.pdf" % (san, k))
        lines.append("  ctl   " + (crop(ctl, os.path.join(HERE, "m101j_filed-ctl.png"))
                                   if os.path.isfile(ctl) else "NO CONTROL PAGE at cmp/"))

    text = "\n".join(lines) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(text)
    print(text)
    for name in os.listdir(g.TMP):
        if name.startswith("m101j"):
            os.remove(os.path.join(g.TMP, name))
    return 0


if __name__ == "__main__":
    sys.exit(main())
