r"""#96 attribution: which source spelling makes pandoc write a BARE slash into Typst maths?

The face census (`_work/probe96_face.py`) counts 19,318 bare slashes in the product's body maths over 673
papers, and only ~16% of them sit where the source wrote a braced `\frac{num}{den}`.  Two claims have to be
told apart before anything is repaired:

  A  pandoc's Typst writer escapes a slash the author typed (`G/P` -> `G \/ P`) -- #94 settled that;
  B  pandoc **linearizes** `\frac{a}{b}` into a bare quotient -- which is what this probe checks, shape by
     shape, by feeding the TeX through the pipeline's own `run_pandoc` and reading back the `$ ... $`.

What this probe was written to decide was answered here; what was made of the answer was not.  The bare
quotient it surfaced was assumed to be stacked by Typst **with the rest of the span as its denominator**
(the 轴 75 律一 wording), and that premise is what #96 was filed on.  `_work/measure97_bar_scope.py` measured
the bar on the page instead of assuming it: a bare `/` takes exactly **one atom** on each side, and its bar
comes back the same width with the same glyphs under it as a `frac(a, b)` call (3.97 / 3.98 pt, 22.50 / 22.59
pt over 2 glyphs) -- so the population is faithful and **#96 was withdrawn (轴 77)**.  Read this probe for the
attribution only: it is what pins the family on pandoc's writer step rather than on our emitter.

  python _work/probe96_attrib.py > _work/m96_attrib.txt
"""
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools", "t2t"))

from measure94_channel import emitted  # the pipeline's own pandoc call, one path

SHAPES = [
    ("frac-braced", r"$\frac{1}{2}$"),
    ("frac-braced-tail", r"$\frac{1}{2}m \leq E_0$"),
    ("frac-braced-period", r"$\|z_i\| > \frac{1}{2}.$"),
    ("frac-nobrace", r"$\frac12$"),
    ("dfrac", r"$\dfrac{1}{2}$"),
    ("tfrac", r"$\tfrac{1}{2}$"),
    ("frac-group-den", r"$\frac{L}{10(L-1)}$"),
    ("literal-tight", r"$1/2$"),
    ("literal-spaced", r"$1 / 2$"),
    ("literal-letters", r"$G/P$"),
    ("over-construct", r"$1 \over 2$"),
]


def main():
    for name, math in SHAPES:
        body = emitted(math)
        bare = len(re.findall(r"(?<!\\)/", body))
        esc = body.count(r"\/")
        print("%-18s %-30s -> %-46s bare=/ %d  escaped %d  frac( %d"
              % (name, math, body, bare, esc, body.count("frac(")))
    return 0


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
