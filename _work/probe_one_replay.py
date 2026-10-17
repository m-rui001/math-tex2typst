"""Replay a few individual residue formulas and print what pandoc returns."""
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


picked = []
for path in sorted((ROOT / "typst").glob("*/*.typ")):
    body = path.read_text(encoding="utf-8", errors="replace")
    for line in body.split("\n"):
        if line.lstrip().startswith("#raw("):
            continue
        for m in TeXSTR.finditer(line):
            s = unescape(m.group(1))
            if HAS.search(s):
                picked.append((path.name, s))
    if len(picked) > 40:
        break

for name, s in picked[:22]:
    got, missing, err = mathconv.convert_formulas([s])
    state = ("OK  " + re.sub(r"\s+", " ", list(got.values())[0])[:70]) if got else \
            "REFUSE" + (" err:" + " ".join(err.split())[:50] if err else "")
    print("%-26s %-72s %s" % (name[:26], re.sub(r"\s+", " ", s)[:72], state))
