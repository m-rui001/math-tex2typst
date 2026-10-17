r"""Print the whole CeTz canvas one owned picture builds, with the paper's own colours and linewidth.

Read by name so a picture is seen exactly as the batch would see it; `build` is called rather than
`convert` because the compile gate would spend the typst binary this task may not touch.
"""
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "_work" / "pic-shapes"))
from t2t import cetz, convert, prep  # noqa: E402

key = sys.argv[1]
idx = int(sys.argv[2]) if len(sys.argv) > 2 else 0
NAMES = {
    "ellipse": "Elliptic-capacity-propagation-and-Fourier-restriction",
    "loop": "Translative-covering-densities-of-order-n-log-n",
    "node": "Thompsons-group-F-is-nonamenable",
}
path = next((ROOT / "_work" / "flat").glob(NAMES[key] + "*.tex"))
src = path.read_text(encoding="utf-8", errors="replace")
pre, _ = prep.split_document(src)
p = prep.parse_preamble(pre)
core = cetz.MATH_ENVELOPE.sub("", src)
pics = re.findall(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", core, re.S)
pic = cetz.expand_linewidth(pics[idx], convert.line_cm(p))
canvas = cetz.build(pic, p.colors)
print("%s#%d -> %s" % (path.name, idx, "canvas" if canvas else "REFUSED"))
print(canvas if canvas else "raw block stays quoted verbatim")
