r"""How many canvas lines in the PRODUCTS carry an `anchor:`, and how many of them sit on a box.

Run this on the products BEFORE the batch and again after: #62 adds the anchor to the framed branches
of `emit_node`, so the expected delta is the 261 lines the churn probe counted, and none of them can
land inside a `#box(` argument list -- Typst's `box` has no `anchor:` parameter and a canvas that
invents one does not compile.
"""
import glob
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

CONTENT = re.compile(r"content\(([^)]*)\)")
ANCHOR = re.compile(r', anchor: "([^"]+)"')


def main():
    total = on_box = 0
    names = {}
    papers = set()
    for path in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
        stem = os.path.basename(os.path.dirname(path))
        hit = 0
        for line in open(path, encoding="utf-8", errors="replace"):
            for m in ANCHOR.finditer(line):
                total += 1
                hit += 1
                names[m.group(1)] = names.get(m.group(1), 0) + 1
                # the anchor is CeTz's `content` argument when the `, anchor:` sits after the box's
                # own closing `)]` -- count the other spelling, an anchor inside `#box(`, separately
                if "#box(" in line[:m.start()] and ")]" not in line[:m.start()]:
                    on_box += 1
        if hit:
            papers.add(stem)
    print("anchors on products: %d in %d papers, inside a #box argument: %d"
          % (total, len(papers), on_box))
    print("by name: %s" % sorted(names.items(), key=lambda kv: -kv[1]))


if __name__ == "__main__":
    main()
