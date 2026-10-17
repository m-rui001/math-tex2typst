"""Every reference the emitter could not resolve, for the papers that dangle most.

The static check says only ~380 labels are truly absent from the sources, so the
thousands of dangling refs must be labels the emitter never registered. This prints
the missing key next to the label set the file does contain, which tells us whether
the name was rewritten, dropped with its environment, or pointed at a counter we do
not model.

Run: python _work/probe_dangle_labels.py
"""
import collections
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import emit  # noqa: E402
from t2t.convert import convert_paper  # noqa: E402

PAPERS = [
    "Conditional-information-under-deterministic-coordinate-sweeps-September-26-2026",
    "A-Negative-Solution-to-the-Finite-Lattice-Representation-Problem-September-24-2026",
    "Finite-Congruence-Lattices-Characterization-and-Undecidability-September-24-2026",
]
LABEL = re.compile(r"\\label[ \t]*\{([^{}]*)\}")

real_ref = emit.Book.ref_text
missing = collections.Counter()
in_source = collections.Counter()
state = {"paper": None, "on": False}
cache = {}


def counted(self, label, literal):
    if state["on"] and label and label not in self.labels:
        missing[label] += 1
        if state["paper"] not in cache:
            text = (ROOT / "_work" / "flat" / (state["paper"] + ".tex")).read_text(
                encoding="utf-8", errors="replace")
            cache[state["paper"]] = set(LABEL.findall(text))
        in_source["in-source" if label in cache[state["paper"]] else "absent"] += 1
    return real_ref(self, label, literal)


emit.Book.ref_text = counted

# Book has no dry flag of its own: the emitter owns the pass, so the real one is
# recognised where the switch is made.
real_emit = emit.Emitter.emit_document


def watched(self, blocks):
    state["on"] = not self.dry
    return real_emit(self, blocks)


emit.Emitter.emit_document = watched

for name in PAPERS:
    state["paper"] = name
    out = ROOT / "_work" / "dangle_check" / name
    out.mkdir(parents=True, exist_ok=True)
    report = convert_paper(str(ROOT / "_work" / "flat" / (name + ".tex")), str(out), name)
    print("%s -> dangling=%s registered=%s" % (
        name[:40], (report.get("stats") or {}).get("dangling_ref"),
        (report.get("labels"))))

print("\nlabel present in the source but never registered: %d of %d notes"
      % (in_source["in-source"], sum(in_source.values())))
print("distinct missing keys=%d" % len(missing))
for key, count in missing.most_common(30):
    print("  %-38s %d" % (key[:38], count))
