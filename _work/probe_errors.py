"""For each refusal bucket, what exactly does pandoc complain about?"""
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
    for line in path.read_text(encoding="utf-8", errors="replace").split("\n"):
        if line.lstrip().startswith("#raw("):
            continue
        for m in TeXSTR.finditer(line):
            if HAS.search(m.group(1)):
                seen.setdefault(unescape(m.group(1)), path.name)

items = sorted(seen)
got, missing, _ = [], [], None
CHUNK = 40
refused = []
for start in range(0, len(items), CHUNK):
    part = items[start:start + CHUNK]
    g, m, _e = mathconv.convert_formulas(part)
    got += list(g.values())
    refused += [part[i] for i in m]


def shape(s):
    e = re.search(r"\\begin\{([^}]*)\}", s)
    if e:
        return "env:" + e.group(1)
    first = [f for f in re.findall(r"\\[A-Za-z@]+", s) if f != "\\n"]
    return first[0] if first else "(none)"


buckets = collections.defaultdict(list)
for s in refused:
    buckets[shape(s)].append(s)

print("refused=%d buckets=%d\n" % (len(refused), len(buckets)))
for k, vals in sorted(buckets.items(), key=lambda kv: -len(kv[1]))[:14]:
    if k in ("env:tikzcd", "env:CD"):
        continue
    print("### %s  (%d)" % (k, len(vals)))
    for s in vals[:2]:
        _, err = mathconv.run_pandoc(mathconv.BATCH_PREAMBLE + "$ " + mathconv.clean(s) + " $"
                                      + mathconv.BATCH_EPILOG)
        print("   src: %s" % re.sub(r"\s+", " ", s)[:100])
        print("   cln: %s" % re.sub(r"\s+", " ", mathconv.clean(s))[:100])
        tail = " ".join(err.split())
        print("   err: %s" % tail[-150:])
    print()
