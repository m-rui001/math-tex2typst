r"""Which \ref targets genuinely have no \label in the same source?

The pipeline counts a dangling reference after it has already eaten macros and
dropped environments, so its number mixes two causes. Comparing keys straight from
the flat LaTeX separates a reference the author never labelled from one whose label
the converter lost.
"""
import collections
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
FLAT = ROOT / "_work" / "flat"

LABEL = re.compile(r"\\label\s*\*?\s*(?:\[[^\]]*\])?\s*\{([^{}]*)\}")
NEWLABEL = re.compile(r"\\(?:new|re)new(?:counter|theorem(?:withnumber)?)?\s*\{([^{}]*)\}")
REF = re.compile(
    r"\\(?:ref|eqref|C?ref|pageref|autoref|nameref|Lref|fullref|Op?ref"
    r"|textcircled?\s*\{\\ref)\s*\*?\s*(?:\[[^\]]*\])*\s*\{([^{}]*)\}"
)

missing = collections.Counter()
built = collections.Counter()
paper_missing = collections.Counter()
examples = collections.defaultdict(list)
for src in sorted(FLAT.glob("*.tex")):
    text = src.read_text(encoding="utf-8", errors="replace")
    have = set()
    for rx in (LABEL, NEWLABEL):
        have.update(m.group(1) for m in rx.finditer(text))
    for m in REF.finditer(text):
        key = m.group(1)
        if not key or key in have:
            continue
        line = text[:m.start()].count("\n") + 1
        if "\\" in key:
            # the name is assembled by a macro, so no literal label can match it
            built[key] += 1
            continue
        missing[key] += 1
        paper_missing[src.stem[:46]] += 1
        if len(examples[key]) < 2:
            examples[key].append("%s:%d" % (src.stem[:40], line))

tot = sum(missing.values())
print("refs with no matching label: %d occurrences, %d distinct keys, %d papers"
      % (tot, len(missing), len(paper_missing)))
print("keys built by a macro: %d occurrences, %d distinct" % (sum(built.values()), len(built)))
print("\ntop papers:")
for p, n in paper_missing.most_common(12):
    print("%5d  %s" % (n, p))
print("\ntop missing keys:")
for k, n in missing.most_common(int(sys.argv[1]) if len(sys.argv) > 1 else 20):
    print("%5d  %-28s %s" % (n, k[:28], " | ".join(examples[k])))
print("\nmacro-built:")
for k, n in built.most_common(8):
    print("%5d  %s" % (n, k[:70]))
