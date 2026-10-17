r"""How many canvases draw a frame the author sized with a paragraph, and what `align=` says.

§7's open figure defect: a node written `text width=4cm, draw` gets a Typst `box` with `inset:`
and a stroke but no `width:`, so the frame hugs the words instead of the declared paragraph and a
connector that leaves its edge reads as a floating tick. Measured against pdflatex
(`_work/measure_textwidth_frame.py`): `text width` is the TEXT's width, the frame is that plus
twice `inner sep`, and the paragraph is LEFT-aligned unless `align=` says otherwise -- while
`minimum width` is the FRAME's width and centres its content.

This counts what the corpus would change: for every picture, the built canvas's `#box(` calls that
carry no `width:`, split by which size key the node declares and which `align=` word it writes, so
the mapping is sized by real spellings rather than by a guess.
"""
import glob
import os
import re
import sys
from collections import Counter

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(errors="replace")
from t2t import cetz  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
KEYS = ("text width", "minimum width", "minimum size", "minimum height")


def main():
    keys = Counter()
    aligns = Counter()
    canvases = papers = 0
    hit_papers = []
    for src in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        text = open(src, encoding="utf-8", errors="replace").read()
        name = os.path.basename(src)[:-4]
        hit = 0
        for pic in PIC.findall(text):
            found = [k for k in KEYS if re.search(r"\b%s\s*=" % re.escape(k), pic)]
            if not found:
                continue
            canvas = cetz.build(pic)
            if canvas is None:
                continue
            naked = [l for l in canvas.splitlines()
                     if "#box(" in l and "width:" not in l]
            if not naked:
                continue
            canvases += len(naked)
            hit += 1
            keys.update(found)
            for m in re.finditer(r"align\s*=\s*(?:\{([^{}]*)\}|([\w ]+))", pic):
                aligns[(m.group(1) or m.group(2)).strip()] += 1
        if hit:
            papers += 1
            hit_papers.append((hit, name))
    print("unwidthed #box( lines: %d, in %d papers" % (canvases, papers))
    print("size keys on those pictures:", dict(keys))
    print("align= spellings:", dict(aligns.most_common(12)))
    hit_papers.sort(reverse=True)
    for n, name in hit_papers[:10]:
        print("  %3d  %s" % (n, name[:58]))
    with open(os.path.join(ROOT, "_work", "textwidth_needed.txt"), "w",
              encoding="utf-8") as fh:
        fh.write("\n".join(n for _c, n in hit_papers))
    print("wrote _work/textwidth_needed.txt")


if __name__ == "__main__":
    main()
