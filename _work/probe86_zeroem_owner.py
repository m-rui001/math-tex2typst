r"""产物里那 209 处 `#h(0em)` 是谁发的？——先按源写法归因，再谈定价。

B（21:14）问：要不要在 `mathconv.SPACE_VALUES` 里把 `#h(0em)` 改成 `0.27778em`（即按 `\;` 的 mu
价）。这张表现在只有一条 `#h(-1em)` → `#h(-0.16667em)`（#83 为 `\!` 落的）。**定价之前要先知道
`#h(0em)` 到底是哪些源写法掉出来的**：如果里面混着 `\hspace{2mm}`／`\mspace{3mu}` 这类**作者写了
长度、pandoc 读不出**的，把它们一起按 `\;` 的价发就是替作者编一个他没写的间距——那一族只能读长度，
不能改表。

  spellings  每种写法单独喂 pandoc（`mathconv.run_pandoc`，走的就是产物那条出口），报它落成什么串
  face       数产物里 `#h(0em)` 的篇／处，并在 `_work/flat/*.tex` 里数每种源写法的出现次数

用法：python _work/probe86_zeroem_owner.py [spellings|face]
"""
import glob
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work")
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import mathconv  # noqa: E402

MODE = (sys.argv[1] if len(sys.argv) > 1 else "spellings")
# the mu-based family TeX prices in fractions of a quad, plus the ones that carry their OWN length
SPELLINGS = [
    (r"\,", "mu thin"),
    (r"\:", "mu med"),
    (r"\;", "mu thick"),
    (r"\!", "mu neg thin"),
    (r"\ ", "backslash space"),
    (r"~", "tie"),
    (r"\quad", "quad"),
    (r"\qquad", "two quad"),
    (r"\thinspace", "named thin"),
    (r"\medspace", "named med"),
    (r"\enspace", "named en"),
    (r"\negthinspace", "named neg thin"),
    (r"\hspace{2mm}", "hspace mm"),
    (r"\hspace{0.5em}", "hspace em"),
    (r"\hspace*{3pt}", "hspace star"),
    (r"\mspace{3mu}", "mspace mu"),
    (r"\hspace{\fill}", "hspace fill"),
]


def one(tex):
    doc = (r"\documentclass{article}\usepackage{amsmath}\usepackage{wasysym}"
           r"\begin{document}$a %s b$ \par x %s y\end{document}" % (tex, tex.replace("$", "")))
    out, err = mathconv.run_pandoc(doc)
    rows = [ln.strip() for ln in out.splitlines() if ln.strip()]
    return " / ".join(rows)[:120] if rows else ("ERR " + err.strip()[:80])


def spellings():
    for tex, name in SPELLINGS:
        print("  %-18s %-14s  %s" % (name, tex, one(tex)))


def face():
    prods = glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))
    occ = paps = 0
    for path in prods:
        text = io.open(path, encoding="utf-8").read()
        n = text.count("#h(0em)")
        if n:
            occ += n
            paps += 1
    print("  products: `#h(0em)` %d occurrences over %d papers (%d .typ)" % (occ, paps, len(prods)))
    flat = glob.glob(os.path.join(WORK, "flat", "*.tex"))
    print("  source spellings over %d flat files:" % len(flat))
    pat = {
        r"\,": rb"\\,",
        r"\:": rb"\\:",
        r"\;": rb"\\;",
        r"\!": rb"\\!",
        r"\ ": rb"\\ ",
        r"\quad": rb"\\quad",
        r"\qquad": rb"\\qquad",
        r"\thinspace": rb"\\thinspace",
        r"\medspace": rb"\\medspace",
        r"\enspace": rb"\\enspace",
        r"\negthinspace": rb"\\negthinspace",
        r"\hspace{2mm}": rb"\\hspace\{",
        r"\hspace*{3pt}": rb"\\hspace\*",
        r"\mspace{3mu}": rb"\\mspace",
    }
    for tex, _name in SPELLINGS:
        rx = pat.get(tex)
        if rx is None:
            continue
        occ = paps2 = 0
        for path in flat:
            raw = io.open(path, "rb").read()
            n = len(re.findall(rx, raw))
            if n:
                occ += n
                paps2 += 1
        print("    %-16s %6d occurrences  %4d papers" % (tex, occ, paps2))


if MODE == "face":
    face()
else:
    spellings()
