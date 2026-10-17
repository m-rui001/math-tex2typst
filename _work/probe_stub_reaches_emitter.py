r"""Does patching `cetz.node_shape` actually change what `build` returns?

`_work/probe_gained_canvas.py` replayed the corpus with the pre-#40 rule and reported **0** changed
canvases, while the all-rect stub of the same function reported 138 -- the two cannot both be true
unless the patch does not reach the emitter. This asks the question about one picture (the Kurosh
cycle, whose `vertex/.style={circle,…}` nodes are the case #40 is about): build it live, under
`node_shape -> "rect"`, and under the bare-key-only rule, print the lengths and the first differing
line, and show where the function is looked up from.
"""
import io
import pathlib
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from t2t import cetz  # noqa: E402

PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
LIVE = cetz.node_shape
src = (ROOT / "_work" / "flat" /
       "A-Counterexample-to-Kuroshs-Division-Ring-Problem-September-23-2026.tex").read_text(
    encoding="utf-8", errors="replace")
pic = PIC.findall(src)[2]


def with_rule(rule):
    cetz.node_shape = rule
    try:
        return cetz.build(pic)
    finally:
        cetz.node_shape = LIVE


runs = {"live": with_rule(LIVE),
        "rect": with_rule(lambda o: "rect"),
        "bare": with_rule(lambda o: "circle" if o.get("circle") is True else "rect")}
for name, got in runs.items():
    print("%-5s %s chars" % (name, len(got) if got else "None"))
for a, b in (("live", "rect"), ("live", "bare")):
    if runs[a] and runs[b]:
        diff = [(x, y) for x, y in zip(runs[a].splitlines(), runs[b].splitlines()) if x != y]
        print("%s vs %s: %d differing lines%s" % (a, b, len(diff),
              "\n   + %s\n   - %s" % (diff[0][0].strip()[:120], diff[0][1].strip()[:120])
              if diff else ""))

print("\n-- who calls node_shape --")
for path in [ROOT / "tools" / "t2t" / "cetz.py"]:
    for n, line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
        if "node_shape" in line:
            print("%5d  %s" % (n, line.strip()[:100]))
