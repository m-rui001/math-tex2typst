r"""Every node that names a SHAPE -- and which branch of `emit_node` it actually falls into.

The product-side look at `_work/probe_shape_size.py` found one spelling (`circle` + `minimum width`)
losing its frame, but it counted only nodes that also declare a measure. The converter's branch order
is harsher than that: the range form that carries `frame:` is taken only when BOTH half-extents are
known, so a shaped node with no declared size at all -- the ordinary `\node[circle,draw] {ab}` --
leaves `box` None and lands in the Typst `#box(` branch, which draws a rectangle and no shape.

This asks the converter, not the sources: for every node of every picture that builds, record the
shape word it carries (if any) and which of the four branches drew it. The answer is the size of the
face a fix has to cover, and the shape-word inventory is the list of names a mapping has to spell --
counted from the parser's own option table so a `.style` that expands to `circle` is not invisible.
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
# the shape names pgf's own shape library installs, as they appear as bare option words
SHAPES = ("circle", "ellipse", "rectangle", "rect", "diamond", "trapezium", "semicircle",
          "regular polygon", "star", "asterisk", "cross out", "rectangle split",
          "signal", "drop", "cylinder", "rounded corners")
BRANCH = {"dot": "empty text -> circle(radius:0.05)",
          "range": "range form -> frame:",
          "grown": "grown_box",
          "box": "Typst #box( -> rectangle",
          "bare": "plain content, no frame"}

current = [None]
STATS = Counter()
FACES = {k: {"nodes": 0, "pics": set(), "papers": set()} for k in BRANCH}
WORDS = Counter()
KEYS = Counter()
_orig = cetz.emit_node


def shape_of(o):
    # a shape is spelled two ways: the bare word (`[circle,draw]`) and the key (`[shape=circle]`),
    # and a `.style` can hand either over, so both are read off the parser's own option table
    val = o.get("shape")
    if isinstance(val, str) and val.strip():
        return val.strip()
    for name in SHAPES:
        if name in o:
            return name
    return None


def classify(o, box, text):
    if not text:
        return "dot"
    if box:
        return "grown" if "#linebreak()" in text else "range"
    if cetz.box_visible(o):
        return "box"
    return "bare"


def wrap(at, inner, o, pal=None, box=None, angle=0.0, width=None, extent=(None, None),
         pad=cetz.INNER_SEP):
    text = cetz.node_text(inner, pal) or ""
    for key, val in o.items():
        if val is True:
            KEYS[key] += 1
    name = shape_of(o)
    if name:
        WORDS[name] += 1
        key = classify(o, box, text)
        STATS[(name, key)] += 1
        d = FACES[key]
        d["nodes"] += 1
        d["pics"].add(current[0])
        d["papers"].add(current[0][0])
    return _orig(at, inner, o, pal, box, angle, width, extent, pad)


cetz.emit_node = wrap
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = path.read_text(encoding="utf-8", errors="replace")
    for n, pic in enumerate(PIC.findall(text)):
        current[0] = (path.stem, n)
        cetz.build(pic)
cetz.emit_node = _orig

print("== shape word x branch (nodes seen by emit_node, pictures that build)")
print("%-18s %-34s %6s" % ("shape", "branch that drew it", "nodes"))
for (name, key), n in sorted(STATS.items(), key=lambda kv: -kv[1]):
    print("%-18s %-34s %6d" % (name, BRANCH[key], n))
print("\n== face by branch, over every shape name")
print("%-34s %7s %7s %7s" % ("branch", "nodes", "pics", "papers"))
for key, label in BRANCH.items():
    d = FACES[key]
    print("%-34s %7d %7d %7d" % (label, d["nodes"], len(d["pics"]), len(d["papers"])))
union_p, union_c = set(), set()
for d in FACES.values():
    union_p |= d["papers"]
    union_c |= d["pics"]
print("%-34s %7s %7d %7d" % ("union of branches", "", len(union_c), len(union_p)))
print("\n== shape words seen: %s" % dict(WORDS))
# a shape name missing from SHAPES would be invisible to the census above, so the bare-option keys
# are dumped too: read the list against pgf's shape library before believing "only these shapes".
print("\n== every bare (value=True) option key, most common first -- spot unmapped shape names here")
for key, n in KEYS.most_common(60):
    print("   %-26s %d" % (key, n))
