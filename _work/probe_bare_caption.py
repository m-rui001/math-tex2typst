r"""How many captioned tabulars sit outside any float, so pandoc has no place for the label?

A bare \\begin{{tabular}}…\\end{{tabular}} followed by \\caption{{…}}\\label{{…}} gives the reader a
table with no float to carry the caption: the number disappears and every reference to the key
dangles. Count the shape before wrapping it in an envelope.
"""
import collections
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
FLOAT = re.compile(r"\\begin\{(table\*?|figure\*?|sidewaystable)\}(.*?)\\end\{\1\}", re.S)
BARE = re.compile(r"\\begin\{(tabularx?|longtable|array|NiceTabular)\}.*?\\end\{\1\}\s*"
                  r"(?:\\renewcommand\{[^}]*\}\{[^}]*\}\s*)?\\caption\{", re.S)

papers = collections.Counter()
inside = 0
for src in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = src.read_text(encoding="utf-8", errors="replace")
    floats = [(m.start(), m.end()) for m in FLOAT.finditer(text)]
    for m in BARE.finditer(text):
        if any(a <= m.start() < b for a, b in floats):
            inside += 1
            continue
        papers[src.stem[:44]] += 1

print("captioned tabulars with no float: %d occurrences over %d papers"
      % (sum(papers.values()), len(papers)))
print("(another %d already sit inside a float)" % inside)
for name, n in papers.most_common(10):
    print("   %3d  %s" % (n, name))
