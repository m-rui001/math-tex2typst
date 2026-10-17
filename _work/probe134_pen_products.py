r"""#91's product side: which weights actually reached `typst/*/main.typ`, and does the list match the source?

The source side is counted out of the option tables (`_work/probe129_pen_width_spellings.py`); this is
the other half of the same reconciliation #90 did for `cap:` and `join:` -- read the emitted
`thickness:` numbers straight out of the products, by value and by paper, and put them beside the
weights the flat sources ask for.  A value the products carry that no source asked for, or a value a
source asked for that no product carries, is the round's residue.

Only `typst/` is counted: `preprints/*/typst/` holds stale copies.
"""
import io
import os
import re
import sys
from collections import Counter

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
FLAT = os.path.join(ROOT, "_work", "flat")
TYPST = os.path.join(ROOT, "typst")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
TH = re.compile(r"thickness: ([0-9.]+)pt")

from t2t import cetz

# what the sources ask for, per paper: the heaviest pen any statement or bracket prices
asked = {}
for fn in sorted(os.listdir(FLAT)):
    if not fn.endswith(".tex"):
        continue
    text = io.open(os.path.join(FLAT, fn), encoding="utf-8", errors="replace").read()
    best = asked.get(fn[:-4], 0.0)
    for pic in PIC.findall(text):
        m = re.match(r"\\begin\{tikzpicture\}", pic)
        if not m:
            continue
        body = pic[m.end():].lstrip()
        head, pos = cetz._opts_at(body, 0)
        if head is None:
            continue
        tables = [head] + list(cetz.picture_styles(head).values())
        for stmt in cetz.split_statements(body[pos:]):
            sm = re.match(r"\\(draw|filldraw|fill|path|node|coordinate)\b\s*", stmt)
            if not sm:
                continue
            o, _p = cetz._opts_at(stmt, sm.end())
            if o is None:
                continue
            tables.append(o)
            tables.append(cetz.resolve_opts(dict(o), cetz.picture_styles(head),
                                            sm.group(1) == "node"))
        for t in tables:
            w = cetz.pen_width_pt(t)
            if w is not None:
                best = max(best, w)
    if best:
        asked[fn[:-4]] = best

carried = Counter()
papers = {}
for stem in sorted(os.listdir(TYPST)):
    main = os.path.join(TYPST, stem, "main.typ")
    if not os.path.isfile(main):
        continue
    text = io.open(main, encoding="utf-8", errors="replace").read()
    vals = [float(v) for v in TH.findall(text)]
    heavy = [v for v in vals if v > 0.4001]
    if heavy:
        carried["papers with a rule heavier than 0.4pt"] += 1
        papers[stem] = round(max(heavy), 3)
    for v in vals:
        carried["%.3fpt" % v] += 1

print("products: %d papers carry a rule above pgf's default (sources ask for one in %d papers)"
      % (carried.pop("papers with a rule heavier than 0.4pt"),
         sum(1 for w in asked.values() if w > 0.4001)))
print("emitted thickness values: %s"
      % dict((k, v) for k, v in carried.most_common() if k != "0.400pt"))
missing = [(s, papers.get(s, 0.0), round(w, 3)) for s, w in asked.items()
           if w > 0.4001 and papers.get(s, 0.0) < w * 0.9]
print("papers that ask for a heavier pen than any rule they carry: %d" % len(missing))
for m in sorted(missing, key=lambda x: -(x[2] - x[1]))[:12]:
    stem, got, want = m
    # a paper that carries NO weight at all is the refused-canvas case: the pen has no rule to
    # ride on, which is the round's negative result, not a leak.  Say which it is.
    text = io.open(os.path.join(FLAT, stem + ".tex"), encoding="utf-8", errors="replace").read()
    pics = PIC.findall(text)
    built = sum(1 for p in pics if cetz.build(p) is not None)
    page = io.open(os.path.join(TYPST, stem, "main.typ"),
                   encoding="utf-8", errors="replace").read().count("#cetz.canvas(") \
        if os.path.isfile(os.path.join(TYPST, stem, "main.typ")) else 0
    print("   %-60s carried=%-7s asked=%-7s src-pics=%d emitted=%d canvases-on-page=%d"
          % (stem, got, want, len(pics), built, page))
