"""Where the 11 lost conversions went: replay the gate, not just build().

which_lost_builds.py saw no build flips, so the loss is in sane() or the real typst compile
that convert() adds on top of build(). Run the whole gate under the pre-change and the current
_math_body over every flat picture, and print the pictures whose verdict flips with the label
text that differs.
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


def verdict(core, body):
    """convert()'s gate, without the envelope pass, short-circuiting before typst.

    A picture with an identical canvas under both mappings cannot differ, and one that fails
    the text checks needs no compile, so typst only runs on canvases that actually changed.
    """
    cetz._math_body = body
    canvas = cetz.build(core) or cetz.build_cd(core)
    if canvas is None:
        return None, False
    return canvas, cetz.sane(canvas) and cetz.compiles(canvas)


now = was = 0
flips = []
for path in sorted(pathlib.Path("_work", "flat").glob("*.tex")):
    src = path.read_text(encoding="utf-8", errors="replace")
    for pic in PIC.findall(src):
        core = cetz.MATH_ENVELOPE.sub("", pic)
        canvas_now, drew_now = verdict(core, new)
        canvas_was, drew_was = verdict(core, old_body)
        now += drew_now
        was += drew_was
        if drew_was and not drew_now:
            lost = [(old_body(s), new(s)) for s in re.findall(r"\$([^$]*)\$", pic)
                    if old_body(s) != new(s)]
            flips.append((path.stem, lost[:3], (canvas_was or "")[-160:]))
cetz._math_body = new

print({"gate: before label work": was, "gate: now": now,
       "flipped to refusal": len(flips)})
for stem, lost, tail in flips[:14]:
    print("  %s" % stem[:60])
    for before, after in lost:
        print("      was %-32s now %s" % (before[:32], after[:50]))
    print("      canvas tail: %s" % tail.replace("\n", " ")[:150])
