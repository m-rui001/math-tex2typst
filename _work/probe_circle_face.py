r"""Which spelling each shaped node needs: the face split by what the AUTHOR wrote down.

`_work/measure_shaped_node_frame.py` gives the law -- a `circle` is square, its radius is
max(declared/2, half-diagonal of the padded text box), and a single `minimum width` sizes both axes.
The emitter has two ways to make a circle and they are not interchangeable: the range form
(`content((x1,y1),(x2,y2), frame: "circle")`) paints the circumscribed circle of a box we sized, while
the point form (`content((x,y), [text], frame: "circle", padding: sep)`) lets Typst measure the words.
The first needs the author to have written a measure; the second needs him not to have.

This asks the converter, over every picture that builds: for each node carrying a shape word, print
(text? declared measure?) crossed with the branch that currently draws it. The counts are the face a
fix has to cover, and the `radius: 0.05` column says how many empty dots carry a measure we ignore.
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
SHAPES = ("circle", "ellipse", "rectangle", "rect", "diamond", "trapezium", "semicircle",
          "regular polygon", "star", "asterisk", "signal", "drop", "cylinder")
MEASURE_KEYS = ("minimum width", "minimum height", "minimum size", "text width", "text height",
                "inner sep", "outer sep")

current = [None]
STATS = Counter()
FACE = {"nodes": 0, "pics": set(), "papers": set()}
_orig = cetz.emit_node


def shape_of(o):
    val = o.get("shape")
    if isinstance(val, str) and val.strip():
        return val.strip()
    for name in SHAPES:
        if name in o:
            return name
    return None


def branch(box, text, o):
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
    name = shape_of(o)
    if name:
        keys = tuple(sorted(k for k in o if k in MEASURE_KEYS))
        STATS[(name, branch(box, text, o), keys)] += 1
        if name == "circle":
            FACE["nodes"] += 1
            FACE["pics"].add(current[0])
            FACE["papers"].add(current[0][0])
    return _orig(at, inner, o, pal, box, angle, width, extent, pad)


cetz.emit_node = wrap
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    src = path.read_text(encoding="utf-8", errors="replace")
    for n, pic in enumerate(PIC.findall(src)):
        current[0] = (path.stem, n)
        cetz.build(pic)
cetz.emit_node = _orig

print("== shape x branch x declared-measure-keys (nodes)")
for (name, key, keys), n in sorted(STATS.items(),
                                   key=lambda kv: (kv[0][0] != "circle", -kv[1])):
    print("%-10s %-7s %-9s %6d" % (name, key, ",".join(keys) or "-", n))
print("\ncircle nodes total: %d over %d pics / %d papers"
      % (FACE["nodes"], len(FACE["pics"]), len(FACE["papers"])))
