r"""How much SHIPPED canvas maths carries a `frac(` call, and how many of those sit on a line?

The #93 fidelity gauge (`_work/m93_fidelity.txt`, the `frac-control` case) showed a second shape
Typst gives a node label and TeX does not: with `$\frac{QH_j}{w}=G^{1/4}$` the control page puts the
`=G1/4` neighbours on the fraction BAR's row, while Typst puts them on the DENOMINATOR's row.  That
is not the slash round's defect -- the slash was the emitted `1/4`, already fixed -- but it is the
next account, so the face has to be counted before anyone writes a row about it.

The scan reuses the one ruler for shipped canvases (`probe93_product_scan.canvases`), so "what is a
canvas maths string" means the same thing in both files.

  python _work/probe93_frac_face.py
"""
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from probe93_product_scan import TY, canvases  # noqa: E402


def main():
    papers = sorted(d for d in os.listdir(TY)
                    if os.path.exists(os.path.join(TY, d, "main.typ")))
    spans = frac_spans = neighbours = 0
    frac_papers = neigh_papers = 0
    worst = []
    for d in papers:
        text = open(os.path.join(TY, d, "main.typ"), encoding="utf-8", errors="replace").read()
        has_frac = has_neigh = False
        for c in canvases(text):
            for s in re.findall(r"\$[^$]*\$", c):
                if "frac(" not in s:
                    continue
                spans += 1
                frac_spans += s.count("frac(")
                has_frac = True
                # anything written directly after the closing paren of the frac call is a neighbour
                # TeX would hang on the bar and Typst hangs on the denominator
                if re.search(r"frac\([^()]*(?:\([^()]*\)[^()]*)*\)[^$]*[=+\-<>,]", s):
                    neighbours += 1
                    has_neigh = True
                    if len(worst) < 12:
                        worst.append((d[:44], s[:80]))
        frac_papers += has_frac
        neigh_papers += has_neigh
    print("papers %d   maths strings with a frac( call: %d over %d papers (%d calls)"
          % (len(papers), spans, frac_papers, frac_spans))
    print("of those, a neighbour right after the call: %d strings over %d papers"
          % (neighbours, neigh_papers))
    for stem, s in worst:
        print("   %-45s %s" % (stem, re.sub(r"\s+", " ", s)))
    return 0


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
