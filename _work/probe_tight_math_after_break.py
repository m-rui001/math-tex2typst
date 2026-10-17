r"""How many papers print a node label whose inline maths stood tight after a `\\` line break?

The failing shape is on the page, not in the source: `_markup_text` escapes the delimiters it never
read as maths, so the label shows `\(t[2,5]\)` where TeX showed the formula, and the control word
inside it (`\in`) is deleted with its name.  The product-side witness is a `#linebreak()` whose next
token is an escaped `(`, which is what a `\\` followed by `\(` becomes.
"""
import glob
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")

TIGHT = re.compile(r"#linebreak\(\)\\\(")
ANY = re.compile(r"\\\(")
papers = []
tokens = 0
for path in sorted(glob.glob(os.path.join(r"E:\math", "typst", "*", "main.typ"))):
    text = open(path, encoding="utf-8").read()
    hits = TIGHT.findall(text)
    if hits:
        papers.append(os.path.basename(os.path.dirname(path)))
        tokens += len(hits)
print("tight-after-break: %d papers, %d labels" % (len(papers), tokens))
# the source-side census of the same shape, to see whether papers not in the list above
# write `\\\(x\)` and lose it some other way
src_papers = []
for path in sorted(glob.glob(os.path.join(r"E:\math", "_work", "flat", "*.tex"))):
    text = open(path, encoding="utf-8", errors="replace").read()
    if re.search(r"\\\\\\\(", text):
        src_papers.append(os.path.basename(path)[:-4])
print("source writes \\\\ before \\( or \\[: %d papers" % len(src_papers))
missing = [p for p in src_papers if not any(p.startswith(q[:20]) for q in papers)]
print("in the source census but not on the page: %d" % len(missing))
for name in papers[:10]:
    print("  %s" % name[:78])
