"""Which built canvases fail cetz.sane()? sane needs no typst, so this is safe beside a batch.

convert() = build + sane + compiles, and the probes so far only used build(), so a canvas that
builds and then fails sane has been invisible -- a candidate for run63's drop of 7 conversions.
"""
import io
import re
import sys
from collections import Counter
from pathlib import Path

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
sys.path.insert(0, "tools")
from t2t import cetz

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)

bad = []
built = 0
for f in sorted(Path("_work/flat").glob("*.tex")):
    for pic in PIC.findall(f.read_text(encoding="utf-8", errors="replace")):
        canvas = cetz.build(pic)
        if canvas is None:
            continue
        built += 1
        if not cetz.sane(canvas):
            suspects = [l.strip()[:90] for l in canvas.splitlines()
                        if "rotate(" in l or "close:" in l]
            bad.append((f.stem[:40], suspects[:2] or [canvas.splitlines()[-1][:70]]))

print("built %d ; refused by sane %d" % (built, len(bad)))
for name, lines in bad[:10]:
    print("  %-42s %s" % (name, lines))
