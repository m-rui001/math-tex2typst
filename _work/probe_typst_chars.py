"""Which characters break Typst markup inside content()[...] and math $...$?"""
import pathlib
import subprocess
import sys
import tempfile

MARKUP = [
    "hash #1 here", "less < than", "greater > than", "at @ref sign",
    "back`tick", "tilde ~ here", "arrow ->", "star *bold*", "under_score",
    "percent 50 %", "bracket [x]", "paren (x", "brace {x}", "dollar $x$",
    "colon a:b", "quote \"x\"", "slash a/b", "dot .start", "plus +x",
    "equals a=b", "pipe a|b", "ampersand a&b", "dash -- x",
]
MATH = [
    "x_(i+1)", "a^2 b_c", "f(x", "a & b", "a\\\\b", "\"text\"", "100%",
    "x/y", "a_b_c", "^{2}", "_{i}", "3 > 2", "3 < 2", "a#b", "@x", "%y",
    "text with spaces", "f: A -> B", "(a,b)$", "epsilon", "eq1", "e^\"iv\"",
]

with tempfile.TemporaryDirectory() as tmp:
    tmpd = pathlib.Path(tmp)
    src = tmpd / "t.typ"
    pdf = tmpd / "t.pdf"

    def ok(body):
        src.write_text('#import "@preview/cetz:0.5.0"\n#set page(width: 200pt, height: 60pt)\n'
                       + body, encoding="utf-8")
        return subprocess.run(["typst", "compile", str(src), str(pdf)],
                              capture_output=True).returncode == 0

    print("== markup content[...] ==")
    for t in MARKUP:
        print("%-4s [%s]" % ("OK" if ok("#cetz.canvas({\n  import cetz.draw: *\n"
                                        "  content((1, 1), [%s])\n})" % t) else "BAD", t))
    print("== math $...$ ==")
    for t in MATH:
        print("%-4s $%s$" % ("OK" if ok("#cetz.canvas({\n  import cetz.draw: *\n"
                                        "  content((1, 1), [$%s$])\n})" % t) else "BAD", t))
