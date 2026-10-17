r"""How many source pictures never reach the page, and how many leave a quoted block instead?

§7's row on silent canvas loss was written when the two populations coincided (16 refused = 16 quoted
blocks).  The static gate now refuses 14 on its own basis, which says nothing about the products, so
this counts the three things a reader can actually see: pictures in the flat source, `#cetz.canvas(`
lines in the built product, and `#raw(block: true, lang: "latex")` blocks.
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
CANVAS = re.compile(r"#cetz\.canvas\(")
QUOTED = re.compile(r'#raw\(block: true, lang: "latex"')


def main():
    papers = missing = quoted_blocks = quoted_papers = 0
    pics = canvases = 0
    hits = []
    for src in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        stem = os.path.basename(src)[:-4]
        typ = os.path.join(ROOT, "typst", stem, "main.typ")
        if not os.path.isfile(typ):
            alt = glob.glob(os.path.join(ROOT, "typst", stem + "*", "main.typ"))
            if not alt:
                continue
            typ = alt[0]
        text = open(src, encoding="utf-8", errors="replace").read()
        n_pic = len(PIC.findall(text))
        body = open(typ, encoding="utf-8", errors="replace").read()
        n_canvas = len(CANVAS.findall(body))
        n_quoted = len(QUOTED.findall(body))
        papers += 1
        pics += n_pic
        canvases += n_canvas
        quoted_blocks += n_quoted
        short = n_pic - n_canvas
        if short > 0:
            missing += short
            quoted_papers += 1 if n_quoted else 0
            hits.append((stem[:60], n_pic, n_canvas, n_quoted))
    print("papers %d / source pictures %d / canvases on the page %d"
          % (papers, pics, canvases))
    print("pictures with no canvas: %d ; quoted latex blocks: %d over %d papers"
          % (missing, quoted_blocks, quoted_papers))
    for row in hits:
        print("  %-60s pics=%d canvas=%d quoted=%d" % row)


if __name__ == "__main__":
    main()
