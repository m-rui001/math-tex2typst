r"""Sort the labels that still print `\(` after a break into families and read each off the page.

`#linebreak()\(` is the witness that a node body reached Typst with TeX's inline-math delimiters
still written out. Typst escapes them to plain parentheses, so a prose `\(an annulus\)` is correct
markup; a group that holds `$…$` is the NODE_MATH alternation matching the inner dollar pair first
and leaving the outer delimiters as prose -- and only the page says whether that prints the
parentheses TeX prints or shows the dollars.
"""
import glob
import io
import os
import re
import sys

import pymupdf

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = r"E:\math"
B = chr(92)
OPEN = re.escape(B + "(")


def family(shown):
    tail = shown.split(B + "(", 1)[1] if B + "(" in shown else shown
    end = tail.find(B + ")")
    inner = tail[:end] if end >= 0 else tail[:40]
    if "$" in inner:
        return "nested-dollar"
    if re.search(r"[A-Za-z]", inner):
        return "prose"
    return "other"


hits = {}
for path in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
    text = open(path, encoding="utf-8").read()
    for m in re.finditer(r"#linebreak\(\)" + OPEN, text):
        shown = text[m.start():m.start() + 90].replace("\n", " ")
        name = os.path.basename(os.path.dirname(path))
        if name.startswith("A-Counterexample-to-Kaplanskys"):
            continue
        kind = family(shown)
        hits.setdefault(kind, []).append((name, shown))

for kind, items in sorted(hits.items()):
    names = sorted({i[0][:55] for i in items})
    print("== %s: %d labels / %d papers" % (kind, len(items), len(names)))
    for shown in [i[1] for i in items[:4]]:
        print("   %s" % shown)

# One page read per family: take a word from the label and look for the delimiters around it.
for kind, items in sorted(hits.items()):
    if not items:
        continue
    name, shown = items[0]
    folder = os.path.join(ROOT, "typst", name)
    pdf = glob.glob(os.path.join(folder, "*.pdf"))
    if not pdf:
        print("!! %s has no pdf: %s" % (kind, name))
        continue
    tail = shown.split(B + "(", 1)[1]
    words = re.findall(r"[A-Za-z]{4,}", tail)[:2]
    doc = pymupdf.open(pdf[0])
    print("-- %s page read (%s):" % (kind, name[:55]))
    for page in doc:
        flat = " ".join(page.get_text().split())
        if words and all(w in flat for w in words):
            i = flat.find(words[0])
            print("   PAGE: %s" % flat[max(0, i - 45):i + 90])
            break
    doc.close()
