r"""What TeX tokens actually sit inside the bib fields we ship?

The face is 446 bibs / 5,272 fields (_work/probe_bib_tex.py) and the page prints
them literally (measured: `_work/t_bibmath` test compile — hayagriva keeps `$`,
`\mathbb`, `^` and `_` as ink). A fix has to carry the tokens that are really
there, so this probe lists them by frequency: the table is then priced by demand
instead of guessed.
"""
import io
import os
import re
import sys
from collections import Counter

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace",
                              newline="")

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TYPST = os.path.join(ROOT, "typst")
FIELD = re.compile(r"^\s*(\w+)\s*=\s*[{\"](.*)$", re.S)
SKIP = ("doi", "url", "eprint", "isbn", "issn", "file")
CS = re.compile(r"\\([A-Za-z]{2,})")
ONE = re.compile(r"\\([A-Za-z])\b")
SCRIPT = re.compile(r"([_^])\s*(?:\{([^{}]*)\}|([A-Za-z0-9+\-*]))")

cs, one, scripts, groups, dollar = Counter(), Counter(), Counter(), 0, 0
for name in sorted(os.listdir(TYPST)):
    bib = os.path.join(TYPST, name, "refs.bib")
    if not os.path.isdir(os.path.join(TYPST, name)) or not os.path.exists(bib):
        continue
    for line in open(bib, encoding="utf-8", errors="replace"):
        m = FIELD.match(line)
        if not m or m.group(1).lower() in SKIP:
            continue
        value = m.group(2)
        if "$" in value:
            dollar += 1
        groups += value.count("{")
        for t in CS.findall(value):
            cs[t] += 1
        for t in ONE.findall(value):
            one[t] += 1
        for d, grp, solo in SCRIPT.findall(value):
            scripts[(d, (grp or solo)[:4])] += 1

print("fields with $: %d   braces inside fields: %d" % (dollar, groups))
print("\n-- control words (top 40) --")
for t, n in cs.most_common(40):
    print("  %-16s %d" % (t, n))
print("\n-- one-letter commands (top 12) --")
for t, n in one.most_common(12):
    print("  \\%s  %d" % (t, n))
print("\n-- scripts (top 30) --")
for (d, body), n in scripts.most_common(30):
    print("  %s%s  %d" % (d, body, n))
print("\ndistinct scripts: %d  distinct control words: %d" % (len(scripts), len(cs)))
