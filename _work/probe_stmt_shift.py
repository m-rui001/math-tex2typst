"""A shift written on a statement: is it a node's placement (TikZ moves the node) or a path's?

Measured through build only, so it can run beside a batch.
"""
import io
import re
import sys
from collections import Counter
from pathlib import Path

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
sys.path.insert(0, "tools")
from t2t import cetz

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
STMT = re.compile(r"\\(draw|fill|filldraw|path|node|shade|clip)\s*\[([^\]]*)\]")
MOVED = re.compile(r"(?:^|[,{\s])(xshift|yshift|shift)\s*=\s*([^,\]]{0,18})")

kinds, samples = Counter(), []
for f in sorted(Path("_work/flat").glob("*.tex")):
    for pic in PIC.findall(f.read_text(encoding="utf-8", errors="replace")):
        hits = [(v, k, val) for m in STMT.finditer(pic)
                for (v, o) in [m.groups()] for k, val in MOVED.findall(o)]
        if not hits:
            continue
        built = cetz.build(pic) is not None
        for v, k, val in hits:
            kinds[(v, k, built)] += 1
            if built and len(samples) < 12:
                samples.append("%-40s \\%s[%s=%s]" % (f.stem[:40], v, k, val.strip()))

print("statement-level shift on a picture that builds / refuses (right column)")
for (verb, key, built), n in sorted(kinds.items(), key=lambda kv: (-kv[1], str(kv[0]))):
    print("  %2d  %-10s %-8s builds=%s" % (n, "\\" + verb, key, built))
print("\n".join("  " + s for s in samples))
