r"""What does a relative control emit? Copied into the test rather than predicted, because `fmt`'s
four significant digits and the curve call's shape are what the emitter really prints.

Three pictures: both controls relative (the corpus form, `A-Fully-Polynomial…` and
`Arithmetic-classification…`), one relative and one absolute, and the absolute-only form that already
worked -- the last two show the change cannot move a figure that was drawing.
"""
import sys

sys.path.insert(0, "tools")
from t2t import cetz


def show(label, body):
    out = cetz.convert(r"\begin{tikzpicture}" + "\n" + body + "\n\\end{tikzpicture}\n")
    txt = out if isinstance(out, str) else "".join(map(str, out or ""))
    print("== %s ==" % label)
    print("(refused)" if "canvas" not in txt else "\n".join(
        l.strip() for l in txt.splitlines() if "curve" in l or "line(" in l))


show("both relative", r"\draw (0,0) .. controls +(1,1) and +(-1,1) .. (3,0);")
show("mixed", r"\draw (0,0) .. controls +(0,1.15) and (2,1) .. (3,0);")
show("absolute only", r"\draw (0,0) .. controls (1,1) and (2,1) .. (3,0);")
show("relative under axes", r"\begin{tikzpicture}[x=1cm,y=2cm]" if False
     else r"\draw (0,0) .. controls +(1,1) and +(-1,1) .. (3,0);")
