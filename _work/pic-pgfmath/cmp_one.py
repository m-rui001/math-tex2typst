r"""Diff one picture's canvas between two trees so a hash change can be read, not guessed.

Usage: python cmp_one.py <live-tree> <sandbox-tree> <flat-name-prefix> <picture-index>
The picture is taken through the production path: the paper's own macros are expanded inside it and
the preamble's line width is handed to build(), exactly as convert_paper does before the drawing is
either a canvas or a quoted block of LaTeX.
"""
import re
import sys

first, second, prefix, index = sys.argv[1], sys.argv[2], sys.argv[3], int(sys.argv[4])
import glob

path = glob.glob(r"E:\math\_work\flat\%s*.tex" % prefix)[0]


def render(tree):
    sys.path.insert(0, tree)
    from t2t import cetz, convert, prep
    src = open(path, encoding="utf-8", errors="replace").read()
    pre_text, body = prep.split_document(src)
    p = prep.parse_preamble(pre_text)
    cm = convert.line_cm(p)
    pics = re.findall(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", body, re.S)
    pic = prep.expand_macros(pics[index], p.macros)
    got = cetz.build(pic, line_cm=cm)
    sys.path.remove(tree)
    for mod in [m for m in list(sys.modules) if m.startswith("t2t")]:
        del sys.modules[mod]
    return got


a, b = render(first), render(second)
if a is None or b is None:
    print("live:", "None" if a is None else "canvas", "| sandbox:",
          "None" if b is None else "canvas")
la = (a or "").splitlines()
lb = (b or "").splitlines()
import difflib
limit = int(sys.argv[5]) if len(sys.argv) > 5 else 40
for line in list(difflib.unified_diff(la, lb, "live", "sandbox", lineterm="", n=1))[:limit]:
    print(line)
print("lines live=%d sandbox=%d" % (len(la), len(lb)))
