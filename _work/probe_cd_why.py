r"""Why do tikzcd diagrams still refuse, and can CeTz draw a bent arrow?

Run: python _work/probe_cd_why.py
"""
import collections
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

ENV = re.compile(r"\\begin\{tikzcd\}(\[[^\]]*\])?(.*?)\\end\{tikzcd\}", re.S)

bodies = []
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    bodies += [m.group(0) for m in ENV.finditer(path.read_text(encoding="utf-8", errors="replace"))]
print("tikzcd envs in sources:", len(bodies))

KNOWN = set("rlud rd dr ru ur ld dl lu ul".split()) | {
    "leftarrow", "gets", "to", "rightarrow", "no head", "dashed", "dash",
    "phantom", "swap", "above", "right", "below", "left", "'", '"'}

reasons = collections.Counter()
opts = collections.Counter()
for src in bodies:
    if cetz.build_cd(src):
        reasons["CONVERTED"] += 1
        continue
    m = ENV.search(src)
    rest = (src[:m.start()] + src[m.end():])
    rest = re.sub(r"\\(?:begin|end)\{(?:gathered|aligned|array|matrix)\}", "", rest)
    if re.search(r"[^\s{}$\\]", rest):
        reasons["text-outside-env"] += 1
        continue
    body = m.group(2)
    if re.search(r"ampersand replacement\s*=\s*\\&", m.group(1) or ""):
        body = body.replace("\\&", "&")
    blocked = set()
    for spec in cetz.CD_ARROW.findall(body):
        for opt in (p.strip() for p in cetz.split_top(spec or "", ",")):
            if not opt:
                continue
            if opt not in KNOWN:
                key = re.split(r"[=,\s]", opt)[0] or opt
                opts[key] += 1
                blocked.add(key)
    if not blocked:
        reasons["no-bad-option"] += 1   # labels, short lines, sane/compiles gate
    else:
        for b in sorted(blocked, key=lambda k: -opts[k])[:3]:
            reasons["blocked-by:" + b] += 1

print("\nrefusal reasons:")
for k, v in reasons.most_common(18):
    print("  %4d  %s" % (v, k))
print("\nunknown arrow options:")
for k, v in opts.most_common(14):
    print("  %4d  %s" % (v, k))

CANDIDATES = [
    ("line baseline", "line((0, 0), (2, 0), mark: (end: \">\"))"),
    ("curve cont", "curve((0, 0), (2, 0), cont: ((1, -0.6),))"),
    ("curve anchors", "curve((0, 0), (2, 0), anchors: ((1, -0.6),))"),
    ("curve cont+arrow", "curve((0, 0), (2, 0), cont: ((1, -0.6),), arrow: (mark: (end: \">\"),))"),
    ("curve anchors+mark", "curve((0, 0), (2, 0), anchors: ((1, -0.6),), mark: (end: \">\"))"),
    ("hook stub", "line((0, 0), (2, 0), mark: (end: \">\"))\n  line((2, 0), (2, 0.4))"),
    ("equal double", "line((0, 0.12), (2, 0.12), mark: (end: \">\"))\n  line((0, -0.12), (2, -0.12))"),
]
print("\ncetz syntax gate (real typst compile):")
for name, body in CANDIDATES:
    canvas = "#cetz.canvas({\n  import cetz.draw: *\n  " + body + "\n})"
    print("  %-18s %s" % (name, "OK" if cetz.sane(canvas) and cetz.compiles(canvas) else "FAIL"))
