r"""Why a `block`-styled node's text sits at the left of its declared box.

The Kurosh control (`_work/latex_kurosh2.png`) centres `$j$` inside a 12mm x 6.5mm rounded box; the
product (`_work/shot_A-Counterexample-to-Kuro_p36.png`) puts the same letter on the box's left border.
The width is declared in a style table (`block/.style={rectangle, minimum width=12mm, minimum
height=6.5mm, inner sep=3pt}`), so the first question is what the canvas actually says for that node:
which of `width:` / `#align(center)` / `inset:` reached the line, and whether the style keys arrive at
`node_frame_width` at all. Prints the node lines verbatim.
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
src = (ROOT / "_work" / "flat" /
       "A-Counterexample-to-Kuroshs-Division-Ring-Problem-September-23-2026.tex").read_text(
    encoding="utf-8", errors="replace")
pic = PIC.findall(src)[2]
canvas = cetz.build(pic)
for line in canvas.splitlines():
    if "content(" in line or "cetz.canvas" in line:
        print(line.strip()[:170])

print("\n-- what the option table of a `block` node holds --")
core = cetz.MATH_ENVELOPE.sub("", pic)
stmt = core.replace("\n", " ")
for m in re.finditer(r"\\node\[block\][^;]*;", stmt):
    o = cetz.opts("block")
    print("opts(block) =", {k: v for k, v in o.items() if "width" in k or "height" in k
                            or "sep" in k or k in ("rectangle", "rounded corners")})
    node = m.group(0)
    keys = re.findall(r"minimum (?:width|height)=[^,\]}]*", node)
    print("in statement:", keys or "(none -- the measure lives in the style)")
    break

print("\n-- does the style table reach node_frame_width? --")
styles = cetz.picture_styles(core)
one = None
for name, val in styles.items():
    if name == "block":
        one = val
print("styles['block'] =", one)
o = cetz.opts("block")
print("node_frame_width(opts('block')) =", cetz.node_frame_width(o, {}))
print("node_size(opts('block'), {}) =", cetz.node_size(o, "{}"))
