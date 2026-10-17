r"""How many canvases the #74 vertical-ink law moves, measured on one base.

Two laws changed this round and both are inside the box the node sizes itself to: `_text_height`
answers the label's own ink where it used to answer one flat row at the body size, and the default
slack `_node_pad` writes for an axis nobody named is .3333em of the DOCUMENT rather than of the
node. So the face is not "the papers with a vertical arrow", it is every canvas carrying a node
whose height was never fixed -- and the only honest count is to build the SAME picture twice, once
with the law live and once with both readers stubbed back to the answers they gave yesterday. The
stubs touch nothing else: #73's ink WIDTH count and the anchor reading stay live, so a line that
moved because of those is not billed to this round.

`started drawing` / `stopped drawing` are the two second-order faces -- a node that now has a height
can make a neighbour read a real edge instead of falling through, and a picture that was refused for
want of a leading may now build or the other way round.
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
U = cetz.UNITS["pt"]


def old_pad(o, xf, axis):
    """Yesterday's default slack: .3333em of the node's OWN font, the same on both axes."""
    sep = cetz.node_padding(o, xf)[0 if axis == "x" else 1]
    if sep is None:
        size = cetz.node_font_size(o) or cetz.NODE_BODY_SIZE_PT
        return 0.3333 * size * U + cetz.PGF_LINE_WIDTH / 2.0
    return sep


def old_height(o, xf, text):
    """Yesterday's height: one flat row at the body size, plus the leading of the rows after it."""
    if not text:
        return None
    parts = cetz.LINE_BREAK.split(text)
    row = cetz.TEX_LINE_HEIGHT_PT[cetz.NODE_BODY_SIZE_PT]
    gaps = 0.0
    for gap in parts[1::2]:
        got = cetz._length(gap, xf)
        if got:
            gaps += got
    return (2 * cetz.INNER_SEP + row[0] * U + (len(parts) // 2) * row[1] * U + gaps)


def sweep():
    out = {}
    for src in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        text = open(src, encoding="utf-8", errors="replace").read()
        for k, p in enumerate(PIC.findall(text)):
            out[(os.path.basename(src), k)] = cetz.build(p)
    return out


live = sweep()
cetz._node_pad = old_pad
cetz._text_height = old_height
old = sweep()

changed = [key for key in live if live[key] != old[key]]
papers = sorted({key[0] for key in changed})
start = [key for key in changed if old[key] is None and live[key] is not None]
stop = [key for key in changed if live[key] is None and old[key] is not None]
lines = sum(1 for key in changed if live[key] and old[key]
            for a, b in zip(live[key].splitlines(), old[key].splitlines()) if a != b)
print("canvases built: %d (refused both ways: %d)"
      % (sum(1 for v in live.values() if v is not None),
         sum(1 for v in live.values() if v is None)))
print("canvases moved: %d in %d papers, %d lines" % (len(changed), len(papers), lines))
print("started drawing: %d   stopped drawing: %d" % (len(start), len(stop)))
with open(os.path.join(ROOT, "_work", "regen_needed.txt"), "w", encoding="utf-8") as fh:
    fh.write("\n".join(os.path.splitext(p)[0] for p in papers))
print("wrote _work/regen_needed.txt (%d papers)" % len(papers))
for key in changed[:8]:
    a = (live[key] or "").splitlines()
    b = (old[key] or "").splitlines()
    for i, (x, y) in enumerate(zip(a, b)):
        if x != y:
            print("  %s#%d line %d\n    old %s\n    new %s" % (key[0][:46], key[1], i, y.strip(), x.strip()))
            break
