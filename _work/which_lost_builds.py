"""Which pictures drew before the label work and refuse now, and on what text.

run33 converted 903, run35 892. The label table and the rewrite both changed, so replay the
pre-change `_math_body` (substring rewrite, no fallback, the old twelve symbols) against the one
in the module and list the pictures whose build verdict flips, with the node text that differs.
"""
import pathlib
import re
import sys

sys.path.insert(0, str(pathlib.Path("tools").resolve()))
from t2t import cetz  # noqa: E402

OLD_SYMBOLS = {
    r"\cdots": "dots.h", r"\ldots": "dots.h", r"\dots": "dots.h",
    r"\to": "arrow.r", r"\rightarrow": "arrow.r", r"\leftarrow": "arrow.l",
    r"\leq": "lt.eq", r"\le": "lt.eq", r"\geq": "gt.eq", r"\ge": "gt.eq",
    r"\times": "times", r"\cdot": "dot.op", r"\infty": "infinity",
    r"\alpha": "alpha", r"\beta": "beta", r"\gamma": "gamma",
    r"\lambda": "lambda", r"\mu": "mu", r"\sigma": "sigma",
    r"\varepsilon": "epsilon", r"\epsilon": "epsilon", r"\delta": "delta",
    r"\Delta": "Delta", r"\Omega": "Omega", r"\omega": "omega",
    r"\pi": "pi", r"\tau": "tau", r"\theta": "theta", r"\phi": "phi",
    r"\varphi": "phi", r"\rho": "rho", r"\eta": "eta", r"\kappa": "kappa",
    r"\quad": " ", r"\qquad": " ", r"\,": " ", r"\;": " ", r"\!": "",
}


def old_body(tex):
    for src, dst in OLD_SYMBOLS.items():
        tex = tex.replace(src, dst)
    tex = re.sub(r"\\[a-zA-Z]+", "", tex)
    tex = tex.replace("{}", "").replace('"', "")
    while tex[:1] in ("_", "^"):
        tex = tex[1:]
    while tex[-1:] in ("_", "^"):
        tex = tex[:-1]
    tex = cetz.quote_words(tex.strip())
    if cetz.math_safe(tex):
        return tex
    return '"%s"' % re.sub(r"[\"$\\]", "", tex.strip())


PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
new = cetz._math_body
flips = []
for path in sorted(pathlib.Path("_work", "flat").glob("*.tex")):
    src = path.read_text(encoding="utf-8", errors="replace")
    for pic in PIC.findall(src):
        cetz._math_body = new
        now = bool(cetz.build(cetz.MATH_ENVELOPE.sub("", pic)))
        cetz._math_body = old_body
        was = bool(cetz.build(cetz.MATH_ENVELOPE.sub("", pic)))
        if was and not now:
            cetz._math_body = new
            lost = [(old_body(s), new(s)) for s in re.findall(r"\$([^$]*)\$", pic)
                    if old_body(s) != new(s)]
            flips.append((path.stem, lost[:2]))
cetz._math_body = new

print({"pictures that drew before and refuse now": len(flips)})
for stem, lost in flips[:12]:
    print("  %s" % stem[:58])
    for before, after in lost:
        print("      was %-34s now %s" % (before[:34], after[:44]))
