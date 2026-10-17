import io
import re
import sys
import traceback
from collections import Counter
from pathlib import Path

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
sys.path.insert(0, "tools")
from t2t import cetz

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)

crashes = Counter()
where = {}
built = refused = 0
for f in sorted(Path("_work/flat").glob("*.tex")):
    for pic in PIC.findall(f.read_text(encoding="utf-8", errors="replace")):
        try:
            canvas = cetz.build(pic)
        except Exception:
            key = traceback.format_exc().splitlines()[-1][:90]
            crashes[key] += 1
            where.setdefault(key, (f.stem[:44],
                                   traceback.format_exc().splitlines()[-3].strip()[:80]))
            continue
        built += canvas is not None
        refused += canvas is None

print("pictures built:", built, "refused:", refused)
if crashes:
    print("CRASHES:")
    for k, n in crashes.most_common():
        print("  %3d  %s\n         at %s  (%s)" % (n, k, where[k][1], where[k][0]))
else:
    print("no picture raised an exception out of cetz.build")
