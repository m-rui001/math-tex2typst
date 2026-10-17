r"""#91's leftover spelling: a pen priced by an `every path` / `every node` style definition.

The round's reader (`cetz.pen_width_pt`) is fed by three consumers: a statement's own group, a style
it invokes, and the picture head folded into `styles["picture"]`.  `probe134_pen_products.py` asked
one more question than its own table can answer -- it also walked EVERY style DEFINITION in the
picture -- and four papers came back asking for a weight whose page has no rule at all.  Reading the
source shows why: the weight sits in `every path/.style={line width=.6pt}`, which pgf applies to
every path statement on its own, without the statement naming it.

So the question is the size of that face, split by whether the definition prices a pen at all and by
which scope name carries it.  `every node` is the one the emitter ALREADY merges (for nodes only), so
report separately whether a pen priced there reaches a node frame.  Counts are per style definition
and per picture/paper, and a definition that prices nothing above the default is not a loss.
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

DOT = chr(92) + "draw"

# the scope names pgf applies to statements it is never told about
EVERY = ("every path", "every node", "every picture", "every to", "every mark",
         "every edge", "every loop")

site = Counter()
papers = dict((name, set()) for name in EVERY)
heaviest = {}
examples = []

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
        # every style definition the picture declares, by name, with the options it carries
        for name, opts in styles.items():
            if not isinstance(opts, dict):
                continue
            w = cetz.pen_width_pt(opts)
            if w is None or w <= 0.4001:
                continue
            base = name.split("/")[0].strip()
            if base not in EVERY:
                continue
            site[base] += 1
            papers[base].add(paper)
            if heaviest.get(base, 0) < w:
                heaviest[base] = w
                examples.append((base, paper, name, opts.get("line width"), w))

print("style definitions pricing a pen above pgf's default, by scope name:")
for name, n in site.most_common():
    print("   %-14s definitions=%-4d papers=%-4d heaviest=%spt"
          % (name, n, len(papers[name]), heaviest[name]))
if not site:
    print("   (none)")
for e in examples:
    print("   e.g. %-14s %-58s as %r" % (e[0], e[1][:58], e[2]))

# and the whole `/.style` population, so the number above is not read out of an empty room
all_def = Counter()
pen_def = 0
for fn in sorted(os.listdir(FLAT)):
    if not fn.endswith(".tex"):
        continue
    text = io.open(os.path.join(FLAT, fn), encoding="utf-8", errors="replace").read()
    for pic in PIC.findall(text):
        m = re.match(r"\\begin\{tikzpicture\}", pic)
        head, _ = cetz._opts_at(pic[m.end():].lstrip(), 0)
        if head is None:
            continue
        for name, opts in cetz.picture_styles(head).items():
            if not isinstance(opts, dict):
                continue
            all_def[name.split("/")[0].strip()] += 1
            w = cetz.pen_width_pt(opts)
            if w is not None and w > 0.4001:
                pen_def += 1
print("all style definitions by base name (top 12): %s"
      % ", ".join("%s=%d" % kv for kv in all_def.most_common(12)))
print("style definitions of ANY name that price a pen above the default: %d" % pen_def)
