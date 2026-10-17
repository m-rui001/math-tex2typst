"""List, for the 8 face papers that produced no changed lines, every `=of` placement in the picture
that carries the head value: bare (head governs) vs written distance (statement wins, 律四).

  python _work/probe100m_of_forms.py
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

STEMS = [
    "A-high-arity-counterexample-to-Pixton-completeness-in-Chow",
    "Conditional-permutations-in-a-revealed-switching-environment",
    "Finite-Congruence-Lattices-Characterization-and-Undecidability",
    "From-partial-permutation-information-to-Fourier-bounds",
    "Hellinger-contraction-with-arbitrary-Boolean-output-bias",
    "Random-subspace-tests-and-trace-smoothing-for-coordinate-sweeps",
    "Rigidity-of-Smooth-Billiards-with-a-Continuous-Caustic-Collar",
    "The-ordinary-double-point-gap-in-every-dimension",
]
OF = re.compile(r"(?:above right|below left|above left|below right|right|left|above|below)"
                r"\s*=\s*(?:([^;{]*?)\s+)?of", re.S)
HEAD = re.compile(r"node distance\s*=\s*([^\],]*)")


def main():
    total_bare = 0
    for stem in STEMS:
        cand = [n for n in os.listdir(os.path.join(HERE, "flat")) if n.startswith(stem)]
        if not cand:
            print("%s NOT FOUND" % stem[:44])
            continue
        text = io.open(os.path.join(HERE, "flat", cand[0]), encoding="utf-8",
                       errors="replace").read()
        rows = []
        for i, m in enumerate(cf.PIC.finditer(text)):
            pic = m.group(0)
            h = HEAD.search(pic)
            if not h:
                continue
            bare = written = 0
            for om in OF.finditer(pic):
                if (om.group(1) or "").strip():
                    written += 1
                else:
                    bare += 1
            rows.append((i, h.group(1).strip(), bare, written))
        print("%-44s %s" % (stem[:44], rows))
        total_bare += sum(r[2] for r in rows)
    print("bare (=of with no written distance) across the 8: %d" % total_bare)


if __name__ == "__main__":
    main()
