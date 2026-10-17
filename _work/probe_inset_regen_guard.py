r"""What this round's `node_inset` actually changes -- the churn, and whether it breaks anything.

`box_args` used to spend pgf's *default* `inner sep` on every framed node. The fix reads the node's own
`inner sep` and writes it as an absolute `inset:`. To measure the face honestly the new function is
stubbed back to the old constant -- nothing else is touched, so the diff is exactly this round's step
(`_work/probe_circle_face.py`'s lesson: a stub that also withdraws older law reports an upper bound, not
an account).

Two numbers are wanted. `changed` is the churn a regeneration has to cover. `lost` is the alarm: a canvas
that built before and refuses now means the emitted `inset:` broke a picture, and that is a bug in this
round, not a corpus limit. `gained` would mean the stub was over-withdrawn.

The basis is `cetz.build`, which bypasses `expand_linewidth` and `build_cd`, so pictures sized
`x=.85\linewidth` and every tikzcd are invisible here -- `_work/probe_inset_product.py` reads the pages
and writes the regeneration list.
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
LIVE = cetz.node_inset


def old(o):
    return "0.3333em"


changed = []
lost = []
gained = []
STATS = Counter()
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    src = path.read_text(encoding="utf-8", errors="replace")
    for n, pic in enumerate(PIC.findall(src)):
        cetz.node_inset = LIVE
        new = cetz.build(pic)
        cetz.node_inset = old
        was = cetz.build(pic)
        cetz.node_inset = LIVE
        if new is None and was is not None:
            lost.append((path.stem, n))
            continue
        if was is None and new is not None:
            gained.append((path.stem, n))
            continue
        if new is None:
            STATS["refused both"] += 1
            continue
        if new == was:
            STATS["identical"] += 1
            continue
        diff = [l for l, b in zip(new.splitlines(), was.splitlines()) if l != b]
        changed.append((path.stem, n, len(diff)))
        STATS["changed"] += 1

papers = {stem for stem, _, _ in changed}
print("canvas verdicts: %s" % dict(STATS))
print("changed canvases %d, papers %d, differing lines %d"
      % (len(changed), len(papers), sum(c for _, _, c in changed)))
print("lost %d %s   gained %d %s" % (len(lost), lost[:5], len(gained), gained[:5]))
print("-- biggest canvases")
for stem, n, c in sorted(changed, key=lambda t: -t[2])[:10]:
    print("   %-46s pic%-3d %d lines" % (stem[:46], n, c))
