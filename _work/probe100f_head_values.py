"""Print what the emitter now places under a head `node distance=`, for the test to pin.

Every number the test writes down has to be one this printed and the pdflatex law explains, so this
runs the same two nodes the existing positioning test uses (`\\node (t) at (0,0) {T};` and a placed
`{N}`) with and without a head value.

  python _work/probe100f_head_values.py
"""
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz  # noqa: E402

DECL = r"\node (t) at (0,0) {T};"


def one(head, opt):
    pic = (r"\begin{tikzpicture}" + ("[" + head + "]" if head else "") + DECL
           + r"\node[" + opt + r"] {N};\end{tikzpicture}")
    built = cetz.build(pic)
    if built is None:
        return "refused"
    line = [l.strip() for l in built.splitlines() if "content(" in l][-1]
    return line


def main():
    for head, opt in (("", "right=of t"), ("node distance=13mm and 36mm", "right=of t"),
                      ("node distance=13mm and 36mm", "above=of t"),
                      ("node distance=36mm and 13mm", "right=of t"),
                      ("node distance=36mm and 13mm", "above=of t"),
                      ("", "above=of t"),
                      ("node distance=2cm", "right=of t"),
                      ("node distance=13mm and 36mm", "right=2cm of t"),
                      ("node distance=13mm and 36mm", "above right=of t"),
                      ("node distance=1foo", "right=of t"),
                      ("node distance=1cm 2cm 3cm", "right=of t")):
        print("%-28s %-22s %s" % (head or "(no head)", opt, one(head, opt)))
    return 0


if __name__ == "__main__":
    sys.exit(main())
