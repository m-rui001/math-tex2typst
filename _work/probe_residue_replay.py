"""Do the LaTeX strings that render as residue still fail pandoc, and why?"""
import collections
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import mathconv  # noqa: E402

TeXSTR = re.compile(r'"((?:[^"\\]|\\.)*)"')
HAS = re.compile(r"\\[A-Za-z@]+")

def unescape(s):
    out, i = [], 0
    while i < len(s):
        if s[i] == "\\" and i + 1 < len(s):
            out.append({"n": "\n", "t": "\t"}.get(s[i + 1], s[i + 1]))
            i += 2
        else:
            out.append(s[i])
            i += 1
    return "".join(out)


seen = {}
for path in sorted((ROOT / "typst").glob("*/*.typ")):
    body = path.read_text(encoding="utf-8", errors="replace")
    for line in body.split("\n"):
        if line.lstrip().startswith("#raw("):
            continue
        for m in TeXSTR.finditer(line):
            s = m.group(1)
            if HAS.search(s):
                seen.setdefault(unescape(s), path.name)

items = sorted(seen)
print("distinct residue formulas: %d" % len(items))

converted, refused = [], []
CHUNK = 40
for start in range(0, len(items), CHUNK):
    part = items[start:start + CHUNK]
    got, missing, _err = mathconv.convert_formulas(part)
    converted += list(got.values())
    refused += [part[i] for i in missing]
    if start == 0:
        print("sample converted:", repr(list(got.values())[0])[:90] if got else "none")

print("still refused: %d ; converted on replay: %d" % (len(refused), len(converted)))


def shape(s):
    e = re.search(r"\\begin\{([^}]*)\}", s)
    if e:
        return "env:" + e.group(1)
    first = (re.findall(r"\\[A-Za-z@]+", s) or ["(none)"])
    multi = [f for f in first if f not in ("\\n",)]
    return multi[0] if multi else "(none)"


kinds = collections.Counter(shape(s) for s in refused)
for k, v in kinds.most_common(22):
    ex = next(s for s in refused if shape(s) == k)
    print("  %4d  %-22s %s" % (v, k, re.sub(r"\s+", " ", ex)[:78]))
