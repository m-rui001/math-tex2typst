r"""Every way the corpus asks for a bend, counted on the source.

The fix routes a bend through the same arm law as `out=/in=`, so the shapes that key can take decide
what has to be measured: is the angle always written, does `looseness` ever ride on a bend, does the
corpus use `bend left` inside `scope` options or `every to`. This counts the option spellings that
appear in a `to[...]`/`--[...]` bracket over all flat papers, the pictures and papers they touch, and
how many of those pictures also write a node on the bent edge -- the family #51 filed.
"""
import collections
import glob
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

BRACKET = re.compile(r"(?:to|--)\s*\[([^\]]*)\]")
BEND = re.compile(r"bend\s+(left|right)\s*(?:=\s*(-?[\d.]+))?")
NODE = re.compile(r"node\s*\[?")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)


def main():
    forms = collections.Counter()
    pics_bend = pics_node = papers = 0
    loose_on_bend = []
    for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        body = open(path, encoding="utf-8", errors="replace").read()
        touched = False
        for pic in PIC.findall(body):
            hit = node = False
            for inner in BRACKET.findall(pic):
                for got in BEND.finditer(inner):
                    hit = True
                    side, deg = got.group(1), got.group(2)
                    forms["bend %s%s" % (side, "=..." if deg else " (bare)")] += 1
                    if "looseness" in inner:
                        loose_on_bend.append((os.path.basename(path), inner.strip()[:90]))
            if hit:
                pics_bend += 1
                touched = True
                if NODE.search(pic):
                    node = True
                    pics_node += 1
            _ = node
        if touched:
            papers += 1
    for form, n in forms.most_common():
        print("%-24s %d" % (form, n))
    print("pictures with a bend %d, of which carry a node %d, papers %d"
          % (pics_bend, pics_node, papers))
    print("bend brackets that also write looseness: %d" % len(loose_on_bend))
    for stem, inner in loose_on_bend[:5]:
        print("   %s: %s" % (stem[:34], inner))


if __name__ == "__main__":
    main()
