"""Tilted pictures that build but fail the typst compile gate: which emitted construct breaks?

build() is a static check and compiles() is the real gate; the probes so far only used build(),
so a canvas that builds and cannot compile looked like a win. This calls typst, so nothing else
may be compiling at the same time.
"""
import io
import pathlib
import re
import subprocess
import sys
import tempfile
from collections import Counter
from pathlib import Path

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
sys.path.insert(0, "tools")
from t2t import cetz

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
TILT = re.compile(r"rotate\s*=|rotate around\s*=|(?:^|[,{\s])[xy]\s*=\s*\{?\(")
HEADER = cetz.HEADER


def err(canvas):
    with tempfile.TemporaryDirectory() as tmp:
        src = pathlib.Path(tmp) / "t.typ"
        src.write_text(HEADER + "#set page(width: 300pt, height: 300pt)\n" + canvas,
                       encoding="utf-8")
        r = subprocess.run(["typst", "compile", str(src), str(pathlib.Path(tmp) / "t.pdf")],
                           capture_output=True, text=True, encoding="utf-8", errors="replace")
    return r.returncode, (r.stderr or r.stdout).strip().splitlines()[:4]


fails = Counter()
shown = []
ok = bad = 0
for f in sorted(Path("_work/flat").glob("*.tex")):
    for pic in PIC.findall(f.read_text(encoding="utf-8", errors="replace")):
        if not TILT.search(pic):
            continue
        canvas = cetz.build(pic)
        if canvas is None:
            continue
        code, lines = err(canvas)
        if code == 0:
            ok += 1
            continue
        bad += 1
        key = " | ".join(l[:70] for l in lines[1:3]) if len(lines) > 1 else lines[0][:70]
        fails[key] += 1
        if len(shown) < 4:
            suspect = [l for l in canvas.splitlines() if "rotate(" in l or "close: true" in l]
            shown.append((f.stem[:38], key, suspect[:2]))

print("tilted pictures that build: compile ok %d, FAIL %d" % (ok, bad))
for k, n in fails.most_common(8):
    print("  %2d  %s" % (n, k))
for s in shown:
    print("\n%s\n  %s\n  %s" % s)
