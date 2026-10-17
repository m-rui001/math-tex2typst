"""Do the canvases that now draw a node box compile?

The gate is a real typst run, so this is the one place a 'frame: "rect"' argument is proven
against the package instead of assumed.
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
ok = bad = 0
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    for pic in PIC.findall(path.read_text(encoding="utf-8", errors="replace")):
        canvas = cetz.build(pic)
        if canvas is None or "frame:" not in canvas:
            continue
        if cetz.compiles(canvas):
            ok += 1
        else:
            bad += 1
            print("FAIL %s\n%s" % (path.stem[:30], canvas[:400]))
print("framed canvases: %d compile, %d do not" % (ok, bad))
