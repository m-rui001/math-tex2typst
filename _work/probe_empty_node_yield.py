r"""How many pictures carry a node with nothing in it -- the shape that makes the whole canvas refuse.

`_work/probe_empty_node.py` shows the mechanism: `\node[draw,circle] (v) {};` builds to `None`, and a
`None` is the whole picture, not one statement -- so a single empty vertex node loses every other
element of that figure. Empty nodes are how graph figures draw a bare vertex, so the question is how
wide the face is. Counted structurally on the flat sources (a candidate list, not a verdict: a picture
may also be refused for another reason, or never reach the page).
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
EMPTY = re.compile(r"\\node\b[^;{}]*(?:\[[^\]]*\])[^;]*\{\s*\}\s*;")

pics_with = pics_refused = 0
papers = set()
refused_papers = set()
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = path.read_text(encoding="utf-8", errors="replace")
    for pic in PIC.findall(text):
        if not EMPTY.search(pic):
            continue
        pics_with += 1
        papers.add(path.stem)
        if cetz.build(pic) is None:
            pics_refused += 1
            refused_papers.add(path.stem)
print("pictures with an empty-content node: %d over %d papers" % (pics_with, len(papers)))
print("of those, the canvas refuses to build: %d over %d papers" % (pics_refused, len(refused_papers)))
for stem in sorted(refused_papers)[:8]:
    print("   %s" % stem[:62])
