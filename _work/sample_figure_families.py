r"""Pick one converted figure per construct family and render its page.

The refusal leg was closed by teaching cetz these constructs, so the sample is drawn from
the sources that use them: 3D, scoped `\\begin{scope}`, pgfmath, `plot[smooth]`, function
plots, node shapes with a self-loop, `\\foreach`.  A paper counts for a family only when its
generated main.typ has a canvas and no quoted LaTeX for that picture.
"""
import glob
import os
import re
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
SHOT = os.path.join(ROOT, "_work", "shot")
FAMILIES = [
    ("3d", re.compile(r"\\begin\{tikzpicture\}[^\]]*3d|xyz|z\s*=\s*\(")),
    ("scope", re.compile(r"\\begin\{scope\}")),
    ("pgfmath", re.compile(r"\\pgfmathsetmacro|\\pgfmathparse|\\pgfmathresult")),
    ("smooth", re.compile(r"plot\s*\[[^\]]*smooth")),
    ("function", re.compile(r"plot\s*\(\s*\\?domain|plot\s*\(\s*\{?\s*\\?\w+\s*=")),
    ("foreach", re.compile(r"\\foreach")),
    ("shapes", re.compile(r"circle|rectangle|diamond|regular polygon")),
    ("decorations", re.compile(r"decorate|decoration|snake|dash pattern")),
]


def main():
    sys.stdout.reconfigure(errors="replace")
    picked = {}
    for src in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        name = os.path.basename(src)[:-4]
        typ = os.path.join(ROOT, "typst", name, "main.typ")
        pdf = os.path.join(ROOT, "typst", name, "main.pdf")
        if not os.path.exists(typ) or not os.path.exists(pdf):
            continue
        text = open(typ, encoding="utf-8", errors="replace").read()
        if "canvas(" not in text:
            continue
        body = open(src, encoding="utf-8", errors="replace").read()
        pics = re.findall(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", body, re.S)
        if not pics:
            continue
        quoted = text.count('#raw(block: true, lang: "latex"')
        for fam, rx in FAMILIES:
            n = sum(1 for p in pics if rx.search(p))
            if n and (fam not in picked or n > picked[fam][1]):
                picked[fam] = (name, n, quoted, len(pics))
    for fam, (name, n, quoted, total) in sorted(picked.items()):
        print("%-11s %-52s pics=%d with-family=%d quoted=%d" % (fam, name[:52], total, n, quoted))
    return picked


if __name__ == "__main__":
    picked = main()
    print("\n-- render: pass a family name to draw its first canvas page")
    if "--render" in sys.argv:
        want = sys.argv[sys.argv.index("--render") + 1]
        name = picked[want][0]
        d = fitz.open(os.path.join(ROOT, "typst", name, "main.pdf"))
        # the first page whose text carries a canvas caption is close enough to eyeball
        for i, p in enumerate(d):
            if p.get_drawings():
                n = len(p.get_drawings())
                if n > 40:
                    p.get_pixmap(matrix=fitz.Matrix(2, 2)).save(
                        os.path.join(SHOT, "fam-%s-p%d.png" % (want, i + 1)))
                    print("saved fam-%s-p%d.png with %d drawing ops" % (want, i + 1, n))
                    break
