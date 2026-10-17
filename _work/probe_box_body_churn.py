r"""#63's change face: which canvases differ once the body's own edges are written back?

The old law is replayed by monkeypatching `_box_body` back to the spelling it had before the fix, so a
canvas is counted only where the two builds actually differ, and a canvas that stops (or starts)
drawing is printed as damage rather than folded into the count.  Reading the products instead would
miss the pictures that build today but are quoted on the page, and reading the source would miss the
style tables a picture expands into its nodes.
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(encoding="utf-8", errors="replace")
from t2t import cetz  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)


def old_box_body(text, align, horizon=False):
    if horizon:
        inner = "#align(%s + horizon)[%s]" % (align or "left", text)
        return "[#set text(hyphenate: false); %s]" % inner
    inner = "#align(%s)[%s]" % (align, text) if align else text
    return "[#set text(hyphenate: false); %s]" % inner


def main():
    new = cetz._box_body
    hit = []
    papers = canvases = lines = 0
    lost, gained = [], []
    for src in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        text = open(src, encoding="utf-8", errors="replace").read()
        touched = False
        for pic in PIC.findall(text):
            cetz._box_body = new
            now = cetz.build(pic)
            cetz._box_body = old_box_body
            was = cetz.build(pic)
            if was is None and now is not None:
                gained.append(os.path.basename(src))
            if now is None and was is not None:
                lost.append(os.path.basename(src))
            if was == now:
                continue
            touched = True
            canvases += 1
            got = set((was or "").splitlines())
            lines += sum(1 for l in (now or "").splitlines() if l.strip() and l not in got)
        if touched:
            papers += 1
            hit.append(os.path.basename(src)[:-4])
    cetz._box_body = new
    with open(os.path.join(ROOT, "_work", "box_body_churn_list.txt"), "w",
              encoding="utf-8") as out:
        out.write("\n".join(hit) + "\n")
    print("changed canvases: %d / papers: %d / body lines rewritten: %d"
          % (canvases, papers, lines))
    print("lost build: %d  gained build: %d" % (len(lost), len(gained)))
    for name in (lost + gained)[:10]:
        print("  !! %s" % name)


if __name__ == "__main__":
    main()
