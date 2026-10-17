r"""Reconcile the two counts #39 left on the table: 94 papers lacking a `width:`, 62 papers changed.

`_work/textwidth_needed.txt` was written by a product-side census -- papers whose `main.typ` carries a
`#box(` line with no `width:`. The stub diff moved 62 of them. The difference is only explained if the
papers left out hold boxes that were never given a measure to honour (`minimum height` alone, or a
measure `_length` refuses), so this asks each of the 94 the question the fix actually asks: does any
node option in this paper carry a width key `_length` can read?
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

KEY = re.compile(r"(text width|minimum width|minimum size)\s*=\s*([^,;\]\[]+)")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)

needed = [l.strip() for l in (ROOT / "_work" / "textwidth_needed.txt").read_text(
    encoding="utf-8").splitlines() if l.strip()]
changed = {l.strip() for l in (ROOT / "_work" / "regen_needed.txt").read_text(
    encoding="utf-8").splitlines() if l.strip()}
print("census %d papers, diff %d papers" % (len(needed), len(changed)))

readable = unreadable = nokey = 0
miss = []
for stem in needed:
    path = ROOT / "_work" / "flat" / (stem + ".tex")
    if not path.exists():
        print("no flat source: %s" % stem[:50])
        continue
    text = path.read_text(encoding="utf-8", errors="replace")
    got = [cetz._length(val.strip().rstrip("}").strip(), cetz.IDENT)
           for pic in PIC.findall(text) for _k, val in KEY.findall(pic)]
    if not got:
        nokey += 1
        why = "no width key at all"
    elif any(g is not None for g in got):
        readable += 1
        why = "readable"
    else:
        unreadable += 1
        why = "all refused"
    if (stem in changed) != (why == "readable"):
        miss.append((stem[:50], why))
print("census papers: readable %d, all-refused %d, no width key %d"
      % (readable, unreadable, nokey))
print("papers where the two lists disagree: %d" % len(miss))
for stem, why in miss[:12]:
    print("   %s  %s" % (why, stem))
