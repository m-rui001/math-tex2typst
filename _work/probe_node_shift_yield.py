"""Node placements that carry their own shift: which values can we resolve, and what would refuse?

The refusal count matters: an unreadable shift would send a picture that draws today back to
quoted LaTeX, so the number says whether the fix is a net win before it is written.
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
STMT = re.compile(r"\\node\s*\[([^\]]*)\]")
MOVED = re.compile(r"(?:^|[,{\s])(xshift|yshift|shift)\s*=\s*([^,\]]+)")

resolvable, unreadable, refused_pics = Counter(), Counter(), set()
for f in sorted(Path("_work/flat").glob("*.tex")):
    for pic in PIC.findall(f.read_text(encoding="utf-8", errors="replace")):
        vals = []
        for m in STMT.finditer(pic):
            for key, val in MOVED.findall(m.group(1)):
                vals.append((key, val.strip()))
        if not vals:
            continue
        ok = []
        for key, val in vals:
            d = cetz._dim_cm(val) if key in ("xshift", "yshift") else cetz.point(val, None)
            (resolvable if d is not None else unreadable)[(key, val if d is None else "ok")] += 1
            if d is None:
                ok.append((key, val))
        if ok and cetz.build(pic) is not None:
            refused_pics.add((f.stem[:42], tuple(ok)))

print("node shift values we can read:", sum(resolvable.values()))
print("unreadable:", dict(unreadable))
print("pictures that draw today and would refuse on an unreadable shift:", len(refused_pics))
for name, vals in sorted(refused_pics)[:8]:
    print("   %-44s %s" % (name, vals))
