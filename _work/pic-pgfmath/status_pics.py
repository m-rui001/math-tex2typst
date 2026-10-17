r"""Per-picture status table for the three owned papers, live tree vs sandbox tree.

status.txt's one-line-per-picture contract needs the refused index in each paper, not just a count,
so this replays every picture of the three papers through the production path in both trees and
prints converted/None per side. None is what the converter writes as
`#raw(block: true, lang: "latex", ...)` in typst/main.typ.

Usage: python status_pics.py
"""
import re
import sys

FLAT = r"E:\math\_work\flat\%s.tex"
PAPERS = ("Finite-cylinder-approximation-of-ruled-sets-September-27-2026",
          "Universal-Tensor-Squares-for-Symmetric-Groups-September-24-2026",
          "Critical-strip-crossing-mass-on-the-honeycomb-lattice-September-26-2026")
# the construct each refused picture turns on, in the order the spec's families name them
FAMILIES = (("\\pgfmathsetmacro", "pgfmath arithmetic in a loop"),
            ("\\pgfmathtruncatemacro", "pgfmath comparison + \\ifnum"),
            ("\\ifnum", "\\ifnum branches"), ("\\foreach", "\\foreach only"),
            ("\\begin{scope}", "scope only"))


def build_side(tree):
    for name in list(sys.modules):
        if name.startswith("t2t"):
            del sys.modules[name]
    sys.path.insert(0, tree)
    from t2t import cetz, convert, prep
    sides = []
    for paper in PAPERS:
        src = open(FLAT % paper, encoding="utf-8", errors="replace").read()
        pre_text, body = prep.split_document(src)
        p = prep.parse_preamble(pre_text)
        cm = convert.line_cm(p)
        pics = re.findall(r"\\begin{tikzpicture}.*?\\end{tikzpicture}", body, re.S)
        rows = []
        for index, pic in enumerate(pics):
            got = cetz.build(prep.expand_macros(pic, p.macros), line_cm=cm)
            rows.append((index, got is not None, len(pic), pic))
        sides.append(rows)
    sys.path.remove(tree)
    return sides


def family(pic):
    for token, label in FAMILIES:
        if token in pic:
            return label
    return "plain tikz"


live = build_side(r"E:\math\tools")
sandbox = build_side(r"E:\math\_work\pic-pgfmath")
for paper, rows_l, rows_s in zip(PAPERS, live, sandbox):
    print(paper)
    for (index, ok_l, size, pic), (_, ok_s, _, _) in zip(rows_l, rows_s):
        print("  #%d %-42s live %-9s sandbox %-9s %d chars"
              % (index, family(pic), "converted" if ok_l else "REFUSED",
                 "converted" if ok_s else "REFUSED", size))
    print("  raw latex blocks: live %d -> sandbox %d"
          % (sum(0 if ok else 1 for _, ok, _, _ in rows_l),
             sum(0 if ok else 1 for _, ok, _, _ in rows_s)))
