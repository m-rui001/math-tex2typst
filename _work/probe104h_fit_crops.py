# -*- coding: utf-8 -*-
"""#104h: the four canvases that write `fit=`, looked at on the page, 300 dpi.

The law (轴 84, `_work/label104_fit_box.txt`) says a `fit=` node gathers the axis-aligned union of
the boxes its references stand in, grown per axis by `inner sep`+`outer sep`, and that a consumer
like `below=10mm of f` then measures from THAT edge -- pgf answering 1.0000cm of clear space for a
10mm statement. Until this round the emitter built no such box, so on the Alperin flowchart the
third stage landed on top of the second (the two rows `probe104_pair_crops` filed as on-ink
collisions at rows 00 and 05).

So: each of the four canvases as the product ships it (`probe81.render`) and the same picture
compiled by pdflatex at the paper's own body size (`compare_figure.control`), cropped to the
figure's ink box at 300 dpi. Beside each crop the pair rows probe81 wrote for the two generations --
the same gauge, so the depths are comparable and a row that is gone is gone on the pages, not in my
counting.

  PYTHONIOENCODING=utf-8 python _work/probe104h_fit_crops.py
      # -> _work/label104h_fit_crops.txt and _work/m104h_*.png (look, then delete)

Gauge functions are imported from `probe81`, `probe84`, `probe103d` and `probe103g`, never copied.
"""
import io
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
FLAT = os.path.join(ROOT, "_work", "flat")
PROD = os.path.join(ROOT, "typst")
OUT = os.path.join(HERE, "label104h_fit_crops.txt")
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))

import compare_figure  # noqa: E402
import probe81_label_box_face as ruler  # noqa: E402
import probe84_control_face as ctl  # noqa: E402
import probe103d_page_pair as pair  # noqa: E402  block_at / crop_to / ink
import probe103g_arrivals_crops as gen  # noqa: E402  census()

FIT = re.compile(r"fit\s*=\s*\(([^)]*)\)")
OF = re.compile(r"(?:above|below|left|right)(?:\s*=\s*[^,]*?)?\s+of\s*\s*([A-Za-z0-9_\-]+)")

# (product prefix, canvas index) -- the four the change face found, names globbed, never memorised
CASES = [
    ("A-counterexample-to-Kaplanskys-quasitrace-conjecture", 0),
    ("Finite-Congruence-Lattices-Characterization", 2),
    ("Perfect-completeness-for-2-to-1-games", 0),
    ("The-Blockwise-Alperin-Weight-Conjecture", 0),
]


def statements(stem, idx):
    """The source lines on this canvas that write `fit=` or place something `... of <name>`."""
    text = io.open(os.path.join(FLAT, stem + ".tex"), encoding="utf-8",
                   errors="replace").read()
    # `compare_figure.PIC` wraps its body in a capture group, so `findall` hands back the environment
    # NAME, not the picture; `finditer` is the one way to read the body.
    pics = [m.group(0) for m in compare_figure.PIC.finditer(text)]
    out = []
    for s in re.split(r";\s*\n|;\s*(?=\\)", pics[idx]):
        if FIT.search(s) or OF.search(s):
            out.append(" ".join(s.split())[:150])
    return out


def main():
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    tables = [("run152", os.path.join(HERE, "label81_pairs_run152.json")),
              ("run153", os.path.join(HERE, "label81_pairs.json"))]
    tables = [(gen_name, gen.census(path)) for gen_name, path in tables]
    lines = ["#104h: the four `fit=` canvases -- the product page and the author's page, 300 dpi,",
             "     with probe81's pair rows for the two generations beside each.", ""]
    for prefix, idx in CASES:
        hits = [x for x in os.listdir(PROD) if x.startswith(prefix)]
        assert len(hits) == 1, (prefix, hits)
        stem = hits[0]
        prod = io.open(os.path.join(PROD, stem, "main.typ"), encoding="utf-8").read()
        head = ruler.header_of(prod)
        canvas = pair.block_at(prod, idx)
        lines.append("%s#%d   canvases shipped %d" % (stem[:52], idx,
                                                     prod.count("#cetz.canvas(")))
        for s in statements(stem, idx):
            lines.append("        src: %s" % s)
        for gen_name, tbl in tables:
            got = tbl.get((stem, idx), [])
            lines.append("        %s pairs (%d): %s" % (gen_name, len(got),
                                                        " | ".join(got) if got else "(none)"))
        pr = ruler.render(canvas, "g104h_ours%d" % idx, head=head)
        if pr is None:
            lines.append("        OURS COMPILE FAILED")
            lines.append("")
            continue
        cpdf, _ = compare_figure.control(os.path.join(FLAT, stem + ".tex"), idx, [],
                                         ctl.body_size(head))
        shots = []
        for tag, pdf in (("ctl", cpdf), ("ours", pr[2])):
            if not pdf:
                shots.append("%s(none)" % tag)
                continue
            out = os.path.join(HERE, "m104h_%s%d_%s.png" % (prefix[:12], idx, tag))
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
