"""For every tikzcd block that survives as residue, does the converter take it now?

Run: python _work/probe_cd_residue.py
"""
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

TeXSTR = re.compile(r'"((?:[^"\\]|\\.)*)"')
CD = re.compile(r"\\begin\{tikzcd\}", re.S)


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
            s = unescape(m.group(1))
            if CD.search(s):
                seen.setdefault(s, path.name[:40])

print("distinct residue strings holding a tikzcd env: %d" % len(seen))
built = refused = notcompiled = 0
for src, owner in seen.items():
    env = cetz.CD_ENV.search(src)
    if env is None:
        refused += 1
        print("NO CD_ENV MATCH  %s  %s" % (owner, re.sub(r"\s+", " ", src)[:100]))
        continue
    canvas = cetz.build_cd(env.group(0))
    if canvas is None:
        refused += 1
        print("BUILD NONE     %s  %s" % (owner, re.sub(r"\s+", " ", env.group(0))[:100]))
    elif not (cetz.sane(canvas) and cetz.compiles(canvas)):
        notcompiled += 1
        print("GATE FAIL      %s  %s" % (owner, re.sub(r"\s+", " ", env.group(0))[:100]))
    else:
        built += 1
        print("WOULD CONVERT  %s  %s" % (owner, re.sub(r"\s+", " ", env.group(0))[:100]))
print("built-and-compiling=%d  build-refused=%d  gate-fail=%d" % (built, refused, notcompiled))
