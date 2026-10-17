"""Bucket _work/refusal_stages.txt into families so the biggest lever is visible."""
import collections
import pathlib
import re

text = pathlib.Path("_work/refusal_stages.txt").read_text(encoding="utf-8")
rows = []
for m in re.finditer(r"^### (\S.*?) \((\d+)\)", text, re.M):
    rows.append((m.group(1), int(m.group(2))))

total = sum(c for _, c in rows)
print("refused %d over %d distinct keys" % (total, len(rows)))

buckets = collections.Counter()
who = collections.defaultdict(list)
for key, count in rows:
    if key.startswith("statement:"):
        stmt = key[len("statement:"):]
        if stmt.lstrip("\\ ").startswith(("ifnum", "ifdim", "ifcase")):
            fam = "statement: TeX conditional (\\ifnum/\\ifdim)"
        elif " grid" in stmt:
            fam = "statement: \\draw ... grid"
        elif " plot" in stmt or "domain=" in stmt:
            fam = "statement: \\draw ... plot / domain"
        elif "controls" in stmt:
            fam = "statement: bezier .. controls"
        elif stmt.startswith(r"\tikzset") or "colorlet" in stmt:
            fam = "statement: \\tikzset / \\colorlet declarations"
        elif "textwidth" in stmt:
            fam = "statement: textwidth units"
        elif " of " in stmt and re.search(r"(?:below|above|left|right)", stmt):
            fam = "statement: node relative placement (below=.. of x)"
        elif re.search(r"edge|to\[", stmt):
            fam = "statement: edge / to path"
        elif re.match(r"^\\[A-Z]", stmt):
            fam = "statement: undefined capitalised macro"
        else:
            fam = "statement: other"
    else:
        fam = key
    buckets[fam] += count
    who[fam].append(key)

print("\n-- families --")
for k, v in buckets.most_common():
    print("%4d  %s" % (v, k))
print("\n-- statement:other detail --")
for k in who.get("statement: other", []):
    print("     " + k[:90])
