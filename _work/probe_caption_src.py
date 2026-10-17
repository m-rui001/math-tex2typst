r"""Print the source float that lost its caption, and what the converter made of it.

`caption_loss_report.py` says a caption string from the flattened source is absent from the
generated main.typ. This shows the source bytes around it and the same region of the page, so the
branch that swallowed it is visible rather than guessed at.
"""
import os
import re
import sys

ROOT = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
CAP = re.compile(sys.argv[2] if len(sys.argv) > 2 else r"Universal lower and upper")


def main():
    paper = sys.argv[1]
    src_path = os.path.join(ROOT, "_work", "flat", "%s.tex" % paper)
    out_path = os.path.join(ROOT, "typst", paper, "main.typ")
    src = open(src_path, encoding="utf-8", errors="replace").read()
    out = open(out_path, encoding="utf-8", errors="replace").read()
    for m in CAP.finditer(src):
        lo = max(0, src.rfind("\n", 0, m.start() - 400))
        hi = src.find("\n", m.end() + 400)
        print("=== SOURCE %s..%s ===" % (lo, hi))
        print(src[lo:hi])
    print("=== hits of the caption words in main.typ ===")
    for m in CAP.finditer(out):
        print(repr(out[max(0, m.start() - 200):m.end() + 120]))
    if not CAP.search(out):
        print("(none)")
    print("=== div classes around the float in the AST ===")
    print(open(os.path.join(ROOT, "typst", paper, "report.json"),
               encoding="utf-8", errors="replace").read()[:600])


main()
