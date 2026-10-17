import io
import re
import sys
from pathlib import Path

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
sys.path.insert(0, "tools")
from t2t import cetz

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
STMT = re.compile(r"\\(?:draw|fill|filldraw|path|node|shade|clip)\s*\[([^\]]*)\]")
TILT = re.compile(r"(?:^|[,{\s])rotate\s*=\s*(-?[\d.]+)")

# the plain diagonal case has to be untouched: a picture with no tilt must build identically
built = refused = turned = flat = 0
examples = []
for f in sorted(Path("_work/flat").glob("*.tex")):
    for pic in PIC.findall(f.read_text(encoding="utf-8", errors="replace")):
        angles = [float(a) for m in STMT.finditer(pic) for a in TILT.findall(m.group(1))]
        if not angles:
            continue
        canvas = cetz.build(pic)
        if canvas is None:
            refused += 1
            continue
        built += 1
        want = ["rotate(%.4gdeg)" % -a for a in angles]
        got = re.findall(r"rotate\([-\d.e]+deg\)", canvas)
        if all(w in canvas for w in want):
            turned += 1
        else:
            flat += 1
            if len(examples) < 6:
                examples.append((f.stem[:44], want, got))

print("pictures whose node text carries a tilt: now turned %d, still flat %d, refused %d"
      % (turned, flat, refused))
for e in examples:
    print("  ", e)
