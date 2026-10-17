r"""How many figure labels carry a control word the paper defines itself?

A node label's maths goes through cetz's hand-written symbol table, which knows no paper macros,
so `$\cD_{c_b}$` (with `\newcommand{\cD}{\mathcal D}` in the preamble) loses its symbol. Count the
labels that need the preamble, over the pictures in _work/flat.
"""
import collections
import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[1]
PICTURE = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
DEFINES = re.compile(r"\\(?:newcommand|renewcommand|def|DeclareMathOperator)\s*\{?\s*\\([a-zA-Z]+)")
SPAN = re.compile(r"\$([^$]*)\$")
WORD = re.compile(r"\\([a-zA-Z]+)")
# the names cetz's table already spells, so a label using only these needs no preamble
from sys import path  # noqa: E402
path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

known = set(sym[1:] for sym in cetz.MATH_SYMBOLS)
labels = 0
papers = set()
per_paper = collections.Counter()
samples = []
for tex in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = tex.read_text(encoding="utf-8", errors="replace")
    macros = set(DEFINES.findall(text))
    if not macros:
        continue
    for pic in PICTURE.finditer(text):
        for span in SPAN.finditer(pic.group(0)):
            used = {w for w in WORD.findall(span.group(1)) if w in macros}
            if not used:
                continue
            labels += 1
            papers.add(tex.stem)
            per_paper[tex.stem] += 1
            if len(samples) < 12:
                samples.append("%s  %s  %s" % (tex.stem[:40], sorted(used), span.group(1)[:36]))

print("labels needing a paper macro: %d over %d papers" % (labels, len(papers)))
print("most in one paper:", per_paper.most_common(5))
print("\n-- samples --")
print("\n".join(samples))
