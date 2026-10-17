r"""Every maths span inside a picture that `_math_body` empties, with its commands.

A label whose commands have no Typst spelling becomes an empty string, and the node holding it
is then drawn as nothing. Write the distinct commands and their counts to a JSON so the symbol
table can be built from what the papers actually use, and so the list does not have to be
recomputed for each candidate spelling.
"""
import collections
import json
import pathlib
import re
import sys

sys.path.insert(0, str(pathlib.Path("tools").resolve()))
from t2t import cetz  # noqa: E402

MATHSPAN = re.compile(r"\$([^$]*)\$")
CMD = re.compile(r"\\[a-zA-Z]+")
PIC = re.compile(r"\\begin\{(?:tikzpicture|tikzcd|CD)\}.*?"
                 r"\\end\{(?:tikzpicture|tikzcd|CD)\}", re.S)

counts = collections.Counter()
spans = collections.Counter()
emptied = 0
for path in sorted(pathlib.Path("_work", "flat").glob("*.tex")):
    src = path.read_text(encoding="utf-8", errors="replace")
    for pic in PIC.findall(src):
        for span in MATHSPAN.findall(pic):
            if not CMD.search(span):
                continue
            if cetz._math_body(span):
                continue
            emptied += 1
            spans[span] += 1
            for cmd in CMD.findall(span):
                counts[cmd] += 1

out = {"emptied spans": emptied, "distinct commands": len(counts),
       "commands": dict(counts.most_common()), "spans": dict(spans.most_common(80))}
pathlib.Path("_work", "math_drops.json").write_text(json.dumps(out, indent=1), encoding="utf-8")
print({"emptied spans": emptied, "distinct commands": len(counts)})
print(json.dumps(dict(list(counts.most_common())[:70]), ensure_ascii=False))
