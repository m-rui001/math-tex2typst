r"""#104e: what the emitter ships for the five `fit=` statements, next to what pgf measures.

The face probe (`_work/probe104c_fit_face.py`) found 5 statements over 4 canvases / 4 papers, 4 of
them consumed by a placement.  This prints, for each of those canvases, the source statements that
carry `fit=` or place something `... of <fit node>` and the emitted canvas, so the union box and the
placement that reads it can be checked against `_work/label104_fit_box.txt` (pgf's own anchors, dumped
with `\pgfpointanchor` + `\pgfgetlastxy`).

  python _work/probe104e_fit_emit.py          # -> _work/label104e_fit_emit.txt
"""
import io
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))

import compare_figure as cf  # noqa: E402
from t2t import cetz  # noqa: E402

STEMS = ["The-Blockwise-Alperin-Weight-Conjecture",
         "A-counterexample-to-Kaplanskys-quasitrace-conjecture",
         "Finite-Congruence-Lattices-Characterization-and-Undecidability",
         "Perfect-completeness-for-2-to-1-games"]
FIT = re.compile(r"fit\s*=\s*\(")
OF = re.compile(r"(?:above right|below left|above left|below right|right|left|above|below)"
                r"\s*=\s*[^;{]*?\s+of\s*([A-Za-z0-9_\-]+)")
OUT = os.path.join(HERE, "label104e_fit_emit.txt")


def main():
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    flat = os.path.join(HERE, "flat")
    lines = []
    for stem in STEMS:
        cand = sorted(n for n in os.listdir(flat) if n.startswith(stem) and n.endswith(".tex"))
        if not cand:
            lines.append("!! no flat file for %s" % stem)
            continue
        text = io.open(os.path.join(flat, cand[0]), encoding="utf-8", errors="replace").read()
        for k, m in enumerate(cf.PIC.finditer(text)):
            pic = m.group(0)
            if not FIT.search(pic):
                continue
            lines.append("\n================ %s #%d ================" % (cand[0][:-4], k))
            lines.append("-- statements carrying fit= or a placement --")
            head = pic.find("]", pic.find("\\begin{tikzpicture}")) + 1
            for s in cetz.split_statements(pic[head:pic.rfind("\\end{tikzpicture}")]):
                if FIT.search(s) or OF.search(s):
                    lines.append("   " + s.strip()[:220])
            out = cetz.build(pic)
            lines.append("-- emitted --")
            lines.append("   REFUSED" if out is None else
                         "\n".join("   " + ln for ln in out.splitlines() if ln.strip()))
    text_out = "\n".join(lines) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(text_out)
    print(text_out)
    return 0


if __name__ == "__main__":
    sys.exit(main())
