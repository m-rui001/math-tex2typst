"""Which bib item breaks the prose batch for the whole bibliography?

Run: python _work/probe_bib3.py
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import emit, mathconv  # noqa: E402

for path in sorted((ROOT / "typst").glob("*/main.typ")):
    body = path.read_text(encoding="utf-8", errors="replace")
    if "\\\\emph\\{" not in body and "\\\\href\\{" not in body:
        continue
    print("=" * 72)
    print(path.parent.name[:70])
    tex = ROOT / "_work" / "flat" / (path.parent.name + ".tex")
    if not tex.exists():
        print("  no flat source")
        continue
    src = tex.read_text(encoding="utf-8", errors="replace")
    m = emit.THEBIB_RX.search(src)
    if not m:
        print("  no thebibliography in the source")
        continue
    chunk = m.group(1)
    chunk = chunk[:chunk.rindex("\\end{thebibliography}")]
    items = []
    for bm in emit.BIBITEM_RX.finditer(chunk):
        start = bm.end()
        nxt = chunk.find("\\bibitem", start)
        items.append(chunk[start:nxt if nxt > 0 else len(chunk)])
    broken = []
    for i, text in enumerate(items):
        if i not in mathconv.convert_prose_batch([text]):
            broken.append(i)
            print("  BROKEN item %d: %s" % (i, re.sub(r"\s+", " ", text)[:150]))
    print("  items=%d broken=%d" % (len(items), len(broken)))
