r"""Compare the size of the same figure text in the TikZ render and in ours.

Line pitch and span height say what font a node's words were set in.  If the generated page
sets the same label taller than TikZ does, a `font=\footnotesize` on the node was dropped,
and boxes the author spaced for small type collide for a reason that has nothing to do with
the anchor.  Both documents are measured the same way: the shared words' span boxes.
"""
import glob
import os
import sys

import fitz

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORDS = ["Finite", "comparisons", "rectangles", "sectors", "Localization", "separated",
         "crosscuts", "Irregular-disk", "estimates", "screening", "Physical", "current"]


def rows(pdf, page_no):
    p = fitz.open(pdf)[page_no]
    out = []
    for blk in p.get_text("dict")["blocks"]:
        for ln in blk.get("lines", []):
            for sp in ln.get("spans", []):
                t = " ".join(sp["text"].split())
                if t:
                    out.append((t, fitz.Rect(sp["bbox"]), sp["size"], sp["font"]))
    return out


def main():
    sys.stdout.reconfigure(errors="replace")
    tex = glob.glob(os.path.join(ROOT, "_work", "cmp", "Self_dual*")) + \
        glob.glob(os.path.join(ROOT, "_work", "cmp", "Self-dual*"))
    tex = [x for x in tex if x.endswith(".pdf")][0]
    typ = glob.glob(os.path.join(ROOT, "typst", "Self-dual-random*", "main.pdf"))[0]
    for label, doc, page in (("tikz ", tex, 0), ("typst", typ, 7)):
        rs = rows(doc, page)
        print("-- %s: %d spans" % (label, len(rs)))
        for w in WORDS:
            hit = [(t, r, s, f) for (t, r, s, f) in rs if w in t]
            if hit:
                t, r, s, f = hit[0]
                print("   %-12s size %5.2f pt  height %5.2f  font %-18s %r"
                      % (w, s, r.height, f[:18], t[:26]))


if __name__ == "__main__":
    main()
