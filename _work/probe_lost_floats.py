# Corpus-wide: how many figure/table floats does the source have, and how many reach the Typst?
# Counts float starts in the flat source against emitted `#figure(` calls, plus caption text that
# never appears in the output. Read-only, no typst.
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")

FLOAT = re.compile(r"\\begin\{(figure|table|sidewaystable|figure\*|table\*|wrapfigure|sidewaysfigure)\}")
FIGURE = re.compile(r"#figure\(")
CAPTION = re.compile(r"\\caption\*?\{")


def norm(text):
    return " ".join(text.split())


def first_arg(text, i):
    j = text.index("{", i)
    depth = 0
    for k in range(j, len(text)):
        if text[k] == "{":
            depth += 1
        elif text[k] == "}":
            depth -= 1
            if not depth:
                return text[j + 1:k]
    return ""


worst = []
lost = 0
total_floats = 0
total_figures = 0
papers_with_loss = 0

for name in sorted(os.listdir(FLAT)):
    if not name.endswith(".tex"):
        continue
    paper = name[:-4]
    typ_p = os.path.join(ROOT, "typst", paper, "main.typ")
    if not os.path.isdir(os.path.dirname(typ_p)):
        continue
    flat = open(os.path.join(FLAT, name), encoding="utf-8", errors="replace").read()
    typ = norm(open(typ_p, encoding="utf-8", errors="replace").read())
    floats = len(FLOAT.findall(flat))
    figures = len(FIGURE.findall(typ))
    total_floats += floats
    total_figures += figures
    miss = 0
    for m in CAPTION.finditer(flat):
        text = norm(first_arg(flat, m.start()))[:48]
        if len(text) > 12 and text not in typ:
            miss += 1
    if miss:
        lost += miss
        papers_with_loss += 1
        worst.append((miss, paper, floats, figures))

worst.sort(reverse=True)
print("float starts in flat: %d ; #figure( emitted: %d" % (total_floats, total_figures))
print("captions whose text never reaches the output: %d over %d papers" % (lost, papers_with_loss))
for miss, paper, f, g in worst[:14]:
    print("   %3d captions lost  %-44s floats=%d figure(=%d" % (miss, paper[:44], f, g))
