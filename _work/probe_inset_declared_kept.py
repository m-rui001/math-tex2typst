r"""Every node that writes its own `inner sep` and still gets pgf's default padding on the page.

The product scan that drove the regeneration asks a paper-level question (does this source mention
`inner sep` anywhere?), so a page can keep carrying default `inset:` lines for nodes that never asked
for a measure -- correct by design. This asks the node-level question instead: for every call the
emitter makes to `node_inset`, did the option table carry a declared padding, and what did the
function answer? A call that declares a value and returns the default is a site the fix missed; the
count of those is what has to reach zero before the remaining page lines can be called literal.

Runs the same two preprocessing steps `convert` puts in front of `build`, so the `x=.85\linewidth`
pictures and every tikzcd canvas are on the basis (the #45 lesson: a guard that calls `build` alone
never sees them). No compiler is involved.
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

PIC = re.compile(r"\\begin\{(tikzpicture|tikzcd|CD)\}.*?\\end\{\1\}", re.S)

current = [None]
STATS = Counter()
MISSED = []
_orig = cetz.node_inset


def wrap(o):
    got = o.get("inner sep")
    answer = _orig(o)
    if got is None:
        STATS["no declared sep -> default" if answer == "0.3333em" else "no sep, not default"] += 1
    elif answer == "0.3333em":
        STATS["declared sep kept default"] += 1
        if len(MISSED) < 20:
            MISSED.append("%s pic%d | inner sep=%r" % (current[0][0][:44], current[0][1], got))
    else:
        STATS["declared sep spent"] += 1
    return answer


cetz.node_inset = wrap
pics = built = 0
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    src = path.read_text(encoding="utf-8", errors="replace")
    for n, m in enumerate(PIC.finditer(src)):
        pics += 1
        current[0] = (path.stem, n)
        core = cetz.expand_linewidth(cetz.MATH_ENVELOPE.sub("", m.group(0)), None)
        if cetz.build(core) or cetz.build_cd(core):
            built += 1
cetz.node_inset = _orig

print("pictures %d, built %d" % (pics, built))
for key, n in sorted(STATS.items(), key=lambda kv: -kv[1]):
    print("  %-28s %6d" % (key, n))
for line in MISSED:
    print("  missed> %s" % line)
