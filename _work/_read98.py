"""#98 scratch: print one canvas's emitted block next to its source picture, for reading.

The mechanism dump (`probe87_onink_mechanism.py`) only shows the lines whose text matched a flagged
span, so a path whose own statement is the suspect is invisible when its ink is not text.  This hands
back the whole `#canvas` block for a `stem#k` plus the source statements in source order.

  python _work/_read98.py <stem-prefix> <k>
"""
import io
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, HERE)
import probe81_label_box_face as g  # noqa: E402
import probe84_control_face as C  # noqa: E402

prefix, k = sys.argv[1], int(sys.argv[2])
canvases = g.canvases()
hit = [(stem, i) for stem, i in canvases if stem.startswith(prefix)]
if not hit:
    sys.exit("no canvas for %r" % prefix)
stem, _ = sorted(hit)[0]
head, block = canvases[(stem, k)]
path, pics = C.pictures(stem)
out = ["== %s#%d ==" % (stem, k), "== source: %s ==" % path]
for s in pics[k].splitlines():
    out.append("  " + s)
out.append("-- emitted --")
out.append(block)
with io.open(os.path.join(HERE, "label98_canvas_%s.txt" % stem[:18]), "w",
             encoding="utf-8", newline="\n") as fh:
    fh.write("\n".join(out) + "\n")
print(os.path.relpath(os.path.join(HERE, "label98_canvas_%s.txt" % stem[:18]), ROOT))
