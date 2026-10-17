"""What AST node a source label arrives in.

Registration can only be fixed where the label is actually visible: a Div identifier, a
raw inline inside a paragraph, or text that never reaches the tree at all.

Run: python _work/probe_label_nodes.py <json-ast> <label> [<label> ...]
"""
import json
import pathlib
import sys

path = pathlib.Path(sys.argv[1])
targets = sys.argv[2:]
ast = json.loads(path.read_text(encoding="utf-8"))
found = {t: [] for t in targets}


def walk(node, trail):
    if isinstance(node, dict):
        text = json.dumps(node, ensure_ascii=False)
        for t in targets:
            if t in text and len(trail) < 999:
                pass
        for key, value in node.items():
            if key in ("t", "c"):
                walk(value, trail)
            else:
                walk(value, trail)
    elif isinstance(node, list):
        if node and isinstance(node[0], str):
            for t in targets:
                if t in json.dumps(node, ensure_ascii=False):
                    found[t].append((node[0], json.dumps(node)[:150]))
        for item in node:
            walk(item, trail)


walk(ast["blocks"], [])
for t in targets:
    print("== %s" % t)
    seen = set()
    for kind, snippet in found[t]:
        if kind in seen:
            continue
        seen.add(kind)
        print("   %-12s %s" % (kind, snippet[:130]))
    if not seen:
        print("   (not in the AST)")
