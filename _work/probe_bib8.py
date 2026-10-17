"""Brace balance of a thebibliography item that pandoc refuses.

Run: python _work/probe_bib8.py
"""
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import emit, mathconv  # noqa: E402

name = ("Commuting-Division-Coefficient-Forms-and-the-Artinian-Eisenbud-Green-Harris"
        "-Conjecture-September-23-2026")
src = (ROOT / "_work" / "flat" / (name + ".tex")).read_text(encoding="utf-8",
                                                             errors="replace")
chunk = emit.THEBIB_RX.search(src).group(1)
chunk = chunk[:chunk.rindex("\\end{thebibliography}")]
items = []
for bm in emit.BIBITEM_RX.finditer(chunk):
    start = bm.end()
    nxt = chunk.find("\\bibitem", start)
    items.append(chunk[start:nxt if nxt > 0 else len(chunk)])

BS = chr(92)
it = items[int(sys.argv[1]) if len(sys.argv) > 1 else 8]
print("lines:", it.count("\n"), "chars:", len(it))
depth = 0
for ln, line in enumerate(it.split("\n"), 1):
    delta = 0
    i = 0
    while i < len(line):
        c = line[i]
        if c == BS:
            i += 2
            continue
        if c == "%":
            break
        if c == "{":
            delta += 1
        elif c == "}":
            delta -= 1
        i += 1
    depth += delta
    if delta or depth:
        print("%4d d=%+2d total=%+d %s" % (ln, delta, depth, line[:100]))
