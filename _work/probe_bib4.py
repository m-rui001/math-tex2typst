"""Show pandoc's own words for one bib item that the prose batch cannot convert.

Run: python _work/probe_bib4.py
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import emit, mathconv  # noqa: E402

tex = ROOT / "_work" / "flat" / "The-Artinian-Lex-Plus-Powers-Betti-Theorem-September-23-2026.tex"
src = tex.read_text(encoding="utf-8", errors="replace")
chunk = emit.THEBIB_RX.search(src).group(1)
chunk = chunk[:chunk.rindex("\\end{thebibliography}")]
items = []
for bm in emit.BIBITEM_RX.finditer(chunk):
    start = bm.end()
    nxt = chunk.find("\\bibitem", start)
    items.append(chunk[start:nxt if nxt > 0 else len(chunk)])

for i in (1, 8):
    text = items[i]
    doc = "%s%06d\n\n%s\n\n%sEND" % (mathconv.MARK, i, text, mathconv.MARK)
    out, err = mathconv.run_pandoc(mathconv.BATCH_PREAMBLE + doc + mathconv.BATCH_EPILOG)
    print("=" * 72)
    print("ITEM", i, repr(text[:120]))
    print("ERR:", err[:400])
    print("OUT:", repr(out[:400]))
    print("SENTINELS:", mathconv.SENTINEL_RX.findall(out))
