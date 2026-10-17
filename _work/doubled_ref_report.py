"""Count a reference word written twice: 'Section Section 3', 'Theorem Theorem 1.1'.

The counter's own name comes from two places -- the author's prose in front of a `\\ref` and the
resolver's answer -- and when both fire the page reads the word twice. Run after a batch.
"""
import glob
import os
import re
import sys

DUP = re.compile(r"\b(Sections?|Theorems?|Figures?|Equations?|Corollaries?|Lemmas?|Tables?"
                 r"|Remarks?|Definitions?|Propositions?|Examples?|Steps?|Cases?|Notes?)\s+\1\b", re.I)

show = "-v" in sys.argv
hits = files = 0
for path in sorted(glob.glob(os.path.join("typst", "*", "main.typ"))):
    text = open(path, encoding="utf-8", errors="replace").read()
    found = DUP.findall(text)
    if not found:
        continue
    files += 1
    hits += len(found)
    if show and files <= 8:
        m = DUP.search(text)
        print("%-46s %r" % (os.path.basename(os.path.dirname(path))[:46],
                            text[max(0, m.start() - 40):m.end() + 30]))
print("doubled reference words: %d over %d papers" % (hits, files))
