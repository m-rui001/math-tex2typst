"""How many pictures style a `draw`/`fill`/scope through a name defined in the preamble?

`resolve_opts` is only reached on the two node paths, so a `\draw[myline]` whose
`myline/.style={thick,dashed}` sits in the preamble still draws as a bare default stroke. The
count sizes extending style resolution past nodes; it is static, so it is safe beside a batch.
"""
import io
import re
import sys
from pathlib import Path

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8")
sys.path.insert(0, "tools")
from t2t import cetz, prep  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
STMT = re.compile(r"\\(draw|fill|filldraw|shade|path|scope|begin\{scope\})\s*(\[[^\]]*\])?")
BARE = re.compile(r"[A-Za-z][-\w]*")

hits = {}
for f in sorted(Path("_work/flat").glob("*.tex")):
    src = f.read_text(encoding="utf-8", errors="replace")
    pics = PIC.findall(src)
    if not pics:
        continue
    pre, _ = prep.split_document(src)
    p = prep.parse_preamble(pre)
    names = set(p.tikz_styles)
    if not names:
        continue
    for pic in pics:
        for verb, opts in STMT.findall(pic):
            if not opts:
                continue
            keys = [k.strip() for k in opts[1:-1].split(",")]
            used = [k for k in keys if "=" not in k and BARE.fullmatch(k) and k in names]
            if used:
                hits.setdefault(f.stem, set()).update("%s:%s" % (verb, u) for u in used)

total = sum(len(v) for v in hits.values())
print("preamble style names used on a non-node statement: %d keys over %d papers"
      % (total, len(hits)))
for name in sorted(hits, key=lambda k: -len(hits[k]))[:10]:
    print("   %-58s %s" % (name[:58], ", ".join(sorted(hits[name]))[:70]))
