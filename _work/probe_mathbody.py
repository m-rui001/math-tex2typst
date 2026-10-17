r"""What `_math_body` does with each leaked command, so a fix is aimed at the real mechanism."""
import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))
sys.stdout.reconfigure(errors="replace")
from t2t import cetz  # noqa: E402

SAMPLES = [
    r"\mathcal{Q}", r"\mathcal{Q}_v", r"a \mathcal{Q} b",
    r"\mathbf{x}", r"\mathrm{d}", r"\mathsf{A}", r"\widetilde{X}", r"\widehat{f}",
    r"\bar{z}", r"\overline{X}", r"\frac{a}{b}", r"\sqrt{2}", r"\sqrt{x+1}",
    r"\sum_{i=1}^n a_i", r"\prod_i", r"\int_0^1", r"\approx", r"\sim",
    r"\chi", r"\Psi", r"\perp", r"\top", r"\bullet", r"\sharp",
    r"\cos", r"\sin", r"\max", r"\sup", r"\inf", r"\dim", r"\ker", r"\exp",
    r"\Re", r"\Im", r"\div", r"\liminf", r"\cap", r"\mid", r"\simeq",
    r"\langle x \rangle", r"\notin", r"\ni", r"\emptyset", r"\bot",
    r"\ij", r"\pmod{n}", r"\bmod", r"\left(x\right)", r"\bigl(", r"\bigr)",
    r"\textstyle", r"\footnotesize", r"\sp", r"\check{x}",
]


def main():
    for s in SAMPLES:
        got = cetz._math_body(s)
        print("%-28s -> %r" % (s, got))


if __name__ == "__main__":
    main()
