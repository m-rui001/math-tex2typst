# -*- coding: utf-8 -*-
"""#103g: the two canvases that ARRIVED on the run152 defect face, looked at.

The joined face (probe85b) moved 15 -> 11 canvases when #103 gave every anchored label its
`inner sep`, and two rows on it were not collisions last generation:
`Polynomial-vacuum-representations-and-bridge-mass…#2` ('Conesphere' vs 'pΛ', 2.71pt -> 3.43pt --
the pair existed under the old law, it just sat below the 3pt cut) and
`The-crossing-number-of-complete-bipartite-graphs…#0` ('−1' vs 'Transversechords:', 3.90pt, the
canvas carried no pair at all in run151).  A moved label can deepen an overlap it already had, but a
collision that was not there before must be looked at against the author's own page before it is
either priced as a new defect or written off as the source being crowded (轴 67).

So: the canvas as the product ships it (probe81.render), and the same picture compiled by pdflatex at
the paper's own body size (compare_figure.control), each cropped to the figure's ink box at 300 dpi.
The pair rows printed beside the file names come from the two generations' census files -- the same
gauge, so the depths are comparable.

  PYTHONIOENCODING=utf-8 python _work/probe103g_arrivals_crops.py
      # -> _work/label103g_arrivals_crops.txt and _work/m103g_*.png (look, then delete)
"""
import io
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
FLAT = os.path.join(ROOT, "_work", "flat")
PROD = os.path.join(ROOT, "typst")
OUT = os.path.join(HERE, "label103g_arrivals_crops.txt")
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))

import compare_figure  # noqa: E402
import probe81_label_box_face as ruler  # noqa: E402
import probe84_control_face as ctl  # noqa: E402
import probe103d_page_pair as pair  # noqa: E402  crop_to / ink / block_at, this round's own helpers

GENS = [("run151", os.path.join(HERE, "label81_pairs_run151.json")),
        ("run152", os.path.join(HERE, "label81_pairs.json"))]

# (product prefix, canvas index, which pair this crop is about) -- names globbed, never memorised
CASES = [
    ("Polynomial-vacuum-representations-and-bridge-mass-for-ho", 2, "Conesphere"),
    ("The-crossing-number-of-complete-bipartite-gr", 0, "Transversechords"),
]


def census(path):
    """(stem, canvas) -> the pair rows probe81 wrote, as printable depth + names."""
    rows = {}
    for stem, k, _counts, foreign, onink in json.load(io.open(path, encoding="utf-8")):
        got = []
        for tag, lst in (("foreign", foreign), ("on-ink", onink)):
            for p in lst:
                got.append("%.2fpt %s %s / %s" % (p[0], tag, str(p[3])[:22], str(p[4])[:22]
                                                  if len(p) > 4 else ""))
        rows[(stem, k)] = got
    return rows


def main():
    sys.stdout.reconfigure(errors="replace")
    tables = [(gen, census(path)) for gen, path in GENS]
    lines = ["one canvas, the product page and the author's page, 300 dpi",
             "the pairs beside it are probe81's own rows from the two generations", ""]
    for prefix, idx, needle in CASES:
        hits = [x for x in os.listdir(PROD) if x.startswith(prefix)]
        assert len(hits) == 1, (prefix, hits)
        stem = hits[0]
        path = os.path.join(PROD, stem, "main.typ")
        src = os.path.join(FLAT, stem + ".tex")
        prod = io.open(path, encoding="utf-8").read()
        head = ruler.header_of(prod)
        canvas = pair.block_at(prod, idx)
        pics = len(compare_figure.PIC.findall(
            io.open(src, encoding="utf-8", errors="replace").read()))
        lines.append("%s#%d   canvases shipped %d / source pictures %d   pad tokens on this "
                     "canvas: %d" % (stem[:46], idx, prod.count("#cetz.canvas("), pics,
                                     canvas.count("padding:")))
        for gen, tbl in tables:
            got = tbl.get((stem, idx), [])
            here = [r for r in got if needle in r]
            lines.append("        %s pairs: %d   %s" % (gen, len(got),
                                                       " | ".join(got) if got else "(not flagged)"))
            lines.append("        this crop's pair, %s: %s" % (gen, " | ".join(here) or "(absent)"))
        pr = ruler.render(canvas, "g103g_ours%d" % idx, head=head)
        if pr is None:
            lines.append("        OURS COMPILE FAILED")
            lines.append("")
            continue
        cpdf, _ = compare_figure.control(src, idx, [], ctl.body_size(head))
        shots = []
        for tag, pdf in (("ctl", cpdf), ("ours", pr[2])):
            if not pdf:
                shots.append("%s(none)" % tag)
                continue
            out = os.path.join(HERE, "m103g_%s%d_%s.png" % (prefix[:10], idx, tag))
            shots.append("%s=%s" % (tag, out if pair.crop_to(pdf, out) else "no ink"))
        lines.append("        ink ours=%d   body %spt   crops: %s"
                     % (pair.ink(pr[2]), ctl.body_size(head), "  ".join(shots)))
        lines.append("")
    text = "\n".join(lines) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(text)
    print(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
