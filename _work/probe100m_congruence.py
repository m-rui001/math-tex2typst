"""One paper, printed whole: Finite-Congruence-Lattices has a head `node distance=10mm and 13mm` and
six bare `=of` placements yet produced no changed line.  Print the source picture and every `content(`
line the emitter ships for it, with the head value left in and then removed, so the two can be
compared directly.

  python _work/probe100m_congruence.py
"""
import io
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.path.insert(0, HERE)

import compare_figure as cf  # noqa: E402
from t2t import cetz  # noqa: E402

STEM = "Finite-Congruence-Lattices-Characterization-and-Undecidability"
OF = re.compile(r"(?:above right|below left|above left|below right|right|left|above|below)"
                r"\s*=\s*(?:([^;{]*?)\s+)?of", re.S)


def contents(pic):
    out = cetz.build(pic)
    if out is None:
        return ["REFUSED"]
    return [line.strip() for line in out.splitlines() if "content(" in line]


def main():
    cand = [n for n in os.listdir(os.path.join(HERE, "flat")) if n.startswith(STEM)]
    text = io.open(os.path.join(HERE, "flat", cand[0]), encoding="utf-8",
                   errors="replace").read()
    pic = [m.group(0) for m in cf.PIC.finditer(text)][0]
    print("---- source picture 0 ----")
    print(pic)
    print("---- bare vs written ----")
    for m in OF.finditer(pic):
        print("   %-12s dist=%r" % (m.group(0)[:12], (m.group(1) or "").strip()))
    print("---- emitter with the head value ----")
    for line in contents(pic):
        print("   " + line[:150])
    stripped = re.sub(r"node distance\s*=\s*10mm and 13mm\s*,?", "", pic, count=1)
    print("---- emitter with the head value removed ----")
    for line in contents(stripped):
        print("   " + line[:150])


if __name__ == "__main__":
    main()
