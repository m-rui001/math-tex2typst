"""Blast radius of the arrow-tip fix: which papers' canvases actually gain a head.

The mnemonic spellings (`->`, `<->`, `<-`) emit byte-for-byte what they emitted before, so they are
not in scope. What changed is the named-tip form, which now emits a per-side dictionary
`(symbol: ...)`, and the bar tips `|-|`/`|<->|`, which never reached `mark:` at all. Every canvas
that carries one of those two shapes is a canvas whose generated `main.typ` goes stale, so this lists
them as the papers to regenerate and writes the list where `_work/regen_list.py` reads it.
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(errors="replace")
from t2t import cetz  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
NEW = re.compile(r'symbol: |"\|"')

total = canvases = 0
hits = []
for src in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
    text = open(src, encoding="utf-8", errors="replace").read()
    n = 0
    for p in PIC.findall(text):
        canvases += 1
        got = cetz.build(p)
        if got is None:
            continue
        if NEW.search(got):
            n += 1
    if n:
        hits.append((n, os.path.basename(src)[:-4]))
        total += n
print("canvases read %d; canvases that gain a head: %d; papers: %d"
      % (canvases, total, len(hits)))
for n, name in sorted(hits, reverse=True)[:12]:
    print("  %3d  %s" % (n, name[:64]))
out = os.path.join(ROOT, "_work", "regen_needed.txt")
open(out, "w", encoding="utf-8").write("\n".join(name for _, name in hits))
print("wrote _work/regen_needed.txt (%d names)" % len(hits))
