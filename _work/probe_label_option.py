r"""How many nodes carry a `label=` option, and what happens to it?

`label=above:{$f$}` is how TikZ hangs text off a point without giving that text a box, and it is the
normal spelling for naming a dot or annotating the side of a framed node. Nothing in the converter
reads that key: `emit_node` returns as soon as the node's own brace group is empty, so a `label=` on
such a node can only vanish. Count it where the answer cannot be faked -- the option dict the parser
already built for every node of every picture that builds -- rather than by grepping the flat sources,
which misses every spelling that arrives through a `.style` and every one `\\foreach` expands.

Prints per class the node/picture/paper counts, the inventory of what the position slot says, and
verbatim option values, so the spellings a fix has to parse are visible. The two classes answer
different questions: a node with its own text loses an annotation, an empty node loses the ONLY text
it was supposed to place.
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
CLASSES = ("empty node text", "node has own text", "pin instead of label")

current = [None]
STATS = {k: {"nodes": 0, "pics": set(), "papers": set(), "samples": [], "shaped": 0}
         for k in CLASSES}
VALS = Counter()
SHORT = Counter()
SPELL = Counter()
_orig = cetz.emit_node
_live_labels = cetz.label_lines
hangs = [0]


def spy_labels(at, o, pal, extent):
    out = _live_labels(at, o, pal, extent)
    hangs[0] = 0 if out is None else len(out)
    return out


cetz.label_lines = spy_labels


def direction(val):
    """What the label's position slot says: a side word, an angle, a compass point, or something else."""
    spec = str(val).strip()
    if spec.startswith("{") or spec.startswith("["):
        spec = re.sub(r"^\[[^\]]*\]", "", spec.lstrip("{")).strip()
    m = re.match(r"^([A-Za-z ]+?)\s*:", spec)
    if m:
        return m.group(1).strip().lower()
    m = re.match(r"^(-?[\d.]+)\s*:", spec)
    if m:
        return "angle %s" % m.group(1)
    return "(no position: %s)" % spec[:28]


def wrapped_values(val):
    # `opts()` accumulates this key since #41 (two `label=` on one node are two nodes in TeX), so the
    # census reads a list today and a bare string in the ledger's original numbers. Count the NODE,
    # which is what 388 means in §7, and report the extra hangings as their own line.
    if val is None:
        return []
    return val if isinstance(val, list) else [val]


def wrap(at, inner, o, pal=None, box=None, angle=0.0, width=None, extent=(None, None),
         pad=cetz.INNER_SEP):
    def call():
        return _orig(at, inner, o, pal, box, angle, width, extent, pad)

    vals = wrapped_values(o.get("label"))
    if not vals and any(k in o for k in ("pin", "pin edge", "pins")):
        vals, klass = [o.get("pin")], "pin instead of label"
    elif not vals:
        return call()
    elif not cetz.node_text(inner, pal):
        klass = "empty node text"
    else:
        klass = "node has own text"
    d = STATS[klass]
    d["nodes"] += 1
    d["pics"].add(current[0])
    d["papers"].add(current[0][0])
    VALS[klass] += len(vals)
    for val in vals:
        SPELL[direction(val)] += 1
    if o.get("circle") is True or o.get("ellipse") is True:
        d["shaped"] += 1
    if len(d["samples"]) < 14:
        d["samples"].append((current[0][0][:42], "%s | own=%s"
                             % (str(vals[0])[:70], (cetz.node_text(inner, pal) or "")[:24])))
    hangs[0] = 0
    built = call()
    # the census doubles as the post-fix check: a counted label must come back as a hanging line from
    # `label_lines` itself. Reading the built canvas for `anchor: "` would also count the anchors #37
    # puts on a node's own body, so this asks the drawing function how many lines it laid down.
    if built is None:
        SHORT["refused picture | %s" % str(vals[0])[:40]] += 1
    elif hangs[0] < len(vals):
        SHORT["drew %d of %d | %s" % (hangs[0], len(vals), str(vals[0])[:40])] += 1
    return built


cetz.emit_node = wrap
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = path.read_text(encoding="utf-8", errors="replace")
    for n, pic in enumerate(PIC.findall(text)):
        current[0] = (path.stem, n)
        cetz.build(pic)
cetz.emit_node = _orig

print("== nodes seen by emit_node, over every picture that builds")
print("%-24s %7s %7s %7s %7s %7s" % ("class", "nodes", "hangs", "pics", "papers", "shaped"))
union_p, union_c = set(), set()
for key in CLASSES:
    d = STATS[key]
    print("%-24s %7d %7d %7d %7d %7d"
          % (key, d["nodes"], VALS[key], len(d["pics"]), len(d["papers"]), d["shaped"]))
    union_p |= d["papers"]
    union_c |= d["pics"]
# the per-class paper counts must not be added up: one paper can carry both an annotated dot and a
# framed node with a side label, and the sum would then outrank the churn diff it is compared with.
print("%-24s %7s %7d %7d %7d" % ("union", "", sum(VALS.values()), len(union_c), len(union_p)))
print("\n== labels counted on a node but not drawn on the page: %d" % sum(SHORT.values()))
for key, n in SHORT.most_common(8):
    print("   %4d  %s" % (n, key))
print("\n== what the position slot says (the parser's own value string)")
for val, n in SPELL.most_common():
    print("   %-22s %d" % (val, n))

# `opts()` is last-wins, so a node that writes two labels loses one before emit_node ever sees
# the second. That cannot be read off the option table, so it is counted on the source -- and it is
# reported as a spelling inventory, not as the size of the affected face.
NODE_OPTS = re.compile(r"\\node\s*(?:\([^)]*\))?\s*\[([^\]]*)\]")
multi = Counter()
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = path.read_text(encoding="utf-8", errors="replace")
    for group in NODE_OPTS.findall(text):
        n = len(re.findall(r"(?:^|,)\s*label\s*=", group))
        if n > 1:
            multi[n] += 1
print("\n== nodes writing more than one label key (source spelling count): %s" % dict(multi))

for key in CLASSES:
    print("\n-- %s" % key)
    for stem, val in STATS[key]["samples"]:
        print("   %-44s %s" % (stem, val))
