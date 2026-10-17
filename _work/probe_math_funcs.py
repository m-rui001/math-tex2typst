"""Which function names make expr() give up, measured in the real conversion flow.

Read-only over _work/flat: wraps cetz.expr to record every expression it cannot evaluate while
each picture is converted, then reports the call names those expressions ask for that FUNCS lacks.
"""
import collections
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PICTURE = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)
FUNC_CALL = re.compile(r"([A-Za-z][A-Za-z0-9]*)\s*\(")

real_expr = cetz.expr
failed = []
names = collections.Counter()
sample = {}


def spy(text):
    out = real_expr(text)
    if out is None and text:
        failed.append(text)
        for call in FUNC_CALL.finditer(text):
            name = call.group(1)
            if name not in cetz.FUNCS:
                names[name] += 1
                sample.setdefault(name, text[:90])
    return out


cetz.expr = spy

for tex in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = tex.read_text(encoding="utf-8", errors="replace")
    for m in PICTURE.finditer(text):
        cetz.convert(m.group(0))

print("expressions expr() could not evaluate: %d" % len(failed))
print("\n-- names not in FUNCS --")
for name, count in names.most_common(25):
    print("%5d  %-10s  e.g. %s" % (count, name, sample[name]))
print("\n-- 15 distinct failing expressions --")
seen = []
for text in failed:
    key = re.sub(r"-?\d*\.?\d+", "N", text)
    if key not in seen:
        seen.append(key)
        print("  %s" % text[:100])
    if len(seen) == 15:
        break
