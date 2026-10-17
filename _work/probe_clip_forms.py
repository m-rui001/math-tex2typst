"""What clip constructs does the 12-picture `unsupported:clip` family actually contain?

`drop_clips` deletes a clip statement so the rest of the picture draws; the refusal fires when a
clip is seen but cannot be removed safely. Print the shapes so the two can be told apart.
"""
import re
import collections
import pathlib

ROOT = pathlib.Path(__file__).resolve().parent.parent
STMT = re.compile(r"\\clip\b[^;]*;")
FORMS = collections.Counter()
EXAMPLES = {}
for p in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = p.read_text(encoding="utf-8", errors="replace")
    for m in STMT.finditer(text):
        head = " ".join(m.group(0).split())
        shape = re.sub(r"[-\d.]+", "N", head[:52])
        FORMS[shape] += 1
        EXAMPLES.setdefault(shape, (p.name[:44], head[:120]))

for shape, n in FORMS.most_common(16):
    paper, ex = EXAMPLES[shape]
    print("%3d | %s\n      e.g. %s :: %s" % (n, shape, paper, ex))
print("total \\clip statements:", sum(FORMS.values()), "in",
      len({v[0] for v in EXAMPLES.values()}), "example papers")
