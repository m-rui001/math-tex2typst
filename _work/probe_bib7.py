"""Test each bib item alone: which one makes pandoc give up on the batch?

Run: python _work/probe_bib7.py
"""
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import emit, mathconv  # noqa: E402

name = sys.argv[1] if len(sys.argv) > 1 else (
    "Commuting-Division-Coefficient-Forms-and-the-Artinian-Eisenbud-Green-Harris"
    "-Conjecture-September-23-2026")
src = (ROOT / "_work" / "flat" / (name + ".tex")).read_text(encoding="utf-8", errors="replace")
chunk = emit.THEBIB_RX.search(src).group(1)
chunk = chunk[:chunk.rindex("\\end{thebibliography}")]
items = []
for bm in emit.BIBITEM_RX.finditer(chunk):
    start = bm.end()
    nxt = chunk.find("\\bibitem", start)
    items.append(chunk[start:nxt if nxt > 0 else len(chunk)])
print("items:", len(items))

for i, text in enumerate(items):
    doc = mathconv.BATCH_PREAMBLE + "%s%06d\n\n%s\n" % (mathconv.MARK, i, text) \
        + "\n%sEND" % mathconv.MARK + mathconv.BATCH_EPILOG
    out, err = mathconv.run_pandoc(doc)
    if i not in mathconv.convert_prose_batch([text]) or err:
        print("-" * 70)
        print("item %d failed: %s" % (i, " ".join(text.split())[:130]))
        print("   ERR:", " ".join((err or "").split())[:200])
