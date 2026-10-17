"""Print the canvas index (0-based, as cetz builds them) whose body carries a given symbol."""
import re
import sys
import glob

paper, word = sys.argv[1], sys.argv[2]
src = glob.glob("typst/%s*/main.typ" % paper)[0]
text = open(src, encoding="utf-8").read()
for i, m in enumerate(re.finditer(r"#cetz\.canvas\(\{.*?\n\}\)", text, re.S)):
    if word in m.group(0):
        print(src, "canvas", i)
        line = [l for l in m.group(0).splitlines() if word in l]
        print("   ", line[0].strip()[:200] if line else "")
