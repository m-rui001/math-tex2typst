r"""Every TeX accent a picture writes, in the shape the author gave it.

The `sane` investigation (轴 14) turned up a figure-text defect on the way: a node body carrying
`K\"ahler` loses the accent's command name to the markup pass and the punctuation is left standing
on the page, `K"ahler`. Before choosing how to put the accent back, the corpus has to say what it
actually writes -- which accent symbol, which letter, braced or not, and whether the accent sits in
prose or inside maths, because those two run through different passes of the converter.
"""
import glob
import os
import re
import sys
from collections import Counter

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(errors="replace")
from t2t import cetz  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
NODE = re.compile(r"\{((?:[^{}]|\{[^{}]*\})*)\}")
# TeX's accent control symbols and the two-letter word accents; each takes one letter, braced or not
ACCENT = re.compile(r"\\([\"'`^~=]|u|v|H|c|d|b|t)\s*(?:\{([A-Za-z])\}|([A-Za-z]))")

found = Counter()
for src in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
    text = open(src, encoding="utf-8", errors="replace").read()
    name = os.path.basename(src)[:-4]
    for pic in PIC.findall(text):
        for m in NODE.finditer(pic):
            body = m.group(1)
            for a in ACCENT.finditer(body):
                mark = a.group(1)
                letter = a.group(2) or a.group(3)
                braced = a.group(2) is not None
                maths = any(letter in s for s in re.findall(r"\$([^$]*)\$", body))
                found[(mark, letter, braced, maths)] += 1
                print("%s  \\%s%s%s  %s" % (name[:44], mark, "{" if braced else "",
                                            letter, "MATH" if maths else "prose"))
print("\nshape census:", dict(found))
