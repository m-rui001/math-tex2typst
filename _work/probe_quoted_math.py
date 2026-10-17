r"""How often does a formula reach the page as a quoted math string, `$"..."$`?

Typst reads `$"abc"$` as a *string* inside math: every `_`, `^` and command name in it prints as the
letters the author typed, which is the whole of the "figure text prints command names" symptom. The
KL flowchart is the case that made me look -- `$P_{y,b}=P'_{\iota(y),b'}$` reached line 749 of its
main.typ as `$"P_(u,b)=P'_(u',b')"$` while the same formula in the body is real math. This counts the
shape over the corpus, splitting figure lines from body lines by the same canvas state machine
`probe_tip_product` uses, and prints what the quoted strings contain so the trigger is read off the
data rather than guessed.
"""
import pathlib
import re
import sys
from collections import Counter

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "_work"))
from probe_tip_product import OPEN, CLOSE  # noqa: E402  the proven canvas delimiters

ROOT = pathlib.Path(__file__).resolve().parents[1]
QUOTED = re.compile(r'\$"[^"]*"\$')

where_count = Counter()
papers = {"figure": set(), "body": set()}
examples = {"figure": [], "body": []}
chars = Counter()

for path in sorted((ROOT / "typst").glob("*/main.typ")):
    lines = path.read_text(encoding="utf-8", errors="replace").splitlines()
    inside = []
    body = False
    for line in lines:
        inside.append(body)
        if not body and OPEN.search(line):
            body = True
        elif body and CLOSE.match(line):
            body = False
    for n, line in enumerate(lines):
        for m in QUOTED.finditer(line):
            place = "figure" if inside[n] else "body"
            text = m.group(0)[2:-2]
            where_count[place] += 1
            papers[place].add(path.parent.name)
            for ch in ("_", "^", "\\", "'", "{", "}", "~"):
                if ch in text:
                    chars[place + " " + repr(ch)] += 1
            if len(examples[place]) < 12:
                examples[place].append((path.parent.name, n + 1, m.group(0)))

for place in ("figure", "body"):
    print("%-7s %5d quoted strings / %3d papers" % (place, where_count[place], len(papers[place])))
print("== characters surviving inside the quotes")
for key, n in sorted(chars.items(), key=lambda kv: -kv[1]):
    print("  %-18s %5d" % (key, n))
for place in ("figure", "body"):
    for stem, n, s in examples[place][:6]:
        print("  %s> %s:%d %s" % (place, stem[:40], n, s[:120]))
