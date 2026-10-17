r"""Where in a tikzpicture does the node font size live?

Splits the 793 sized pictures by declaration site so the fix can be aimed: a picture-head
`font=\small`, an `every node/.style={font=...}`, a per-node `[font=...]`, or a bare size
command inside a node body.
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
NAME = r"(small|footnotesize|scriptsize|tiny|large|Large|LARGE|huge|Huge|normalsize)"
SIZES = re.compile(r"font\s*=\s*\\?%s" % NAME
                   + r"|font\s*=\s*\\fontsize\{([\d.]+)\}"
                   + r"|\\fontsize\{([\d.]+)\}"
                   + r"|\\(%s)\b" % NAME)
HEAD = re.compile(r"\\begin\{tikzpicture\}\s*\[[^\]]*\]", re.S)


def main():
    sys.stdout.reconfigure(errors="replace")
    tot = head = every = node = body = 0
    for src in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        text = open(src, encoding="utf-8", errors="replace").read()
        for p in PIC.findall(text):
            m = SIZES.search(p)
            if not m:
                continue
            tot += 1
            s = m.group(0)
            pre = p[max(0, m.start() - 80):m.start()]
            if "fontsize" in s:
                node += 1
            elif "font" in s:
                if re.search(r"every\s+node", pre):
                    every += 1
                elif HEAD.search(p) and m.start() < HEAD.search(p).end():
                    head += 1
                else:
                    node += 1
            else:
                body += 1
    print("sized pictures %d" % tot)
    print("  picture-head bare font=  %d" % head)
    print("  every node/.style font=  %d" % every)
    print("  per-node font= / fontsize %d" % node)
    print("  bare size cmd in body    %d" % body)


if __name__ == "__main__":
    main()
