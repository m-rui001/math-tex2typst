"""How many node frames were inventions, and does the honeycomb label come out unframed now?

Counts the `#box(` calls the builder emits over the whole corpus and compares with the 1,128 that
run77's pages carry, then prints the three coloured labels of the honeycomb figure.
"""
import glob
import re
import sys

sys.path.insert(0, "tools")
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
boxes = nodes = pics = 0
for path in sorted(glob.glob("_work/flat/*.tex")):
    src = open(path, encoding="utf-8", errors="replace").read()
    for m in PIC.finditer(src):
        built = cetz.build(m.group(0))
        if built is None:
            continue
        pics += 1
        boxes += built.count("#box(")
        nodes += built.count("content(")
print("pictures built: %d   content(): %d   #box(): %d  (run77 pages carried 1128)"
      % (pics, nodes, boxes))

tex = glob.glob("_work/flat/Renewal-and-changes-of-law*.tex")[0]
src = open(tex, encoding="utf-8", errors="replace").read()
pic = next(p for p in PIC.findall(src) if "repair" in p)
for line in (cetz.build(pic) or "").splitlines():
    if "content" in line:
        print("   ", line.strip()[:126])
