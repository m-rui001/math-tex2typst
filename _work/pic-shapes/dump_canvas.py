r"""Print the built canvas (and sane verdict) for each owned picture under a chosen t2t tree.

Diagnostics only: the raw-vs-canvas count from count_raw.py says whether a picture is quoted,
not whether the node text it emits is right. Thompsons' multi-line `text width` legend is the
case where a canvas can build yet carry wrong text, so dump the lines and read them.

Usage: python dump_canvas.py <t2t-parent-dir> <paper-glob> <pic-index>
"""
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / sys.argv[1].replace("\\", "/")))
from t2t import cetz, convert, prep  # noqa: E402

pattern = sys.argv[2]
idx = int(sys.argv[3])
path = next((ROOT / "_work" / "flat").glob(pattern + "*.tex"))
src = path.read_text(encoding="utf-8", errors="replace")
pre, _ = prep.split_document(src)
p = prep.parse_preamble(pre)
cm = convert.line_cm(p)
core = cetz.MATH_ENVELOPE.sub("", src)
pics = re.findall(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", core, re.S)
pic = pics[idx]
canvas = cetz.build(cetz.expand_linewidth(pic, cm), p.colors)
print("sane:", None if canvas is None else cetz.sane(canvas))
if canvas is None:
    print("BUILD -> None (refused)")
else:
    for line in canvas.splitlines():
        print(repr(line))
