r"""How many floats are lost because their body is a math array rather than a tabular?

pandoc parses \\begin{{table}} only as a float when it finds tabular material; a body of
\\( \\begin{{array}}… \\end{{array}} \\) is one inline formula in a paragraph, and the caption
and label of the float go with it. Counting the shape says whether the rewrite is worth it.
"""
import collections
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
FLOAT = re.compile(r"\\begin\{(table\*?)\}(.*?)\\end\{\1\}", re.S)
ARRAY = re.compile(r"\\begin\{array\}")
TABULAR = re.compile(r"\\begin\{(tabular|tabularx|longtable|array|matrix|NiceTabular|tabu)\}")

papers = collections.Counter()
rows = []
for src in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = src.read_text(encoding="utf-8", errors="replace")
    lost = 0
    for m in FLOAT.finditer(text):
        body = m.group(2)
        if "\\caption" not in body:
            continue
        # the float is lost when its only material is math the reader calls inline
        if ARRAY.search(body) and not re.search(r"\\begin\{(tabular|tabularx|longtable|NiceTabular)\}", body):
            lost += 1
    if lost:
        papers[src.stem[:44]] = lost
        n_ref = len(re.findall(r"\\(?:ref|C?ref|eqref)\{", text))
        rows.append((lost, src.stem[:44], n_ref))

print("papers with array-only table floats: %d ; floats: %d"
      % (len(papers), sum(papers.values())))
for lost, name, _ in sorted(rows, reverse=True)[:10]:
    print("   %3d  %s" % (lost, name))
