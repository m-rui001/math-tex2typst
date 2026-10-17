"""Which labels dangle in the real pass, and what text stands in for them?

Run: python _work/probe_refs_dangling.py [n-papers]
"""
import collections
import pathlib
import random
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import convert as conv  # noqa: E402
from t2t import emit  # noqa: E402

n = int(sys.argv[1]) if len(sys.argv) > 1 else 12
random.seed(7)
papers = random.sample(sorted((ROOT / "_work" / "flat").glob("*.tex")), n)

kinds = collections.Counter()
examples = {}
state = {"on": False}
real_ref = emit.Book.ref_text
real_doc = emit.Emitter.emit_document


def counted(self, label, literal):
    if state["on"] and label not in self.labels:
        prefix = label.split(":")[0] if ":" in label else "(no-prefix)"
        kinds[prefix] += 1
        examples.setdefault(prefix, (label, " ".join(str(literal).split())[:55]))
    return real_ref(self, label, literal)


def wrapped(self, blocks):
    state["on"] = not self.dry
    try:
        return real_doc(self, blocks)
    finally:
        state["on"] = False


emit.Book.ref_text = counted
emit.Emitter.emit_document = wrapped
for path in papers:
    out = ROOT / "_work" / "trace_ref" / path.stem
    try:
        conv.convert_paper(str(path), str(out), path.stem)
    except Exception as exc:
        print("skip", path.stem[:40], repr(exc)[:80])
print("papers=%d  dangling in the real pass=%d" % (len(papers), sum(kinds.values())))
for k, v in kinds.most_common(14):
    print("  %5d  %-16s %s" % (v, k, examples[k]))
