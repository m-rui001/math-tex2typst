# Blind-spot census: backslash sequences that survive inside the generated Typst's maths.
# residue.py reports 0/0, but `\[`, `\]`, `\|` and friends are raw LaTeX on the page all the same.
import collections
import glob
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

MATH = re.compile(r"(?<![#$A-Za-z])\$[^$]*?(?<!\\)\$", re.S)
RAW = re.compile(r"\\[\[\]|<>^_.!-]|\\[a-zA-Z]+")

forms = collections.Counter()
papers = collections.Counter()
samples = collections.defaultdict(list)

for path in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
    text = open(path, encoding="utf-8", errors="replace").read()
    found = collections.Counter()
    for zone in MATH.findall(text):
        for m in RAW.findall(zone):
            if m in ("\\,", "\\;", "\\!", "\\%", "\\$", "\\&", "\\#", "\\_", "\\{", "\\}"):
                continue  # Typst's own escapes, not LaTeX
            found[m] += 1
    for f, n in found.items():
        forms[f] += n
        papers[f] += 1
        if len(samples[f]) < 3:
            samples[f].append(os.path.basename(os.path.dirname(path))[:40])

print("raw backslash forms inside maths: %d kinds, %d occurrences" % (len(forms), sum(forms.values())))
for f, n in forms.most_common(14):
    print("  %-12s %6d over %3d papers   %s" % (f, n, papers[f], samples[f]))
