r"""Cut 300 dpi bands around the worst shaft-through-letters pairs so the eye can say what they are.

`_work/probe30_cd_page.py` counts pairs over a whole population; `crop` mode there writes one PNG per
*hitting page*, which for 56 papers is 61 files nobody will open.  This keeps only the worst N pairs,
and prints next to each crop whether the crossed ink is a tikzcd arrow's label at all -- the pair's
page geometry says that much (the shaft that crosses it is one the gauge already identified), while
whether the *author* wrote a CD environment there is what separates this row's defect from the
figure-and-table ink the same gauge also reads.

Usage: python _work/crop48_top.py [name-list] [N]
"""
import os
import re
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "_work"))
# the gauge installs its own utf-8 stdout wrapper at import; wrapping the buffer twice closes the
# first reader, so this probe prints through whatever it leaves behind
import probe30_cd_page as gauge  # noqa: E402

CD = re.compile(r"\\begin\{tikzcd\}|\\begin\{CD\}")


def main():
    listfile = sys.argv[1] if len(sys.argv) > 1 else os.path.join(ROOT, "_work", "cd48_names.txt")
    n = int(sys.argv[2]) if len(sys.argv) > 2 else 8
    names = [l.strip() for l in open(listfile, encoding="utf-8") if l.strip()]
    hits = []
    for name in names:
        pdf = os.path.join(ROOT, "typst", name, "main.pdf")
        if not os.path.exists(pdf):
            continue
        doc = fitz.open(pdf)
        for i, page in enumerate(doc):
            for d, seg, r, s in gauge.crossings(page):
                hits.append((d, name, i + 1, r, s, page.rect))
        doc.close()
    hits.sort(key=lambda h: h[0], reverse=True)
    texdir = os.path.join(ROOT, "_work", "flat")
    for d, name, page_no, r, s, rect in hits[:n]:
        tex = os.path.join(texdir, name + ".tex")
        kinds = []
        if os.path.exists(tex):
            src = open(tex, encoding="utf-8", errors="replace").read()
            kinds.append("tikzcd spans: %d" % len(CD.findall(src)))
            kinds.append("CD canvases in main.typ: %d" % _cd_count(
                os.path.join(ROOT, "typst", name, "main.typ")))
        clip = (fitz.Rect(r) + (-60, -45, 60, 45)) & rect
        out = os.path.join(ROOT, "_work", "crop48_%s_p%d.png" % (name[:22], page_no))
        doc = fitz.open(os.path.join(ROOT, "typst", name, "main.pdf"))
        doc[page_no - 1].get_pixmap(dpi=300, clip=clip).save(out)
        doc.close()
        print("   %5.1f pt  %s p%d  %r   %s   -> %s"
              % (d, name[:34], page_no, s[:34], " | ".join(kinds), os.path.basename(out)))


def _cd_count(path):
    if not os.path.exists(path):
        return "?"
    return open(path, encoding="utf-8", errors="replace").read().count("cetz.canvas")


if __name__ == "__main__":
    main()
