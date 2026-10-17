r"""How many framed nodes reach `box_args` with an `inner sep` the author wrote down.

`box_args` (cetz.py:1936) is the one place a Typst `#box(` gets its `inset:`, and its first line is a
hard-coded `0.3333em` -- pgf's *default*. `node_inner_sep`/`node_frame_width` already read a node's own
`inner sep`, so a node that says `inner sep=2pt` gets a frame `2*2pt` wider than the default and then has
that extra padding spent as `0.3333em` of inset: the words sit too far from the border and the paragraph
column comes out narrower than the `text width` the author measured (see #39's law,
`_work/measure_textwidth_frame.py`: frame = D + 2*sep, text column = D).

This asks the converter, over every picture that builds: for each call of `box_args`, was `inner sep`
written, and did `_length` read it? The `unreadable` column is the honest lower bound on what a fix
cannot cover yet. Note the basis: `build` bypasses `expand_linewidth` and `build_cd` (see
_work/probe_brace_left.py), so pictures sized `x=.85\linewidth` and every tikzcd are invisible here --
the product scan is the complete basis.
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

current = [None]
STATS = Counter()
VALUES = Counter()
FACE = {"calls": 0, "pics": set(), "papers": set()}
SAMPLE = []
_orig = cetz.box_args


def wrap(o, pal):
    got = o.get("inner sep")
    if got is None:
        kind = "default"
    elif _length_reads(got):
        kind = "readable"
        VALUES[str(got).strip()] += 1
        if len(SAMPLE) < 12:
            SAMPLE.append((current[0], got))
    else:
        kind = "unreadable"
        VALUES["?? " + str(got).strip()[:20]] += 1
    STATS[kind] += 1
    if kind == "readable":
        FACE["calls"] += 1
        FACE["pics"].add(current[0])
        FACE["papers"].add(current[0][0])
    return _orig(o, pal)


def _length_reads(value):
    return cetz._length(str(value), cetz.IDENT) is not None


cetz.box_args = wrap
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    src = path.read_text(encoding="utf-8", errors="replace")
    for n, pic in enumerate(PIC.findall(src)):
        current[0] = (path.stem, n)
        cetz.build(pic)
cetz.box_args = _orig

print("== box_args calls, split by what the node wrote on `inner sep`")
for kind, n in STATS.most_common():
    print("%-11s %6d" % (kind, n))
print("nodes with a readable declared sep: %d, over %d canvases, %d papers (union)"
      % (FACE["calls"], len(FACE["pics"]), len(FACE["papers"])))
print("== the values themselves, most written first")
for value, n in VALUES.most_common(24):
    print("   %-22s %5d" % (value, n))
print("-- samples")
for (stem, n), value in SAMPLE:
    print("   %s pic%d  inner sep=%s" % (stem[:44], n, str(value)[:30]))
