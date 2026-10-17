r"""The face behind the three new collisions: an author macro printed as its own name.

`probe99` put the last doubt to rest -- on the gauge's page a canvas centimetre is 28.35pt and a
`content()` box lands exactly on its anchor (two cells declared 3.707cm apart measured 105.08pt of
ink-centre distance, to the hundredth).  So the lane is not squeezed and not misplaced: it is
*narrower than the author's* because our cell carries ink the author's cell does not.

`The-height-three-chromatic-overlap…#1` is the case.  The paper writes
`R\Gamma_{\hthreects}(H,M_{B,C})` with `\newcommand{\hthreects}{\mathrm{cts}}` in its preamble, so the
author's page sets 3 letters under the `\Gamma`.  The picture maths goes to texmath without that
definition, and texmath sets an unknown control word as its own name: the cell prints
`\Gamma_{hthreects}` -- nine letters instead of three -- and the cell grows from ~65pt to 97pt of ink.
The measured separation law priced the gap for the author's box, so the fatter cell reaches into its
neighbour.  `Abundance…#0` is the same story with `Preparedcycle`, and `Unrestricted-pro-modularity…#0`
with `forgetfactors2`.

That is not a geometry bug, so this does not touch geometry: it counts how much of the corpus's
exchange diagrams is drawn with a macro the converter does not know.  For every paper whose canvases
are cd diagrams, every `\newcommand` / `\def` / `\DeclareMathOperator` name from its own preamble is
looked for inside the `$…$` maths the product actually emits.  A name that survives there is a name
the page shows the reader.

  python _work/probe100_cd_macro_leak.py
"""
import glob
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
sys.path.insert(0, WORK)
sys.path.insert(0, os.path.join(ROOT, "tools"))
import probe81_label_box_face as g  # noqa: E402
from t2t import cetz  # noqa: E402

FLAT = os.path.join(WORK, "flat")
CD = re.compile(r"\\begin\{(tikzcd|CD)\}")
NAME = re.compile(r"\\(?:renew|new|provide)command\s*\{?\\([A-Za-z]+)"
                  r"|\\(?:def|DeclareMathOperator|let)\s*\\([A-Za-z]+)")
MATH = re.compile(r"\$([^$]*)\$")


def names(stem):
    """The control words the paper defines for itself, before \begin{document}."""
    matches = glob.glob(os.path.join(FLAT, stem + "*.tex"))
    if not matches:
        return set()
    src = open(matches[0], encoding="utf-8", errors="replace").read()
    pre = src[:src.index("\\begin{document}")] if "\\begin{document}" in src else src
    return {a or b for a, b in NAME.findall(pre)}


def main():
    canv = g.canvases()
    cd_keys = []
    for path in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        stem = os.path.basename(path)[:-4]
        src = open(path, encoding="utf-8", errors="replace").read()
        for k, m in enumerate(cetz.PICTURE_ENV.finditer(src)):
            if CD.match(m.group(0)) and (stem, k) in canv:
                cd_keys.append((stem, k))
    defs = {}
    hits, papers = {}, set()
    for stem, k in cd_keys:
        owned = defs.setdefault(stem, names(stem))
        maths = " ".join(MATH.findall(canv[(stem, k)][1]))
        leak = {n for n in owned if re.search(r"\b%s\b" % re.escape(n), maths)}
        if not leak:
            continue
        hits[(stem, k)] = sorted(leak, key=len, reverse=True)
        papers.add(stem)
    print("cd canvases read from the products: %d" % len(cd_keys))
    print("carrying a macro the converter printed by name: %d canvases in %d papers"
          % (len(hits), len(papers)))
    letters = sorted((len(n) for got in hits.values() for n in got), reverse=True)
    print("  name lengths: median %s, longest %d, total %d letters of extra ink"
          % (letters[len(letters) // 2] if letters else "-",
             letters[0] if letters else 0, sum(letters)))
    for key, got in sorted(hits.items()):
        print("  %-52s#%d  %s" % (key[0][:52], key[1], " ".join(got)))
    with open(os.path.join(WORK, "regen100_macro_leak.txt"), "w", encoding="utf-8") as fh:
        fh.write("\n".join(sorted(papers)))
    print("wrote _work/regen100_macro_leak.txt (%d papers)" % len(papers))
    return 0


if __name__ == "__main__":
    sys.exit(main())
