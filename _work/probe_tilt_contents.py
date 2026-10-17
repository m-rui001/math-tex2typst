"""What a tilted scope actually holds: the verbs under each scope that carries rotate= or a basis.

Uses cetz's own SCOPE / _opts_at / split_statements, so the scope boundaries and the option
dictionary are the ones the converter itself reads.
"""
import collections
import pathlib
import re
import sys

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "tools"))
from t2t import cetz

ROOT = pathlib.Path(__file__).resolve().parents[1]
PICTURE = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
TILT = re.compile(r"\b(rotate around|rotate)\s*=|\b[xy]\s*=\s*\{?\(")
VERB = re.compile(r"\\(draw|fill|filldraw|path|node|shade|clip|use|pic|coordinate)\b")


def scope_bodies(body):
    """(options, inner text) for every \begin{scope} in body, reusing cetz's reader."""
    out, pos = [], 0
    while True:
        m = cetz.SCOPE.search(body, pos)
        if not m or m.group(1) == "end":
            return out
        o, start = cetz._opts_at(body, m.end())
        depth, i = 1, start
        while depth:
            n = cetz.SCOPE.search(body, i)
            if not n:
                return out
            depth += 1 if n.group(1) == "begin" else -1
            i = n.end()
        out.append((o or {}, body[start:n.start()]))
        pos = i


verbs = collections.Counter()
tilted = 0
for tex in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = tex.read_text(encoding="utf-8", errors="replace")
    for pic in PICTURE.findall(text):
        if cetz.build(pic) is not None or not TILT.search(pic):
            continue
        tilted += 1
        heads = []
        for o, inner in scope_bodies(pic):
            if any(k in cetz.TILTS for k in o):
                heads.extend(VERB.findall(inner))
        if not heads:
            # the tilt is on the picture itself, so every statement of the drawing carries it
            heads = VERB.findall(pic)
        for v in set(heads):
            verbs[v] += 1
        print("%s" % ", ".join(sorted(set(heads)) or ["NO VERB READ"]))

print("tilted refused pictures: %d" % tilted)
print("verbs inside a tilted scope: %s" % dict(verbs.most_common()))
