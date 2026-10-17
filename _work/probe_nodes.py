"""What do the corpus's node statements actually look like? (node-without-at bucket)"""
import collections
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PICTURE = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
NODE = re.compile(r"\\(?:node|coordinate)\b")
POS = re.compile(r"\b(above|below|left|right|above right|below left|below right|upper left)\s*=\s*([^;]*?)\s*of\s+([-\w]+)")
KEYS = re.compile(r"([-\w]+)\s*=")

kinds = collections.Counter()
opts = collections.Counter()
dist = collections.Counter()
samples = collections.defaultdict(list)
pics_with = collections.Counter()

for tex in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = tex.read_text(encoding="utf-8", errors="replace")
    for pic in PICTURE.findall(text):
        m = re.match(r"\\begin\{tikzpicture\}", pic)
        if not m:
            continue
        body = pic[m.end():]
        end = body.rfind("\\end{tikzpicture}")
        body = body[:end] if end >= 0 else body
        exp = cetz.expand_foreach(body)
        if exp is None:
            continue
        seen = set()
        for stmt in cetz.split_statements(exp):
            for mm in NODE.finditer(stmt):
                tail = stmt[mm.end():]
                head, pos = cetz._opts_at(tail, 0)
                if head is None:
                    kinds["broken-opts"] += 1
                    continue
                after = tail[pos:].lstrip()
                name = None
                mn = re.match(r"\(([-\w]+)\)\s*", after)
                if mn:
                    name, after = mn.group(1), after[mn.end():].lstrip()
                has_at = after.startswith("at")
                mp = POS.search(" ".join(head.keys()) + " " + after)
                if mp:
                    kinds["positioning"] += 1
                    dist[mp.group(1)] += 1
                    for k in head:
                        if "of" in str(head[k]) or k in ("below", "above", "left", "right"):
                            opts[k] += 1
                elif has_at:
                    kinds["at"] += 1
                elif re.match(r"[({[]", after):
                    kinds["implicit-point"] += 1  # \node at implied by previous? e.g. node in path
                else:
                    kinds["bare"] += 1
                    if len(samples["bare"]) < 12:
                        samples["bare"].append(stmt.strip()[:160])
                for k in head:
                    if k in ("midway", "pos", "near start", "near end", "sloped",
                             "anchor", "text", "minimum size", "minimum width",
                             "minimum height", "inner sep", "outer sep", "rectangle",
                             "circle", "draw", "fill", "rounded corners", "below",
                             "above", "left", "right", "align", "node distance"):
                        opts[k] += 1
                seen.add("pic")
        if seen:
            pics_with["pictures with nodes"] += 1

print("statement forms:")
for k, v in kinds.most_common():
    print("%6d  %s" % (v, k))
print("\noption keys:")
for k, v in opts.most_common(24):
    print("%6d  %s" % (v, k))
print("\npositioning directions:")
for k, v in dist.most_common():
    print("%6d  %s" % (v, k))
print("\n%d pictures contain nodes" % pics_with["pictures with nodes"])
print("\nbare samples:")
for s in samples["bare"]:
    print("  " + re.sub(r"\s+", " ", s))
