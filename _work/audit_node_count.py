"""Pictures that draw while dropping one of the author's nodes.

A canvas that compiles is not a canvas that is complete: a statement which returns no line
leaves the figure short and the gate cannot see it. Count the node statements the parser was
given, count the boxes the canvas draws, and list the papers where the two disagree.
"""
import pathlib
import re
import sys

sys.path.insert(0, str(pathlib.Path("tools").resolve()))
from t2t import cetz  # noqa: E402

ENV = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
# a node that labels an arrow is part of the line, not a box of its own
OWN_NODE = re.compile(r"(?:^|--|;)\s*\\node\b")

rows = []
drawn = 0
for path in sorted(pathlib.Path("_work", "flat").glob("*.tex")):
    src = path.read_text(encoding="utf-8", errors="replace")
    for pic in ENV.findall(src):
        core = cetz.MATH_ENVELOPE.sub("", pic)
        canvas = cetz.build(core)
        if not canvas:
            continue
        drawn += 1
        m = re.match(r"\\begin\{tikzpicture\}", core)
        body = core[m.end():].lstrip()
        head, pos = cetz._opts_at(body, 0)
        if head is None:
            continue
        base = cetz._transform(head)
        if base is None:
            continue
        body = cetz.expand_foreach(body[pos:])
        if body is None:
            continue
        body = body[:body.rfind("\\end{tikzpicture}")]
        cols = cetz._colors(body)
        if cols is None or cetz.UNSUPPORTED.search(cols[1]):
            continue
        pal, cleaned = cols
        placed = cetz.scoped(cleaned, base)
        if placed is None:
            continue
        nodes = sum(1 for stmt, _ in placed if OWN_NODE.match(stmt.strip()))
        boxes = canvas.count("content(")
        if nodes > boxes:
            rows.append((nodes - boxes, path.stem, nodes, boxes))

rows.sort(reverse=True)
print({"drawn pictures": drawn, "pictures missing a node": len(rows)})
for gap, stem, nodes, boxes in rows[:15]:
    print("  -%d  %-58s nodes=%d boxes=%d" % (gap, stem[:58], nodes, boxes))
