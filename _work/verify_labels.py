"""What every previously-empty maths span now becomes.

The spans are the ones recorded from the corpus, so the output is the real label text a reader
would see. A bare identifier that typst does not know would refuse the whole picture at the
compile gate, so each result is compiled on its own and the failures are named.
"""
import json
import pathlib
import sys

sys.path.insert(0, str(pathlib.Path("tools").resolve()))
from t2t import cetz  # noqa: E402

spans = list(json.load(open("_work/math_drops.json", encoding="utf-8"))["spans"])
bad, still_empty, samples = [], [], []
for span in spans:
    body = cetz._math_body(span)
    if not body.strip('" '):
        still_empty.append(span)
        continue
    canvas = "#cetz.canvas({\n  import cetz.draw: *\n  content((0, 0), [$%s$])\n})" % body
    if not cetz.compiles(canvas):
        bad.append((span, body))
    if len(samples) < 22:
        samples.append((span, body))

print({"spans": len(spans), "still empty": len(still_empty), "do not compile": len(bad)})
for span, body in samples:
    print("  %-24s -> %s" % (span[:24], body[:44]))
for span, body in bad[:12]:
    print("  REFUSES: %-24s -> %s" % (span[:24], body[:44]))
for span in still_empty[:8]:
    print("  EMPTY: %s" % span[:50])
