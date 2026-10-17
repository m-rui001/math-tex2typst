"""How many drawn canvases declare a `text width` but emit a frame with no `width:`?

The Turn-Based p15 screenshot says a `text width=5.7cm` box hugs its words instead of spanning the
declared width. This counts it over the corpus: per picture, the number of node options carrying
`text width` (or `minimum width`) against the number of emitted `width:` arguments, so the family is
sized before anything is changed.
"""
import os
import re
import sys
import glob

sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))
sys.stdout.reconfigure(errors="replace")

from t2t import cetz  # noqa: E402

FLAT = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "_work/flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
NODE = re.compile(r"\\(?:node|coordinate)\s*(\[[^\]]*\])?")
WIDTH_ARG = re.compile(r"\bwidth: ")
RADIUS_ARG = re.compile(r"radius: ")


def main():
    canvases = papers = 0
    declared_total = emitted_total = 0
    circle_total = 0
    sample = []
    for src in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        text = open(src, encoding="utf-8", errors="replace").read()
        base = os.path.basename(src)[:-4]
        hit = 0
        for p in PIC.findall(text):
            got = cetz.build(p)
            if got is None:
                continue
            declared = 0
            for m in NODE.finditer(p):
                if not m.group(1):
                    continue
                o = cetz.opts(m.group(1)[1:-1])
                if o.get("circle") and o.get("minimum size"):
                    # a circle carries its size as a radius, not a width -- not this family
                    circle_total += 1
                    continue
                if o.get("text width") or o.get("minimum width"):
                    declared += 1
            emitted = len(WIDTH_ARG.findall(got)) + len(RADIUS_ARG.findall(got))
            declared_total += declared
            emitted_total += emitted
            if declared and emitted < declared:
                hit += 1
                if len(sample) < 6:
                    sample.append("%s: declared %d, emitted width: %d" % (base[:44], declared, emitted))
        if hit:
            canvases += hit
            papers += 1
    print("canvases with a declared width the frame does not carry: %d over %d papers"
          % (canvases, papers))
    print("declared %d (rect/paragraph), emitted %d, circle nodes set aside %d"
          % (declared_total, emitted_total, circle_total))
    for s in sample:
        print("  " + s)


if __name__ == "__main__":
    main()
