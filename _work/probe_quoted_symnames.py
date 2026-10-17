r"""Every bare quoted word inside maths in the generated main.typ files.

A maths symbol texmath cannot spell in Typst survives as its LaTeX name in quotes
(``\simeq``` -> ``"simeq"``), which renders as the word, not the relation.  Quoted
arguments of a construct (``upright("adj")``, ``text("...")``, ``op("...")``) are the
author's own letters and stay out of the count.
"""
import glob
import os
import re
import sys
from collections import Counter

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MATH = re.compile(r"\$[^$]*\$", re.S)
BARE = re.compile(r'"([A-Za-z][A-Za-z0-9]{1,20})"')
TYPST_WORDS = set("""
amp and angstrom arrow at bin bot brace bracket cap cdots center colon comma
dot dots dotp em en grad group hyph langle mat lbrack rbrack mid minus nbsp
op orth par prime rng root stackrel sub sup tbin tclose top topen text
underline wide bar abs norm
""".split())


def main():
    hits = Counter()
    papers = Counter()
    examples = {}
    for path in sorted(glob.glob(os.path.join(ROOT, "typst", "*", "main.typ"))):
        text = open(path, encoding="utf-8", errors="replace").read()
        for region in MATH.finditer(text):
            span = region.group(0)
            for m in BARE.finditer(span):
                w = m.group(1)
                if w in TYPST_WORDS:
                    continue
                before = span[max(0, m.start() - 2):m.start()]
                if before.endswith("("):
                    continue
                hits[w] += 1
                papers[w] += 1
                examples.setdefault(w, (os.path.basename(os.path.dirname(path))[:44], m))
    print("distinct quoted words in maths: %d, occurrences: %d"
          % (len(hits), sum(hits.values())))
    for w, n in hits.most_common(45):
        print("%-18s %4d  ex: %s" % (w, n, examples[w][0]))


if __name__ == "__main__":
    main()
