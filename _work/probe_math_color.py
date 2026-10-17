# Can pandoc's LaTeX math reader carry a colour at all, and in which spelling? Each case differs
# from the control by one feature. Pandoc only -- no typst.
import os
import re
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "tools"))
from t2t import mathconv

ROW = r"\begin{array}{cc}a&%s\end{array}"
CELL = "y_{11}"
CASES = [
    ("control: plain cell", ROW % CELL),
    ("\\textcolor{blue}{...}", ROW % ("\\textcolor{blue}{" + CELL + "}")),
    ("\\textcolor{light-blue}{...}", ROW % ("\\textcolor{light-blue}{" + CELL + "}")),
    ("\\textcolor{blue!10}{...}", ROW % ("\\textcolor{blue!10}{" + CELL + "}")),
    ("\\textcolor{blue}{$y_{11}$}", ROW % ("\\textcolor{blue}{$" + CELL + "$}")),
    ("\\colorbox{blue}{...}", ROW % ("\\colorbox{blue}{" + CELL + "}")),
    ("\\colorbox{blue}{x} in text", r"\text{\colorbox{blue}{x}}"),
    ("\\fcolorbox{black}{blue}{x}", ROW % ("\\fcolorbox{black}{blue}{" + CELL + "}")),
]


def run(src):
    res, fb, _err = mathconv.convert_formulas([src])
    if 0 in res:
        return "converted", res[0]
    return "FELL BACK", fb.get(0, "")


for name, src in CASES:
    verdict, out = run(src)
    print("%-30s %-10s %s" % (name, verdict, out.replace("\n", " ")[:100]))
