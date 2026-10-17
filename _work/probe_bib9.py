"""Show a thebibliography item verbatim and what pandoc does with it.

Run: python _work/probe_bib9.py [index]
"""
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import emit, mathconv  # noqa: E402

name = ("Commuting-Division-Coefficient-Forms-and-the-Artinian-Eisenbud-Green-Harris"
        "-Conjecture-September-23-2026")
src = (ROOT / "_work" / "flat" / (name + ".tex")).read_text(encoding="utf-8",
                                                             errors="replace")
chunk = emit.THEBIB_RX.search(src).group(1)
chunk = chunk[:chunk.rindex("\\end{thebibliography}")]
items = []
for bm in emit.BIBITEM_RX.finditer(chunk):
    start = bm.end()
    nxt = chunk.find("\\bibitem", start)
    items.append(chunk[start:nxt if nxt > 0 else len(chunk)])

idx = int(sys.argv[1]) if len(sys.argv) > 1 else 8
print("items:", len(items), "item %d has %d chars" % (idx, len(items[idx])))
print("---- RAW ----")
print(items[idx])
print("---- PANDOC ----")
doc = (mathconv.BATCH_PREAMBLE + "%s%06d\n\n" % (mathconv.MARK, idx) + items[idx]
       + "\n%sEND" % mathconv.MARK + mathconv.BATCH_EPILOG)
out, err = mathconv.run_pandoc(doc)
print("ERR:", err[:400])
print("OUT:", out[:400])
