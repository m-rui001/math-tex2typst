"""Which option keys appear on \begin{scope} and on the tikzpicture header?"""
import collections
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}", re.S)
SCOPE = re.compile(r"\\begin\{scope\}")

scope_keys = collections.Counter()
head_keys = collections.Counter()
for tex in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = tex.read_text(encoding="utf-8", errors="replace")
    for rx, counter in ((PIC, head_keys), (SCOPE, scope_keys)):
        for m in rx.finditer(text):
            rest = text[m.end():].lstrip()
            if rest[:1] != "[":
                counter["<none>"] += 1
                continue
            inner, _end = cetz.bracketed(rest, 0)
            if inner is None:
                counter["<unbalanced>"] += 1
                continue
            for key in cetz.opts(inner):
                counter[key.strip()] += 1
print("-- scope options --")
for k, v in scope_keys.most_common(22):
    print("%4d  %s" % (v, k))
print("-- picture header options --")
for k, v in head_keys.most_common(22):
    print("%4d  %s" % (v, k))
