r"""#91's last face question: which scope-name definitions carry a pen, and is the sibling spelling real?

`_work/probe137_every_path_style_face.py` counted style DEFINITIONS that price a pen above pgf's
default by scope name (12 `every path` / 8 papers, 2 `every edge` / 2 papers, 0 `every node`).  The
oracle (`_work/measure91_every_path.py`) says what pgf does with them: an `every path` width lands on
EVERY drawn path -- plain `--`, `to`, an arrow, a multi-segment rule, a node's rect and a circle --
at 1.993pt, and it OUTRANKS the head's own `line width=1pt` (1.993 wins) while the statement's own
key and a style the statement invokes both beat it (0.398 / 0.797).  `every edge` did not touch a
plain `--` at all.

Three things still need counting before this is a fix rather than a hunch:
  A. everything an `every path` definition carries -- a pen only, or also `line cap`/`line join`?
     #90 seeded the picture default from the head's OWN cap/join keys, so the same hole applies here.
  B. whether the two `every edge` definitions have a page to act on: pgf applies them to `edge`
     operators, so if those pictures never write `edge`, the spelling has zero face and gets nothing.
  C. the whole population of scope-name definitions, so 12 is not read out of an empty room.
"""
import io
import os
import re
import sys
from collections import Counter

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)

from t2t import cetz

EVERY = ("every path", "every node", "every picture", "every to", "every mark",
         "every edge", "every loop")

keys = Counter()
defs = Counter()
papers = dict((n, set()) for n in EVERY)
edge_cases = []
for fn in sorted(os.listdir(FLAT)):
    if not fn.endswith(".tex"):
        continue
    paper = fn[:-4]
    text = io.open(os.path.join(FLAT, fn), encoding="utf-8", errors="replace").read()
    for pic in PIC.findall(text):
        m = re.match(r"\\begin\{tikzpicture\}", pic)
        head, pos = cetz._opts_at(pic[m.end():].lstrip(), 0)
        if head is None:
            continue
        styles = cetz.picture_styles(head)
        for name, opts in styles.items():
            base = name.split("/")[0].strip()
            if base not in EVERY or not isinstance(opts, dict):
                continue
            papers[base].add(paper)
            defs[base] += 1
            for k in sorted(opts):
                keys["%s: %s" % (base, k)] += 1
            if base == "every path":
                print("   every path definition in %-58s carries %s"
                      % (paper[:58], dict((k, opts[k]) for k in sorted(opts))))
        # B: does this picture write an `edge` operator at all?
        if "every edge" in styles:
            body = pic[m.end():]
            n_edge = len(re.findall(r"\bedge\b", body))
            edge_cases.append((paper, n_edge, dict(styles["every edge"])))

print("\n== options carried by scope-name definitions")
for k, n in keys.most_common():
    print("   %-32s %d" % (k, n))
print("\n== papers touched, by scope name")
for n in EVERY:
    if papers[n]:
        print("   %-14s papers=%d %s" % (n, len(papers[n]), sorted(papers[n])[:2]))
print("\n== the `every edge` pictures and how many `edge` operators they write")
for paper, n_edge, opts in edge_cases:
    print("   %-58s edge=%d  %s" % (paper[:58], n_edge, opts))

# the walk above only sees the PICTURE's own brackets; a `every path` written inside a `\begin{scope}`
# is the same pgf law one level down, so compare the text count with what the parser found.
raw = Counter()
for fn in sorted(os.listdir(FLAT)):
    if not fn.endswith(".tex"):
        continue
    text = io.open(os.path.join(FLAT, fn), encoding="utf-8", errors="replace").read()
    for pic in PIC.findall(text):
        for name in EVERY:
            n = len(re.findall(re.escape(name) + r"/\.style", pic))
            if n:
                raw["%s/.style in a picture (any level)" % name] += n
print("\n== `NAME/.style` written anywhere in the same 932 pictures, against the head-walk's counts")
print("   text: %s" % ", ".join("%s=%d" % kv for kv in raw.most_common()))
print("   head-walk definitions: %s" % ", ".join("%s=%d" % kv for kv in defs.most_common()))
