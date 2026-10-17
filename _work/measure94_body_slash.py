r"""#94 fidelity gauge: what does a slash put on the PAGE in BODY maths (the pandoc channel)?

轴 75 proved the law on the canvas channel (`_math_body`): a bare `/` in Typst maths is a **stacked
fraction**, and the tight quoted glyph `"/"` is the slash's own ink.  「whose denominator runs to the end of
the span」 was this line's wording; 轴 77 measured the bar over the single atom that follows the slash.  The census `_work/probe94_bare_slash.py` now shows the second channel carries both spellings at
once: pandoc's Typst writer escapes the author's division slash as `\/` (49,353 spans), while 6,349 spans
over 522 papers still hold a BARE `/`, nearly always spaced (`1 / 2`, `1 / n log s`).

If a spaced bare slash stacks, this is the same disease on the body route and 522 papers are affected;
if it does not, the escaped spelling was never the point and the census' premise dies.  Three shapes are
therefore read separately -- bare tight, bare spaced, escaped -- plus the quoted glyph as the standard,
and each against the author's own TeX on pdflatex.  One page per case (轴 74's instrument law).

  python _work/measure94_body_slash.py > _work/m94_fidelity.txt
"""
import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "_work"))
import measure93_slash_fidelity as ruler  # one ruler: lines()/compile_()/control()/fmt() are #93's

TMP = os.path.join(os.path.dirname(os.path.abspath(__file__)), "_m94body")
ruler.TMP = TMP

# (case, sentinel) -- the TeX side is TEX[case], the Typst candidates are BODIES[case]
CASES = [("spaced-bare", "a"), ("tight-bare", "b"), ("spaced-tail", "c"), ("letter-quotient", "d"),
         ("equation-tail", "e"), ("group-slash", "f"), ("frac-simple", "h"), ("frac-two", "i"), ("frac-atom-num", "j"), ("frac-call-den", "k"),
         ("frac-script", "l"), ("frac-tail", "m")]
BODIES = {
    "spaced-bare": [("bare-sp", "$a 1 / 2$"), ("esc-sp", r"$a 1 \/ 2$"), ("quot-sp", '$a 1 "/" 2$')],
    "tight-bare": [("bare", "$b 1/2$"), ("esc", r"$b 1 \/ 2$"), ("quot", '$b 1"/"2$')],
    "spaced-tail": [("bare-sp", r"$c 1 / n sans(T)_n$"),
                    ("esc-sp", r"$c 1 \/ n sans(T)_n$"),
                    ("quot-sp", r'$c 1 "/" n sans(T)_n$')],
    "letter-quotient": [("bare-sp", "$d G / P$"), ("esc-sp", r"$d G \/ P$"), ("quot-sp", '$d G "/" P$')],
    "equation-tail": [("bare-sp", "$e a / 2 = b$"), ("esc-sp", r"$e a \/ 2 = b$"),
                      ("quot-sp", '$e a "/" 2 = b$')],
    "group-slash": [("bare", r"$f \[ X / G \]$"), ("esc", r"$f \[ X \/ G \]$"),
                    ("quot", r'$f \[ X "/" G \]$')],
    # pandoc's own linearization of a simple `\frac`, and the `frac(...)` call proposed as the fix.
    "frac-simple": [("bare", "$h 1 / 2$"), ("frac", "$h frac(1, 2)$")],
    "frac-two": [("bare", "$i 1 / 2 + 1 / 3$"), ("frac", "$i frac(1, 2) + frac(1, 3)$")],
    "frac-atom-num": [("bare", "$j pi / 2 x$"), ("frac", "$j frac(pi, 2) x$")],
    "frac-call-den": [("bare", "$k 1 / sqrt(2)$"), ("frac", "$k frac(1, sqrt(2))$")],
    "frac-script": [("bare", "$l x^(1 / 2)$"), ("frac", "$l x^(frac(1, 2))$")],
    "frac-tail": [("bare", r"$m 1 / 2 f \( x \)$"), ("frac", r"$m frac(1, 2) f \( x \)$")],
}

# the TeX side has to be the author's spelling, not Typst's: `\[`/`\]` are delimiters in TeX, not brackets
TEX = {
    "spaced-bare": r"$1 / 2$",
    "tight-bare": r"$1/2$",
    "spaced-tail": r"$1 / n \mathsf{s}_n$",
    "letter-quotient": r"$G / P$",
    "equation-tail": r"$a / 2 = b$",
    "group-slash": r"$\left[ X / G \right]$",
    "frac-simple": r"$\frac{1}{2}$",
    "frac-two": r"$\frac{1}{2}+\frac{1}{3}$",
    "frac-atom-num": r"$\frac{\pi}{2} x$",
    "frac-call-den": r"$\frac{1}{\sqrt{2}}$",
    "frac-script": r"$x^{\frac{1}{2}}$",
    "frac-tail": r"$\frac{1}{2} f(x)$",
}


def main():
    os.makedirs(TMP, exist_ok=True)
    for name, sent in CASES:
        math = TEX[name]
        ctrl = ruler.control(name, sent, math)
        print("\n== %-16s TeX %s" % (name, math))
        print("   %-10s            %s" % ("CONTROL", ruler.fmt(ctrl)))
        for label, body in BODIES[name]:
            got = ruler.compile_(os.path.join(TMP, "%s-%s.typ" % (name, label)),
                                 ruler.PRE + "#text(size: 10pt)[%s]\n" % body)
            if isinstance(got, list):
                print("   %-10s FAILED   %s" % (label, got))
                continue
            typ = ruler.lines(got, sent)
            want = [s for _m, s, _g in ctrl]
            match = "==" if [s for _m, s, _g in typ] == want else "!="
            print("   %-10s %-4s lines=%d  %s" % (label, match, len(typ), ruler.fmt(typ)))
    return 0


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
