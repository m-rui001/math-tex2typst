"""Why #97's two gauges disagree: probe97_pictures counts 74 `\frac` occurrences, probe97_emit 42 spans.

`_work/probe97_emit.py` walks `$...$` spans (one span can carry several occurrences, and a span it
cannot match holds none), `probe97_pictures.py` counts regex hits anywhere in the picture block.
Reconcile occurrence by occurrence so the round ships one number, not two.
"""
import glob
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from probe97_pictures import FRAC  # the same occurrence reader #97's face gauge uses

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
SPAN = re.compile(r"\$([^$\n]+)\$")
PAREN = re.compile(r"\\\(.*?\\\)", re.S)
DOLLAR = re.compile(r"\$.*?\$", re.S)


def main():
    hits = in_span = multi = 0
    missed = []
    spans = occ = 0
    tally = {}
    for f in sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex"))):
        paper = os.path.basename(f)[:-4]
        text = open(f, encoding="utf-8", errors="replace").read()
        for pic in PIC.finditer(text):
            block = pic.group(0)
            covered = set()
            for s in SPAN.finditer(block):
                spans += 1
                n = len(FRAC.findall(s.group(1)))
                if n:
                    occ += 1
                    covered.update(range(s.start(), s.end()))
                    if n > 1:
                        multi += 1
                in_span += n
            # what delimiters DO hold the occurrences this walker cannot see?
            paren = [(m.start(), m.end()) for m in PAREN.finditer(block)]
            dollar = [(m.start(), m.end()) for m in DOLLAR.finditer(block)]
            for m in FRAC.finditer(block):
                hits += 1
                if any(i in covered for i in range(m.start(), m.end())):
                    continue
                mid = (m.start() + m.end()) // 2
                if any(a <= mid < b for a, b in paren):
                    kind = "in \\( \\)"
                elif any(a <= mid < b for a, b in dollar):
                    kind = "in a multi-line $ $"
                else:
                    kind = "no math delimiter at all"
                tally[kind] = tally.get(kind, 0) + 1
                missed.append((paper, kind, block[max(0, m.start() - 40):m.end() + 25]))
    print("picture blocks: FRAC occurrences=%d   inside matched spans=%d   "
          "occurrences with no matched span=%d" % (hits, in_span, len(missed)))
    print("spans matched=%d   of which carry >=1 occurrence=%d   carry >=2=%d" % (spans, occ, multi))
    print("the ones this walker does not see, by delimiter: %s" % tally)
    print("\noccurrences outside a matched `$...$` span, first 12:")
    for p, kind, c in missed[:12]:
        print("   %-44s  %-24s  %s" % (p[:44], kind, c.replace("\n", "\\n")))
    return 0


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
