r"""Which nodes spell their padding one axis at a time, and what the emitter now prints for them.

`inner xsep` / `inner ysep` are pgf's per-axis spelling of the gap #46 spends on the box: 16 + 11
declarations over 11 papers, none of which the converter used to read. This asks the emitter, over every
picture that builds, for the shape of each node's padding keys -- general only, one axis, both axes, or a
mix of the two spellings (which pdflatex says is executed in written order, `_work/measure_tex_inset_axes.py`)
-- together with the `inset:` string it hands Typst. The mixed rows are the ones to distrust: the option
table is built by key, so a style that carries an axis key and a node that later carries the general one
is the one order this cannot see.
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
FACE = {"dict": set(), "papers": set(), "mixed": []}
_orig = cetz.node_inset


def wrap(o):
    answer = _orig(o)
    keys = tuple(sorted(k for k in o if k in cetz.PADDING_KEYS))
    axes = tuple(k for k in keys if k != "inner sep")
    if keys:
        STATS[keys] += 1
    if answer.startswith("("):
        FACE["dict"].add(current[0])
        FACE["papers"].add(current[0][0])
        if axes and "inner sep" in keys and len(FACE["mixed"]) < 12:
            FACE["mixed"].append("%s pic%d %r -> %s" % (current[0][0][:38], current[0][1],
                                                         {k: o[k] for k in keys}, answer))
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
print("== declared padding keys per framed node")
for keys, n in sorted(STATS.items(), key=lambda kv: -kv[1]):
    print("  %-34s %6d" % (",".join(keys), n))
print("\nnodes whose inset is a per-axis dictionary: %d canvases / %d papers"
      % (len(FACE["dict"]), len(FACE["papers"])))
for stem, index in sorted(FACE["dict"]):
    print("  canvas> %-70s pic%d" % (stem, index))
for line in FACE["mixed"]:
    print("  mixed> %s" % line)
