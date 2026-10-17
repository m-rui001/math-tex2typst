"""#98 scratch: dump the fresh on-ink rows from label81_pairs.json into UTF-8 text.

Console stdout is GBK here, so the pairs (which carry TeX-ish unicode) go to a file.  Shape:
one line per row, depth-sorted, with the canvas's [boxes, ink] counts so I can see whether the
receiving box is a real frame or pure ink.  Nothing is judged here -- this is just the readable
form of the census output before the pdflatex control side is joined in.
"""
import io
import json
import os

HERE = os.path.dirname(os.path.abspath(__file__))
rec = json.load(open(os.path.join(HERE, "label81_pairs.json"), encoding="utf-8"))

out = []
for kind, idx in (("FOREIGN", 3), ("ON-INK", 4)):
    rows = [(r, t) for r in rec for t in r[idx]]
    out.append("== %s: %d rows / %d canvases / %d papers ==" % (
        kind, len(rows), len({tuple(r[0:2]) for r, t in rows}), len({r[0] for r, t in rows})))
    for r, t in sorted(rows, key=lambda x: -x[1][0]):
        if idx == 4:
            out.append("%6.2f  %-50s#%-2d bx/ink=%-9s  %-34s INTO %-34s %s" % (
                t[0], r[0][:50], r[1], json.dumps(r[2]), t[3][:34], t[4][:34],
                json.dumps(t[5])))
        else:
            out.append("%6.2f  %-50s#%-2d bx/ink=%-9s  %s" % (
                t[0], r[0][:50], r[1], json.dumps(r[2]), json.dumps(t)))
    out.append("")

with io.open(os.path.join(HERE, "label98_rows.txt"), "w", encoding="utf-8") as fh:
    fh.write("\n".join(out) + "\n")
print("wrote label98_rows.txt: %d lines" % len(out))
