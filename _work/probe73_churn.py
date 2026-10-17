r"""How many canvases the #73 ink-width law actually moves, measured on one base.

`_text_width` now answers a half-width for a node whose author fixed no box, and every consumer of
`node_size` -- the arrow's clip, a `.east` anchor, a `label=` pushed clear, a neighbour placed
`right=of` -- reads that number. So the change surface is not "the papers with an arrow into a maths
node", it is every canvas carrying an unsized node, and the only honest way to count it is to build
the SAME picture twice: once with the law live, once with both of the round's readers stubbed back to
the old answers. A diff of the two emitted canvases is the churn; nothing else on the page moved.
"""
import glob
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)

live = {}
for src in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
    text = open(src, encoding="utf-8", errors="replace").read()
    for k, p in enumerate(PIC.findall(text)):
        live[(os.path.basename(src), k)] = cetz.build(p)

old_build = dict(live)
# the round's two laws, stubbed back to what the same file answered before it: a label with no priced
# ink, and a name table that took the node's coordinate for its centre however it was pinned
cetz._text_width = lambda o, xf, text: None
cetz._named_box_entry = lambda at, o, xf, text: (
    tuple(at) + cetz.node_size(o, xf, text) + (cetz._anchor_ring(o, xf),))
for src in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
    text = open(src, encoding="utf-8", errors="replace").read()
    for k, p in enumerate(PIC.findall(text)):
        old_build[(os.path.basename(src), k)] = cetz.build(p)

changed = [key for key in live if live[key] != old_build[key]]
papers = sorted({key[0] for key in changed})
start = [key for key in changed if old_build[key] is None and live[key] is not None]
stop = [key for key in changed if live[key] is None and old_build[key] is not None]
print("canvases built: %d (refused both ways: %d)"
      % (sum(1 for v in live.values() if v is not None),
         sum(1 for v in live.values() if v is None)))
print("canvases moved: %d in %d papers" % (len(changed), len(papers)))
print("started drawing: %d   stopped drawing: %d" % (len(start), len(stop)))
with open(os.path.join(ROOT, "_work", "regen_needed.txt"), "w", encoding="utf-8") as fh:
    fh.write("\n".join(os.path.splitext(p)[0] for p in papers))
print("wrote _work/regen_needed.txt (%d papers)" % len(papers))
for p in papers[:10]:
    print("  %s" % p[:70])
