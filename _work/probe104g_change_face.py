r"""#104g: the change face of reading a `fit=` box, corpus-wide, measured the project's way.

轴 68 / #81 prices a change by the same base read twice.  The base here is every flattened picture in
`_work/flat/*.tex`, and the two readings are the source as the author wrote it and the source with the
author's own `fit=(...)` option stripped -- stripping it is what the old law did, because nothing else
in `cetz.py` read the key: the gatherer stood at the scope origin with no box at all, and a neighbour
placed `below=10mm of branches` stepped over nothing.  (Stubbing `fit_rect` to None instead is NOT the
old law: the refusal clause beside it in `_node_at` is this round's code, so a half-stub refuses the
four canvases and reports an artifact.)

Counting at the emitter rather than through `convert.convert_paper` costs seconds instead of a whole
batch and cannot miss a canvas: the law moves numbers only inside a picture that writes `fit=`, and the
two counters below are read against each other -- a canvas that changes without writing the key, or
changes its refusal, is a side effect to be chased rather than shipped.

  python _work/probe104g_change_face.py        # -> _work/label104g_change_face.txt
"""
import difflib
import io
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
sys.path.insert(0, os.path.join(ROOT, "tools"))

import compare_figure as cf  # noqa: E402
from t2t import cetz  # noqa: E402

OUT = os.path.join(HERE, "label104g_change_face.txt")
FIT = re.compile(r"fit\s*=\s*\((?:[^()]|\([^()]*\))*\)")
# the option value is a RUN of parenthesised references -- `fit=(t1)(k11)(k12)(k1q)` -- so the strip
# takes the run, not just its first group, and a comma that followed it
STRIP = re.compile(r"fit\s*=\s*(?:\(\s*[^()]*\s*\))+\s*,?")


def _moved(was, now):
    """How many emitted lines the two readings disagree on."""
    if was is None or now is None:
        return -1
    return sum(1 for l in difflib.unified_diff(was.splitlines(), now.splitlines(), n=0,
                                               lineterm="")
               if l.startswith(("+", "-")) and not l.startswith(("+++", "---")))


def main():
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    flat = os.path.join(HERE, "flat")
    stems = sorted(d[:-4] for d in os.listdir(flat) if d.endswith(".tex"))
    rows, written, no_change, refused_elsewhere = [], [], [], 0
    scanned = 0
    for stem in stems:
        text = io.open(os.path.join(flat, stem + ".tex"), encoding="utf-8",
                       errors="replace").read()
        for k, m in enumerate(cf.PIC.finditer(text)):
            pic = m.group(0)
            scanned += 1
            now = cetz.build(pic)
            if not FIT.search(pic):
                # a picture the emitter refuses for some other reason is not this round's face, but
                # counting it here keeps the 1,058 flat pictures accounted for on one page
                refused_elsewhere += now is None
                continue
            written.append((stem, k))
            was = cetz.build(STRIP.sub("", pic))
            if now == was:
                no_change.append((stem, k, was is None))
                continue
            rows.append((stem, k, now is not None, was is None, _moved(was, now)))
    lines = ["#104g change face: every flat picture built twice -- as written, and with the",
             "     author's own `fit=(...)` option stripped (the old law read no box).",
             "pictures built: %d over %d papers" % (scanned, len(stems)),
             "pictures the emitter refuses for reasons of its own: %d (not this round's)"
             % refused_elsewhere,
             "canvases that write fit=: %d over %d papers"
             % (len(written), len({s for s, _ in written})),
             "canvases whose emission differs: %d over %d papers"
             % (len(rows), len({r[0] for r in rows})),
             "emitted lines moved in total: %d" % sum(r[4] for r in rows),
             "canvases that write the key and change nothing: %d" % len(no_change),
             "canvases the new law newly refuses: %d" % sum(1 for r in rows if not r[2]), ""]
    for stem, k, refused_old in no_change:
        lines.append("  NO CHANGE  %s#%d (the stripped source refused too: %s)"
                     % (stem, k, refused_old))
    for stem, k, _, refused_old, moved in rows:
        lines.append("  CHANGED    %s#%d  lines=%d  (old law refused the whole canvas: %s)"
                     % (stem, k, moved, refused_old))
    text_out = "\n".join(lines) + "\n"
    io.open(OUT, "w", encoding="utf-8").write(text_out)
    print(text_out)
    return 0


if __name__ == "__main__":
    sys.exit(main())
