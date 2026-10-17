"""Where a source picture writes `node distance`: picture head, scope, tikzset, or a node statement.

The head reading is the one the emitter misses (cetz.py keeps NODE_DISTANCE hard-coded), but a law is
only worth plumbing where the corpus writes it, so this counts every spelling on the same picture
list the census uses.
"""
import glob
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
ANY = re.compile(r"node\s+distance\s*=")
HEADISH = re.compile(r"\\begin\{tikzpicture\}\s*\[[^]]*node\s+distance", re.S)
SCOPE = re.compile(r"\\begin\{scope\}\[[^\]]*\bnode\s+distance")
TIKZSET = re.compile(r"\\(?:tikzset|usetikzlibrary)\{[^}]*node\s+distance")
NODE_OPT = re.compile(r"\\node\s*(?:\[[^\]]*node\s+distance[^\]]*\])")


def main():
    pics = head = any_ = scope = tset = own = 0
    heads = {}
    for path in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        src = io.open(path, encoding="utf-8", errors="replace").read()
        for m in PIC.finditer(src):
            pic = m.group(0)
            pics += 1
            if ANY.search(pic):
                any_ += 1
            if HEADISH.search(pic):
                head += 1
            if SCOPE.search(pic):
                scope += 1
            if TIKZSET.search(pic):
                tset += 1
            if NODE_OPT.search(pic):
                own += 1
    print("pictures: %d" % pics)
    print("  any `node distance=` inside: %d" % any_)
    print("  in the picture head brackets: %d" % head)
    print("  on a \\begin{scope}[...]: %d" % scope)
    print("  inside a \\tikzset{}: %d" % tset)
    print("  on a \\node[...] statement: %d" % own)
    return 0


if __name__ == "__main__":
    sys.exit(main())
