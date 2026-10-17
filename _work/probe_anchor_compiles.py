"""Do the anchored nodes the corpus emits actually compile through typst?

One picture per distinct anchor spelling, taken from the files the population probe named.
"""
import glob
import re
import sys

sys.path.insert(0, "tools")
from t2t import cetz

CHUNK = re.compile(r"\\begin{tikzpicture}(.*?)\\end{tikzpicture}", re.S)
WANTED = ['anchor: "north"', 'anchor: "south"', 'anchor: "east"', 'anchor: "west"',
          'anchor: "north-east"', 'anchor: "north-west"',
          'anchor: "south-east"', 'anchor: "south-west"', 'anchor: "center"']

found = {}
for path in sorted(glob.glob("_work/flat/*.tex")):
    src = open(path, encoding="utf-8", errors="replace").read()
    for m in CHUNK.finditer(src):
        built = cetz.build(m.group(0))
        if built is None:
            continue
        for want in WANTED:
            if want in built and want not in found:
                found[want] = (path.rsplit("/", 1)[-1], m.group(0), built)
    if len(found) == len(WANTED):
        break

for want in WANTED:
    got = found.get(want)
    if got is None:
        print("%-24s NOT FOUND in scanned files" % want)
        continue
    name, chunk, built = got
    ok = cetz.sane(built) and cetz.compiles(built)
    lines = [line.strip() for line in built.splitlines() if want in line]
    print("%-24s %-8s %s  %s" % (want, "ACCEPT" if ok else "REFUSE", name[:46], lines[0][:96]))
