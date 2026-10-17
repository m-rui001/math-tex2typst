"""True conversion count: every corpus picture through cetz.convert(), compile gate included."""
import collections
import pathlib
import re
import sys
import time

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PICTURE = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)

total = ok = 0
per_file = collections.Counter()
files = set()
t0 = time.time()
for tex in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = tex.read_text(encoding="utf-8", errors="replace")
    pics = PICTURE.findall(text)
    if not pics:
        continue
    for pic in pics:
        total += 1
        if cetz.convert(pic) is not None:
            ok += 1
            per_file[tex.name] += 1
            files.add(tex.name)
    if total % 100 == 0:
        print("%d/%d converted, %d pictures seen, %.0fs" % (ok, total, total, time.time() - t0),
              flush=True)
print("TOTAL %d pictures, %d converted (%.1f%%), papers touched %d, %.0fs"
      % (total, ok, 100.0 * ok / total, len(files), time.time() - t0))
