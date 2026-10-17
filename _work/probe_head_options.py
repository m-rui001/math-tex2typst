"""Picture heads whose options _transform cannot read -- and what the unreadable value is.

Before the affine matrix, an unknown key on a head was silently ignored, so a head whose value
_rotate_spec or _basis_pair cannot read is a picture that used to draw without being turned; the
same is worth knowing for the scopes.
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
SCOPE = re.compile(r"\\begin\{scope\}")

heads, scopes = Counter(), Counter()
names = {}
for f in sorted(Path("_work/flat").glob("*.tex")):
    for pic in PIC.findall(f.read_text(encoding="utf-8", errors="replace")):
        m = re.match(r"\\begin\{tikzpicture\}", pic)
        body = pic[m.end():].lstrip()
        head, pos = cetz._opts_at(body, 0)
        if head is None:
            continue
        if cetz.build(pic) is not None:
            continue
        if cetz._transform(head) is None:
            bad = tuple(sorted("%s=%s" % (k.strip(), str(v))[:26] for k, v in head.items()
                               if cetz._transform({k: v}) is None))
            heads[bad] += 1
            names.setdefault(bad, f.stem[:40])
        for sm in SCOPE.finditer(body):
            o, _ = cetz._opts_at(body, sm.end())
            if o and cetz._transform(o) is None:
                bad = tuple(sorted("%s=%s" % (k.strip(), str(v))[:26] for k, v in o.items()
                                   if cetz._transform({k: v}) is None))
                scopes[bad] += 1
                names.setdefault(bad, f.stem[:40])

print("picture heads that refuse:")
for k, n in heads.most_common():
    print("  %d  %-46s %s" % (n, str(k)[:46], names[k]))
print("scopes that refuse:")
for k, n in scopes.most_common(10):
    print("  %d  %-46s %s" % (n, str(k)[:46], names[k]))
