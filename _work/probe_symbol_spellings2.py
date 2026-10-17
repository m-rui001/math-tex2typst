"""The argument-free commands that leak, and a Typst spelling for each.

A command with no argument and no entry in MATH_SYMBOLS reaches the page as its own name, so this
first counts exactly those across the flattened pictures, then compiles candidate spellings for the
ones that matter. Only a candidate typst accepts may go into the table.
"""
import collections
import glob
import os
import re
import subprocess
import sys
import tempfile

sys.path.insert(0, os.path.join("tools"))
from t2t import cetz

MATHSPAN = re.compile(r"\$([^$]*)\$")
# a control word NOT followed by an argument or a letter-only word: argument-free
WORD = re.compile(r"\\([a-zA-Z]+)(?![A-Za-z])")

CANDIDATES = {
    "cap": ["sect", "intersection"],
    "cup": ["union"],
    "setminus": ["without"],
    "i": ["i.dot"],
    "displaystyle": [" "],
    "Downarrow": ["arrow.d.double", "arrow.b.double", "Downarrow", "downarrow.double", "arrow.t.double"],
    "Uparrow": ["arrow.u.double", "arrow.t.double", "uparrow.double"],
    "updownarrow": ["arrow.u.d", "updown", "arrow.up.down"],
    "downarrow": ["arrow.d", "down"],
    "uparrow": ["arrow.u", "up"],
    "mapsto": ["arrow.r.bar", "mapsTo", "arrow.mono"],
    "longrightarrow": ["arrow.r.long"],
    "le": ["lt.eq"],
    "rightrightarrows": ["arrow.r.double.bar"],
    "twoheadrightarrow": ["arrow.r.twohead", "arrow.r.double.head"],
    "curvearrowleft": ["arrow.l.curve"],
    "Rrightarrow": ["arrow.r.double.long"],
    "Longrightarrow": ["arrow.r.double.long"],
    "Vvdash": ["tack.r.v.v.v", "tack.r.triple"],
    "Vdash": ["tack.r.double"],
    "ddagger": ["dagger.double"],
    "S": ["section"],
    "P": ["wp"],
    "imath": ["imath"],
}

counts = collections.Counter()
for path in sorted(glob.glob(os.path.join("_work", "flat", "*.tex"))):
    tex = open(path, encoding="utf-8", errors="replace").read()
    for pic in re.finditer(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", tex, re.S):
        for m in MATHSPAN.finditer(pic.group(0)):
            for w in WORD.findall(m.group(1)):
                if "\\" + w not in cetz.MATH_SYMBOLS:
                    counts[w] += 1

print("argument-free unmapped commands (top 20):")
for w, n in counts.most_common(20):
    print("   %-22s %4d" % (w, n))

tmp = tempfile.mkdtemp(prefix="spell")
print("spellings:")
for latex, names in CANDIDATES.items():
    good = []
    for cand in names:
        path = os.path.join(tmp, "s.typ")
        with open(path, "w", encoding="utf-8") as fh:
            fh.write("$ %s $\n" % cand)
        got = subprocess.run(["typst", "compile", path, os.path.join(tmp, "s.pdf")],
                             capture_output=True, text=True, encoding="utf-8", errors="replace")
        if got.returncode == 0:
            good.append(cand)
    print("   %-20s %s" % (latex, ", ".join(good) or "NO SPELLING FOUND"))
