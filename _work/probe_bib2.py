"""Why does a baked bibliography fall back to escaped raw LaTeX?

Run: python _work/probe_bib2.py
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import emit, mathconv  # noqa: E402

FLAT = ROOT / "_work" / "flat"
tex = next(FLAT.glob("Commuting-Division-Coe*")).read_text(encoding="utf-8", errors="replace")
m = emit.THEBIB_RX.search(tex)
body = m.group(1)
body = body[:body.rindex("\\end{thebibliography}")] if "\\end{thebibliography}" in body else body
items = []
for bm in emit.BIBITEM_RX.finditer(body):
    start = bm.end()
    nxt = body.find("\\bibitem", start)
    items.append((bm.group(1), body[start:nxt if nxt > 0 else len(body)]))
print("items:", len(items))

got = mathconv.convert_prose_batch([x[1] for x in items])
print("converted indices:", len(got), "of", len(items))
missing = [i for i in range(len(items)) if i not in got]
print("missing:", missing[:12])
for i in list(got)[:2]:
    print("--- item", i, repr(items[i][1][:70]), "->", repr(got[i][:120]))

# the same batch, but watching pandoc's own report
chunks = ["%s%06d\n\n%s\n" % (mathconv.MARK, i, text) for i, text in enumerate(items)]
chunks.append("%sEND" % mathconv.MARK)
out, err = mathconv.run_pandoc(mathconv.BATCH_PREAMBLE + "\n".join(chunks) + mathconv.BATCH_EPILOG)
print("pandoc stderr:", err[:300])
print("sentinels found:", len(mathconv.SENTINEL_RX.findall(out)))
print("output length:", len(out))
