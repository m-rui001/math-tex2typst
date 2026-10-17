"""Which papers carry a size-specified delimiter around a delimiter-less matrix?"""
import glob
import sys

sys.path.insert(0, "tools")
from t2t import prep  # noqa: E402

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

names = []
for f in sorted(glob.glob("_work/flat/*.tex")):
    text = open(f, encoding="utf-8", errors="replace").read()
    n = len(prep.SIZED_MATRIX.findall(text))
    if n:
        names.append((f[len("_work/flat/"):-4], n))
for name, n in names:
    print("%3d  %s" % (n, name))
print("total %d in %d papers" % (sum(n for _, n in names), len(names)))
open("_work/regen_needed.txt", "w", encoding="utf-8").write(
    "".join(n + "\n" for n, _ in names))
