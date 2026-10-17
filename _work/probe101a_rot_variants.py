"""The two rungs the corpus actually writes but `probe100h` never measured: `inner sep` and font size.

`_work/label100h_rot_anchors.txt` priced the turned-anchor law on 11 forms, all of them
`inner sep=0pt` at the default size.  Two of the ten face nodes (`_work/m100_rot_anchor.tsv`) write
`inner sep=3pt` and `font=\footnotesize`, so before emitting an offset we have to know whether pgf's
anchor vector is measured on the box **including** sep and size -- and whether it enters half, whole,
or not at all.  The columns therefore print the box's own growth next to the offset's growth.

  python _work/probe101a_rot_variants.py        # -> _work/label101a_rot_variants.txt
"""
import io
import os
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
OUT = os.path.join(HERE, "label101a_rot_variants.txt")
sys.path.insert(0, HERE)

import probe100h_rot_anchors as h  # noqa: E402  (the same gauge: its measure(), not a private copy)

TEX = r"""\documentclass[border=14pt]{standalone}
\usepackage{tikz}
\begin{document}
\begin{tikzpicture}[x=1cm,y=1cm]
  \fill (0,0) circle (1.2pt);
  \node[%s] at (0,0) {uncapped band};
\end{tikzpicture}
\end{document}
"""
BASE = "fill=red!25,inner sep=0pt"
CASES = [
    ("south rot90 sep 0pt", "rotate=90,anchor=south," + BASE),
    ("south rot90 sep 3pt", "rotate=90,anchor=south,inner sep=3pt,fill=red!25"),
    ("south rot90 sep 6pt", "rotate=90,anchor=south,inner sep=6pt,fill=red!25"),
    ("south rot90 sep order", BASE + ",rotate=90,anchor=south"),
    # pgf's own default `inner sep` (0.3333em) on a node that writes nothing: this is the box the
    # corpus's ten face nodes actually have, and the anchor vector is measured on IT, not on the ink
    ("south rot90 DEFAULT sep", "rotate=90,anchor=south,fill=red!25"),
    ("east rot90 DEFAULT sep", "rotate=90,anchor=east,fill=red!25"),
    ("south rot90 DEFAULT sep INK", "rotate=90,anchor=south", "ink"),
    ("south rot90 footnotesize", BASE + r",rotate=90,anchor=south,font=\footnotesize"),
    ("south rot90 scriptsize", BASE + r",rotate=90,anchor=south,font=\scriptsize"),
    ("east rot90 sep 0pt", "rotate=90,anchor=east," + BASE),
    ("east rot90 sep 3pt", "rotate=90,anchor=east,inner sep=3pt,fill=red!25"),
    ("east rot90 sep 6pt", "rotate=90,anchor=east,inner sep=6pt,fill=red!25"),
    # the same box unturned, so a sep/size increment can be read as a box increment alone
    ("south rot0 sep 0pt", "anchor=south," + BASE),
    ("south rot0 sep 3pt", "anchor=south,inner sep=3pt,fill=red!25"),
    ("south rot0 sep 6pt", "anchor=south,inner sep=6pt,fill=red!25"),
    ("south rot0 footnotesize", BASE + r",anchor=south,font=\footnotesize"),
    # calibration: the same normal-size node read at the ink rung, so fill and ink rows are comparable
    ("south rot90 normal INK", BASE + ",rotate=90,anchor=south", "ink"),
    ("south rot0 normal INK", BASE + ",anchor=south", "ink"),
]


def offsets(pdf):
    dot, box = h.measure(pdf)
    if dot is None or box is None:
        return None
    return (box[2] - box[0], box[3] - box[1], box[0] - dot[0], box[2] - dot[0],
            box[1] - dot[1], box[3] - dot[1])


def ink_offsets(pdf):
    """The same columns read off the text's own ink instead of the fill.

    `probe100h.measure()` tells box from dot by size alone (`w > 8 and h > 8`), and a rotated
    `\footnotesize` node is under 8pt wide, so the fill box is not matched -- that is this gauge's
    threshold, not a property of pgf.  With `inner sep=0pt` the node box *is* the ink box, so the
    span bbox answers the same question one rung lower.
    """
    import fitz
    doc = fitz.open(pdf)
    page = doc[0]
    dot = None
    for d in page.get_drawings():
        r = d["rect"]
        if d.get("fill") and max(r.width, r.height) < 4 and min(r.width, r.height) > 1:
            dot = ((r.x0 + r.x1) / 2.0, (r.y0 + r.y1) / 2.0)
    boxes = []
    for b in page.get_text("dict")["blocks"]:
        for l in b.get("lines", []):
            for s in l["spans"]:
                if s["text"].strip():
                    boxes.append(fitz.Rect(s["bbox"]))
    doc.close()
    if dot is None or not boxes:
        return None
    r = boxes[0]
    for other in boxes[1:]:
        r |= other  # pdflatex splits one label into several spans; the node box is their union
    return (r.width, r.height, r.x0 - dot[0], r.x1 - dot[0], r.y0 - dot[1], r.y1 - dot[1])


def main():
    lines = ["#101a: turned-anchor box and offsets vs inner sep / font size -- pt", ""]
    for i, row in enumerate(CASES):
        name, opt = row[0], row[1]
        force_ink = len(row) > 2 and row[2] == "ink"
        stem = "m101a_%d" % i
        tex = os.path.join(HERE, stem + ".tex")
        io.open(tex, "w", encoding="utf-8").write(TEX % opt)
        subprocess.run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error",
                        "-output-directory", HERE, tex],
                       stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, cwd=HERE)
        pdf = os.path.join(HERE, stem + ".pdf")
        if force_ink:
            r, rung = ink_offsets(pdf), "ink"
        else:
            r, rung = offsets(pdf), "fill"
            if r is None:
                r, rung = ink_offsets(pdf), "ink"
        if r is None:
            lines.append("%-24s UNREADABLE  opts=%s" % (name, opt))
            continue
        w, ht, left, right, top, bottom = r
        lines.append("%-24s %s box %6.2f x %6.2f  left %7.2f right %7.2f top %7.2f bottom %7.2f"
                     % (name, rung, w, ht, left, right, top, bottom))
    text = "\n".join(lines) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(text)
    print(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
