"""Walk convert_prose_batch step by step for one bib item that comes back missing.

Run: python _work/probe_bib5.py
"""
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import emit, mathconv  # noqa: E402

print("MARK=%r SENTINEL=%r" % (mathconv.MARK, mathconv.SENTINEL_RX.pattern))
print("PREAMBLE=%r" % mathconv.BATCH_PREAMBLE)
print("EPILOG=%r" % mathconv.BATCH_EPILOG)

tex = ROOT / "_work" / "flat" / "The-Artinian-Lex-Plus-Powers-Betti-Theorem-September-23-2026.tex"
src = tex.read_text(encoding="utf-8", errors="replace")
chunk = emit.THEBIB_RX.search(src).group(1)
chunk = chunk[:chunk.rindex("\\end{thebibliography}")]
items = []
for bm in emit.BIBITEM_RX.finditer(chunk):
    start = bm.end()
    nxt = chunk.find("\\bibitem", start)
    items.append(chunk[start:nxt if nxt > 0 else len(chunk)])

text = items[1]
print("convert_prose_batch ->", mathconv.convert_prose_batch([text]))
print("item 0 ->", repr(mathconv.convert_prose_batch([items[0]]).get(0))[:120])
