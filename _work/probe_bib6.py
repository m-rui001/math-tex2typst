"""Print the batch prose document around the line pandoc rejects.

Run: python _work/probe_bib6.py
"""
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import emit, mathconv  # noqa: E402

name = "Commuting-Division-Coefficient-Forms-and-the-Artinian-Eisenbud-Green-Harris-Conjecture-September-23-2026"
src = (ROOT / "_work" / "flat" / (name + ".tex")).read_text(encoding="utf-8", errors="replace")
chunk = emit.THEBIB_RX.search(src).group(1)
chunk = chunk[:chunk.rindex("\\end{thebibliography}")]
items = []
for bm in emit.BIBITEM_RX.finditer(chunk):
    start = bm.end()
    nxt = chunk.find("\\bibitem", start)
    items.append(chunk[start:nxt if nxt > 0 else len(chunk)])

chunks = ["%s%06d\n\n%s\n" % (mathconv.MARK, i, text) for i, text in enumerate(items)]
chunks.append("%sEND" % mathconv.MARK)
doc = mathconv.BATCH_PREAMBLE + "\n".join(chunks) + mathconv.BATCH_EPILOG
lines = doc.split("\n")
print("doc lines:", len(lines))
for n in range(138, min(152, len(lines))):
    print("%4d| %s" % (n + 1, lines[n][:150]))

# which item does that line belong to?
for i, text in enumerate(items):
    if i and ("ZQFX%06d" % i) in doc:
        pass
marker_line = {lines.index(l) for l in lines if l.startswith(mathconv.MARK)}
offending = max((m for m in marker_line if m <= 145), default=None)
print("item starting at or before line 145:", offending, repr(lines[offending])[:60]
      if offending is not None else "")
print("item text:", repr("\n".join(lines[offending:146]))[:400] if offending is not None else "")
