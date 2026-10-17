"""Line endings of the pipeline modules, and the bib batch after the split retry.

Run: python _work/probe_check.py
"""
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import emit, mathconv  # noqa: E402

for p in sorted((ROOT / "tools" / "t2t").glob("*.py")):
    raw = p.read_bytes()
    lf, cr = raw.count(b"\n"), raw.count(b"\r")
    print("%-14s lf=%-5d cr=%-5d %s" % (p.name, lf, cr,
                                         "OK" if lf == cr or cr == 0 else "MIXED"))

name = ("Commuting-Division-Coefficient-Forms-and-the-Artinian-Eisenbud-Green-Harris"
        "-Conjecture-September-23-2026")
src = (ROOT / "_work" / "flat" / (name + ".tex")).read_text(encoding="utf-8", errors="replace")
chunk = emit.THEBIB_RX.search(src).group(1)
chunk = chunk[:chunk.rindex("\\end{thebibliography}")]
items = []
for bm in emit.BIBITEM_RX.finditer(chunk):
    start = bm.end()
    nxt = chunk.find("\\bibitem", start)
    items.append(chunk[start:nxt if nxt > 0 else len(chunk)])
got = mathconv.convert_prose_batch(items)
print("bib items=%d converted=%d" % (len(items), len(got)))
print("still raw:", [i for i in range(len(items)) if i not in got])
for i in sorted(got)[:2]:
    print("--- %d: %s" % (i, " ".join(got[i].split())[:150]))
