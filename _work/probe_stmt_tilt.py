import io
import re
import sys
from collections import Counter
from pathlib import Path

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
sys.path.insert(0, "tools")
from t2t import cetz

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
# a command carrying its own option bracket: a transform written here applies to that one
# statement, and 'scoped' is the only other spelling of it we already read
STMT_OPTS = re.compile(r"\\(draw|fill|filldraw|path|node|shade|clip|use|cover)\s*\[([^\]]*)\]")
TILTS = re.compile(r"(?:^|[,{\s])(rotate(?:\s+around)?|xslant|yslant|cm)\s*[=(]")
MOVED = re.compile(r"(?:^|[,{\s])(shift|xs?hift|scale|xs?cale|ys?cale)\s*[=(]")

drawn_tilts, drawn_moved, refused = Counter(), Counter(), 0
papers = set()
for f in sorted(Path("_work/flat").glob("*.tex")):
    for pic in PIC.findall(f.read_text(encoding="utf-8", errors="replace")):
        hits_t = set()
        hits_m = set()
        for m in STMT_OPTS.finditer(pic):
            hits_t.update(TILTS.findall(m.group(2)))
            hits_m.update(MOVED.findall(m.group(2)))
        if not hits_t and not hits_m:
            continue
        if cetz.build(pic) is None:
            refused += 1
            continue
        hits_t = set(hits_t)
        hits_m = set(hits_m) - hits_t
        for k in hits_t:
            drawn_tilts[k] += 1
        for k in hits_m:
            drawn_moved[k] += 1
        if hits_t or hits_m:
            papers.add((f.stem[:44], tuple(sorted(hits_t | hits_m))))

print("pictures that DRAW today with a transform on one statement:")
print("  tilts:", dict(drawn_tilts))
print("  shift/scale:", dict(drawn_moved))
print("  %d pictures over %d papers" % (len(papers), len({p for p, _ in papers})))
for name, keys in sorted(papers)[:14]:
    print("   %-46s %s" % (name, keys))
print("same shape but refused anyway:", refused)
