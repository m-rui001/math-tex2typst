"""Who writes a 3D coordinate, and what does their scope declare?

The basis is measured: ux and uy are the scope's own axis vectors, while uz is a fixed page vector of
(-0.385, -0.385) cm that ignores `x=`/`y=` but doubles under `scale=2` (all four cases in
`_work/measure_3d_basis.py`). So a 3D coordinate is emittable exactly when the scope's `scale` is
known to be 1 -- which is why this lists, per picture that carries a three-component coordinate,
whether any head or scope in it declares scale/xscale/yscale or tilts the plane.
"""
import collections
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PICTURE = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
BRACKET = re.compile(r"\[([^\[\]]*)\]")
TRIPLE = re.compile(r"\(\s*[-+0-9.,a-zA-Z{}*+/ -]*?\s*,\s*[^,()]*?\s*,\s*[^,()]*?\s*\)")
SCALED = re.compile(r"(^|[,{}= ])(scale|xscale|yscale)\s*=")


def three_d(inner):
    parts = cetz.split_top(inner, ",")
    return len(parts) == 3 and all(cetz.expr(p) is not None for p in parts)


rows = collections.Counter()
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    paper = path.name[:-4]
    src = path.read_text(encoding="utf-8", errors="replace")
    for m in PICTURE.finditer(src):
        pic = m.group(0)
        coords = [t for t in re.finditer(r"\(([^()]*)\)", pic) if three_d(t.group(1))]
        if not coords:
            continue
        heads = [b.group(1) for b in BRACKET.finditer(pic)]
        scaled = [h for h in heads if SCALED.search(h)]
        tilt = [h for h in heads if re.search(r"(^|[,{}= ])(rotate|cm|xslant|yslant)\s*=", h)
                or re.search(r"(^|[,{}= ])x\s*=\s*\(", h)]
        builds = cetz.build(cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", pic), 15.79)) is not None
        key = "%d 3D coords | scale=%s | tilt=%s | builds today=%s" % (
            len(coords), bool(scaled), bool(tilt), builds)
        rows[key] += 1
        if rows[key] <= 3:
            print("%-52s %s" % (paper[:52], key))
            print("        scaled=%s tilt=%s" % (scaled[:2], tilt[:2]))

print("---- shapes ----")
for k, n in rows.most_common():
    print("%3d  %s" % (n, k))
