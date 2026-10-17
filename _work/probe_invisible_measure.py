r"""Count the emitter's decision face: nodes with a written measure but no visible frame.

Wraps `cetz.emit_node` and buckets every call, so the count is of decisions the emitter actually
made over the corpus rather than of a keyword in the sources.
"""
import glob
import os
import re
import sys
from collections import Counter

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
sys.stdout.reconfigure(errors="replace")
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
FLAT = os.path.join(ROOT, "_work", "flat")

seen = Counter()
papers = {}
inner_text = {}
orig = cetz.emit_node


def wrapped(at, inner_node, o, pal=None, box=None, angle=0.0, width=None,
            extent=(None, None), pad=cetz.INNER_SEP):
    if width is not None and not cetz.box_visible(o):
        key = "text width" if o.get("text width") is not None else "minimum width/size"
        seen[key] += 1
        seen["align=" + str(o.get("align"))] += 1
        papers.setdefault(key, set()).add(cur)
        txt = inner_text.setdefault(key, [])
        if len(txt) < 4:
            txt.append(re.sub(r"\s+", " ", str(inner_node))[:90])
    return orig(at, inner_node, o, pal, box, angle, width, extent, pad)


cetz.emit_node = wrapped

for src in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
    cur = os.path.basename(src)
    text = open(src, encoding="utf-8", errors="replace").read()
    for p in PIC.findall(text):
        cetz.build(p)

for key in sorted(papers):
    print("%-24s %5d nodes in %3d papers" % (key, seen[key], len(papers[key])))
for key, samples in inner_text.items():
    print("--- %s" % key)
    for s in samples:
        print("    %s" % s)
