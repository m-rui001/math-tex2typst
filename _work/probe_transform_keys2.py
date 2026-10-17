"""Which head option makes `_transform` give up on the pictures it refuses?

Mirror `probe_refusal_stages.classify` up to the transform stage, then feed the parsed head
options to _transform one at a time and print the first key that returns None, with its value.
Static: no typst, so it is safe while a batch is in flight.
"""
import collections
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PICTURE = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
keys = collections.Counter()
shown = collections.defaultdict(int)

for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    paper = path.name[:-4]
    src = path.read_text(encoding="utf-8", errors="replace")
    for m in PICTURE.finditer(src):
        core = cetz.MATH_ENVELOPE.sub("", m.group(0))
        if not core.startswith("\\begin{tikzpicture}"):
            continue
        body = core[len("\\begin{tikzpicture}"):].lstrip()
        head, _ = cetz._opts_at(body, 0)
        if head is None or cetz._transform(head) is not None:
            continue
        blamed = [k for k, v in head.items() if isinstance(v, str)
                  and cetz._transform({k: v}) is None]
        for k in blamed:
            keys[k.strip()] += 1
            if shown[k.strip()] < 4:
                shown[k.strip()] += 1
                print("%-46s %-22s = %s" % (paper[:46], k.strip(),
                                            str(head[k])[:70]))

print("---- blamed keys ----")
for k, n in keys.most_common():
    print("%4d  %s" % (n, k))
