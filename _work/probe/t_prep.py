import sys

sys.path.insert(0, "E:/math/tools")
from t2t import macros, prep

cases = [
    (r"\DeclarePairedDelimiter{\norm}{\lVert}{\rVert}", r"$\norm{x}$ and $\norm{u}_{L^2}$"),
    (r"\DeclarePairedDelimiterX{\inp}[2]{\langle}{\rangle}{#1, #2}", r"$\inp{a}{b}$"),
    (r"\newcommand{\dd}{\,\mathrm d}", r"$\int f(x)\dd x$"),
    (r"\newcommand{\p}[2]{\frac{\partial #1}{\partial #2}}", r"$\p{f}{x}$"),
    (r"\newcommand{\abs}[1]{\left\lvert#1\right\rvert}", r"$\abs{a+b}$"),
    (r"\def\x#1{X_{#1}}", r"$\x{i}$"),
]
for decl, use in cases:
    table, skipped = macros.parse_definitions(decl)
    print(repr(decl[:44]), "->", repr(macros.expand(use, table)),
          "skipped:", [s[0] for s in skipped])

flat = open("E:/math/_work/flat/A-C1-Counterexample-to-the-Entropy-Conjecture-September-25-2026.tex",
            encoding="utf-8").read()
pre, body = prep.split_document(flat)
p = prep.parse_preamble(pre)
print("packages:", p.packages)
print("theorems:", p.theorem)
print("geometry:", p.geometry, "fontsize", p.fontsize)
print("unsupported:", p.unsupported)
print("macros:", len(p.macros), "skipped:", p.skipped_defs[:4])
print("title:", p.title, "| author:", p.author, "| date:", p.date)
print("body head:", repr(prep.fix_dialect_prose(prep.strip_dropped(body))[:200]))
