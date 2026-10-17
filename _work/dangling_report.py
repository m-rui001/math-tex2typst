r"""Dangling references as the corpus reports them, per paper and per glyph.

Each paper keeps one sample key per kind, so ranking papers is the most the reports
support; counting the literal '[??]' the emitter writes shows what a reader meets.
"""
import collections
import io
import json
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
TYPS = sorted((ROOT / "typst").glob("*/main.typ"))

counts = collections.Counter()
papers = collections.Counter()
samples = collections.defaultdict(list)
missing_key = collections.Counter()
for rep in sorted((ROOT / "typst").glob("*/report.json")):
    d = json.loads(rep.read_text(encoding="utf-8"))
    st = d.get("stats") or {}
    sm = d.get("samples") or {}
    name = rep.parent.name[:44]
    for kind in ("dangling_ref", "missing_bibkey"):
        n = st.get(kind, 0)
        if n:
            counts[kind] += n
            papers[kind] += 1
            samples[kind].append((n, name, str(sm.get(kind, ""))[:52]))
    for k in d.get("macros_skipped") or []:
        missing_key[str(k)[:40]] += 1

print("papers scanned: %d ; compiled: %d" % (len(TYPS), sum(1 for t in TYPS if t.exists())))
for kind, total in counts.items():
    print("%s: %d occurrences over %d papers" % (kind, total, papers[kind]))
    for n, name, s in sorted(samples[kind], reverse=True)[:14]:
        print("   %5d  %-44s  %s" % (n, name, s))

q = collections.Counter()
for t in TYPS:
    text = t.read_text(encoding="utf-8", errors="replace")
    n = text.count("[??]") + len(re.findall(r"\?\?", text))
    if n:
        q[t.parent.name[:44]] = n
print("\n'[??]' / '??' in the generated Typst: %d files, %d marks"
      % (len(q), sum(q.values())))
for name, n in q.most_common(10):
    print("   %5d  %s" % (n, name))
if missing_key:
    print("\nmacros skipped: %s" % dict(missing_key.most_common(6)))
