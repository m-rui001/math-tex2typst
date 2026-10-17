"""How many TikZ pictures does the gate accept now?

Only build and sane() run: the compile gate costs a typst call per picture, and this probe is
about which statement still refuses, not about whether Typst agrees.
"""
import collections
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
kind = collections.Counter()
boxes = 0
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    for pic in PIC.findall(path.read_text(encoding="utf-8", errors="replace")):
        kind["pictures"] += 1
        canvas = cetz.build(pic)
        if canvas is None:
            kind["build-none"] += 1
            continue
        if "frame:" in canvas:
            boxes += 1
        kind["build-ok" if cetz.sane(canvas) else "insane"] += 1

print(dict(kind))
print("canvases drawing a node box: %d" % boxes)
