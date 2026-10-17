r"""How many canvases the #69 box-edge law moves, measured on one base.

One law changed: `_box_edges` answers `bounds`/`bounds` for a body that carries a math delimiter
where yesterday every body was measured by #63's `cap-height`/`baseline`. The honest count is to
build the SAME picture twice, once with the law live and once with the reader stubbed back to the
single answer it gave yesterday -- nothing else is touched, so a line that moved for another reason
is not billed to this round.

`started drawing` / `stopped drawing` are the two second-order faces: the edge a body is measured by
is also the edge CeTz measures the block it anchors by, so a picture that was refused for want of a
shape may now build, or the other way round.

The sweep is on the BATCH basis, not on a regex over `_work/flat`: the pictures come from
`convert.lifted_pictures` with their figure's own macros and declarations folded in and the
`\linewidth` axis expanded, exactly as `cetz.convert` hands them to `build`.  The first version of this
probe called `cetz.build(PIC.findall(text)[k])` with no colours, no declarations and no axis, and the
6 papers whose pictures need one of the three were invisible to it -- 30 maths bodies stayed on the old
law in the products, which `_work/scan_product_box_edges.py` caught.  That is the fourth time "a static
stub diff is only a lower bound" has bitten (#45 four papers short, #63 six, now six again): the diff
estimates the churn, the PRODUCTS decide whether the round closed.
"""
import glob
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz, convert, prep  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
EDGE = re.compile(r'#set text\(hyphenate: false, ([^)]*)\)')


def old_edges(text):
    """Yesterday's answer: one edge pair for every body, maths or not."""
    return cetz.BOX_TEXT_EDGES


def sweep():
    out = {}
    for path in sorted(glob.glob(os.path.join(FLAT, "*.tex"))):
        stem = os.path.basename(path)
        src = open(path, encoding="utf-8", errors="replace").read()
        pre_text, body = prep.split_document(src)
        p = prep.parse_preamble(pre_text)
        body = prep.scale_linewidth_in_minipages(body)
        body = prep.unwrap_boxes(body)
        pics = convert.lifted_pictures(body)
        if not pics:
            continue
        scopes = convert.picture_scopes(body, p.macros)
        axis = convert.line_cm(p)
        for k, m in enumerate(pics):
            pic = m.group(0)
            table, decls = scopes[k]
            if decls:
                pic = convert.with_declarations(pic, decls)
            pic = prep.expand_macros(pic, table)
            core = cetz.expand_linewidth(cetz.strip_envelope(pic), axis)
            out[(stem, k)] = cetz.build(core, p.colors) or cetz.build_cd(core)
    return out


live = sweep()
cetz._box_edges = old_edges
old = sweep()

changed = [key for key in live if live[key] != old[key]]
papers = sorted({key[0] for key in changed})
start = [key for key in changed if old[key] is None and live[key] is not None]
stop = [key for key in changed if live[key] is None and old[key] is not None]
lines = bodies = 0
math_bodies = prose_bodies = 0
for key in changed:
    if not (live[key] and old[key]):
        continue
    for a, b in zip(live[key].splitlines(), old[key].splitlines()):
        if a == b:
            continue
        lines += 1
        got = EDGE.findall(a)
        was = EDGE.findall(b)
        if got and was and got != was:
            bodies += len(got)
            math_bodies += sum(1 for g in got if g == cetz.BOX_MATH_EDGES)
            prose_bodies += sum(1 for g in got if g == cetz.BOX_TEXT_EDGES)
print("canvases built: %d (refused both ways: %d)"
      % (sum(1 for v in live.values() if v is not None),
         sum(1 for v in live.values() if v is None)))
print("canvases moved: %d in %d papers, %d lines" % (len(changed), len(papers), lines))
print("  edge pairs rewritten: %d (to bounds %d, kept cap/baseline %d)"
      % (bodies, math_bodies, prose_bodies))
print("started drawing: %d   stopped drawing: %d" % (len(start), len(stop)))
with open(os.path.join(ROOT, "_work", "regen_needed.txt"), "w", encoding="utf-8") as fh:
    fh.write("\n".join(os.path.splitext(p)[0] for p in papers))
print("wrote _work/regen_needed.txt (%d papers)" % len(papers))
for key in changed[:6]:
    a = (live[key] or "").splitlines()
    b = (old[key] or "").splitlines()
    for i, (x, y) in enumerate(zip(a, b)):
        if x != y:
            print("  %s#%d line %d\n    old %s\n    new %s"
                  % (key[0][:46], key[1], i, y.strip()[:150], x.strip()[:150]))
            break
