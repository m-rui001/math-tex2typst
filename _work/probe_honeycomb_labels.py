"""The honeycomb figure the author labels M and m: what does the source say, and what did we emit?

Prints the picture's own lines that mention the two pivots and the three text labels, then the lines of
our generated canvas that carry them, so a missing glyph and an invented frame are told apart.
"""
import glob
import re
import sys

sys.path.insert(0, "tools")
from t2t import cetz  # noqa: E402

tex = glob.glob("_work/flat/Renewal-and-changes-of-law*.tex")[0]
src = open(tex, encoding="utf-8", errors="replace").read()
pics = re.findall(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", src, re.S)
pic = next(p for p in pics if "repair" in p)
print("---- source picture (%d lines)" % pic.count("\n"))
for line in pic.splitlines():
    if re.search(r"node|M|m|label|primary|cut", line):
        print("   ", line.strip()[:120])
print("---- emitted canvas")
built = cetz.build(pic)
for line in (built or "").splitlines():
    if re.search(r"content|repair|primary|cut", line):
        print("   ", line.strip()[:130])
