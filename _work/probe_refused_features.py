r"""Tally the blocking TikZ features of the 16 pictures that fell back to quoted raw LaTeX.

The raw block in main.typ is the refusal fallback, so its text is the author's picture verbatim;
unescape it and count the features CeTz cannot yet translate. Read-only, no typst.
"""
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "tools"))
from t2t import cetz  # noqa: E402

BLOCK = re.compile(r'#raw\(block: true, lang: "latex", "((?:[^"\\]|\\.)*)"\)')


def unquote(s):
    return s.replace("\\\\", "\x00").replace("\\n", "\n").replace("\x00", "\\")


FEATURES = [
    ("3D z basis", lambda t: re.search(r"\bz=\{?\(", t)),
    ("foreach", lambda t: r"\foreach" in t),
    ("pgfmath", lambda t: r"\pgfmath" in t),
    ("plot coordinates", lambda t: r"\plot" in t or r"plot[" in t),
    ("decorate", lambda t: r"\decorate" in t or "decorate" in t),
    ("clip", lambda t: r"\clip" in t),
    ("bounding box", lambda t: r"use as bounding box" in t),
    ("scope", lambda t: r"\begin{scope}" in t),
    ("style defs in picture", lambda t: re.search(r"/\.style=", t)),
    ("polar (ang:r)", lambda t: re.search(r"\(\s*[\d.]+\s*:\s*[\d.]+\s*\)", t)),
    ("calc $(...)$", lambda t: "$(" in t),
    ("minimum size/width", lambda t: r"minimum " in t),
    ("text width/align", lambda t: r"text width" in t or r"align=" in t),
    ("shading / ball", lambda t: r"\shading" in t or "top color" in t),
    ("layers / on layer", lambda t: r"on layer" in t),
    ("intersections library", lambda t: r"name intersections" in t),
    ("tikzcd", lambda t: r"\begin{tikzcd}" in t),
    ("only coordinates+draw+node", lambda t: not (
        r"\foreach" in t or r"\pgfmath" in t or r"\plot" in t or r"\shade" in t
        or r"on layer" in t or r"name intersections" in t or "$(" in t
        or r"\decorate" in t or re.search(r"\bz=\{?\(", t))),
]

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
rows = []
for paper in sorted(os.listdir(os.path.join(ROOT, "typst"))):
    path = os.path.join(ROOT, "typst", paper, "main.typ")
    if not os.path.isfile(path):
        continue
    text = open(path, encoding="utf-8", errors="replace").read()
    for m in BLOCK.finditer(text):
        rows.append((paper, unquote(m.group(1))))

print("quoted raw pictures: %d over %d papers" % (len(rows), len(set(p for p, _ in rows))))
tally = {}
for name, test in FEATURES:
    hits = [p for p, t in rows if test(t)]
    tally[name] = hits
for name, _ in FEATURES:
    hits = tally[name]
    if hits or name.startswith("only"):
        print("%4d  %-24s %s" % (len(hits), name,
                                 ", ".join(h[:26] for h in hits[:6])))
print("\n-- per paper: the tokens CeTz marks unsupported --")
for paper, t in rows:
    unsupported = sorted({g.group(0) for g in cetz.UNSUPPORTED.finditer(t)})
    print("   %-44s unsup=%s" % (paper[:44], unsupported[:8]))
