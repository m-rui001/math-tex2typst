r"""How many node statements in the corpus place themselves with an option group AFTER the name?

`\node (b) [right=of a] {text};` is TikZ's other legal spelling of a placement -- the group may stand
before the name or after it.  `_node_at` is handed what follows the name and only ever reads `at`, so
a group written after the name is not read at all: the node lands on the scope origin, and the picture
draws as a stack of boxes on one point.  The two columns separate the shapes: a group that carries a
placement (`=of`, a direction word) against a plain `at (x,y)` written after the group.
"""
import glob
import io
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")

STMT = re.compile(r"\\(?:node|coordinate)\s*(?:\{[^{}]*\})?\s*\(\s*[-\w]+\s*\)\s*\[([^\]]*)\]")
DIRECTION = re.compile(r"\b(above|below|left|right|top|bottom|center)\b")

papers = {}
for path in glob.glob(os.path.join(r"E:\math", "_work", "flat", "*.tex")):
    text = open(path, encoding="utf-8", errors="replace").read()
    for m in STMT.finditer(text):
        inner = m.group(1)
        if inner.startswith("at"):
            continue
        kind = "placement" if (DIRECTION.search(inner) or "\\bof\\b" in inner or "=" in inner) else "style"
        papers.setdefault(os.path.basename(path)[:-4], []).append(kind)

total = sum(len(v) for v in papers.values())
place = sum(v.count("placement") for v in papers.values())
print("papers=%d statements=%d placement-bearing=%d style-only=%d"
      % (len(papers), total, place, total - place))
for name, kinds in sorted(papers.items(), key=lambda kv: -len(kv[1]))[:12]:
    print("  %-64s %d stmts (%d placement)" % (name[:64], len(kinds), kinds.count("placement")))
