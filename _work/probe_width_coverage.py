r"""Audit #39 from the inside: every framed node the converter emits, with the width it was given.

The census/diff gap (94 papers listed a `#box(` without `width:`, 62 papers changed) can only mean one
of two things -- either those papers' framed nodes genuinely carry no measure, or the fix fails to
reach some node that does. A missed node is a bug, so this does not compare products at all: it wraps
`cetz.emit_node` and records, for every node that reaches the page inside a `#box(`, the options that
produced it and the width it was handed. A line with `width: None` whose options name a readable
measure is the failure this probe exists to find.

Basis note (#78, ledger axis 60): the loop replays pictures with a bare `cetz.build(pic)`, so a node
whose measure is written `.84\\textwidth` arrives here as a macro name and lands in the `refused:`
bucket -- the batch folds that share into cm before the emitter runs. The batch-basis shape of the
same question is `_work/probe78_relwidth_face.py::emitter_face` (0 bad); this file stays as #39's own
reading, with its numbers left as they were measured then.
"""
import io
import pathlib
import re
import sys
from collections import Counter

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
live = cetz.emit_node
rows = []


def spy(at, inner, o, *a, **kw):
    # `emit_node` grew `extent` and `pad` since this probe was written; a spy that names the
    # parameters it knew about dies with "takes from 3 to 7 positional arguments but 9 were given",
    # so pass the rest through and read the width out of the position it actually arrives in.
    width = kw.get("width", a[3] if len(a) > 3 else None)
    out = live(at, inner, o, *a, **kw)
    text = "\n".join(out or [])
    if "#box(" in text:
        rows.append((o, width, "width:" in text))
    return out


def main():
    cetz.emit_node = spy
    for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
        text = path.read_text(encoding="utf-8", errors="replace")
        for pic in PIC.findall(text):
            cetz.build(pic)
    cetz.emit_node = live
    framed = len(rows)
    with_w = sum(1 for _o, w, drawn in rows if drawn)
    print("nodes reaching the page inside a #box(: %d, carrying width: %d" % (framed, with_w))
    keys = Counter()
    bad = []
    for o, width, drawn in rows:
        named = [k for k in ("text width", "minimum width", "minimum size") if k in o]
        if drawn:
            keys[",".join(named) or "(none)"] += 1
        else:
            # a box drawn with no width: is fine only when no measure is readable for it
            if width is not None:
                bad.append((o, width))
            keys["refused:" + (",".join(named) or "(none)")] += 1
    print("by measure named:")
    for k, n in keys.most_common():
        print("   %5d  %s" % (n, k))
    print("BUG -- nodes with a readable measure but no width emitted: %d" % len(bad))
    for o, w in bad[:5]:
        print("   width=%s %s" % (w, {k: v for k, v in o.items()
                                      if k in ("text width", "minimum width", "minimum size",
                                               "inner sep", "draw", "fill", "align")}))


if __name__ == "__main__":
    main()
