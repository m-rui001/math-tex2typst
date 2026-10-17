r"""What kinds of stroked path does the census count as a "box"?

A CeTz node frame is a rectangle; a curve or a polygon is not, and taking its bounding box as a frame
makes every label that brushes the *box around* an arc look like an invasion. Print the fitz item types
behind the candidate rects of a few canvases.
"""
import os
import sys

import fitz

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import probe81_label_box_face as P  # noqa: E402


def tally(page):
    kinds = {}
    for d in page.get_drawings():
        if d.get("color") is None:
            continue
        r = d["rect"]
        if not (P.MIN_W <= r.width <= P.MAX_W and 2 < r.height <= P.MAX_H):
            continue
        key = tuple(sorted({i[0] for i in d["items"]}))
        kinds.setdefault(key, [0, 0])
        kinds[key][0] += 1
        kinds[key][1] += r.width * r.height
    return kinds


def main():
    canv = P.canvases()
    items = sorted(canv.items())
    picked = [(stem, k, head, block) for (stem, k), (head, block) in items
              if stem.startswith(("Finite-cylinder", "The-crossing-number", "Cycle-clique",
                                  "Mass-and-covering", "Cylinder-amplitudes", "A-product-counter"))]
    from collections import Counter
    total = Counter()
    for stem, k, head, block in picked[:8]:
        got = P.render(block, "tally_%d" % k, head)
        if not got:
            print("refused %s#%d" % (stem[:30], k))
            continue
        doc = fitz.open(os.path.join(P.TMP, "tally_%d.pdf" % k))
        for kind, (n, area) in sorted(tally(doc[0]).items()):
            print("%-34s#%d %-14s %3d cand rects" % (stem[:34], k, ",".join(kind), n))
            total[kind] += n
        doc.close()
    print("\nall candidates by item type:", dict(total))


if __name__ == "__main__":
    main()
