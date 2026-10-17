r"""When a real picture carries an empty-content node, does the dot survive into the canvas?

`_work/probe_empty_node_yield.py` says none of the 108 such pictures refuses -- but a canvas that
builds is not a canvas that draws. A `\node[circle,draw,inner sep=1pt] (v) at (0,0) {};` is a bare
vertex in a graph figure: if the statement is swallowed silently the vertex is gone while every edge
still ends at its name, which is worse than a refusal because nothing reports it. Prints, for the
first few real pictures with an empty node, the statements the converter dropped.
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
STMT = re.compile(r"\\(?:node|path|draw|fill|filldraw|shade|clip)\b[^;]*;", re.S)

shown = 0
dropped = kept = 0
for path in sorted((ROOT / "_work" / "flat").glob("*.tex")):
    text = path.read_text(encoding="utf-8", errors="replace")
    for pic in PIC.findall(text):
        hits = EMPTY.findall(pic)
        if not hits:
            continue
        built = cetz.build(pic)
        if built is None:
            continue
        body = "\n".join(built)
        # a drawn vertex must leave a circle behind: either a `frame: "circle"` or a `circle(` call
        marks = body.count('frame: "circle"') + len(re.findall(r"\bcircle\(", body))
        if marks < len(hits):
            dropped += 1
            if shown < 3:
                shown += 1
                print("== %s" % path.stem[:58])
                for stmt in STMT.findall(pic):
                    if EMPTY.match(stmt.strip() + ";"):
                        print("   empty node: %s" % stmt.strip().replace("\n", " ")[:90])
                print("   empty nodes %d, circle marks %d" % (len(hits), marks))
        else:
            kept += 1
print("pictures: circle marks cover the empty nodes in %d, short in %d" % (kept, dropped))
