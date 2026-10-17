"""Append the family sandboxes' tests into tools/test_t2t.py's ConversionTests.

Each writer delivered `tests.py` in whatever shape suits a sandbox: some are already methods, some
are module-level functions runnable standalone. Both shapes assert pdflatex's own numbers, so the
mechanical difference (indent and a `self` parameter) is the only thing to normalise here.
"""
import ast
import os
import textwrap

LIVE = os.path.join("tools", "test_t2t.py")
SOURCES = ["pic-3d", "pic-scoped", "pic-pgfmath", "pic-plot", "pic-shapes", "pic-authmacros"]
ANCHOR = "\n\nif __name__ == '__main__':"


def functions(sb):
    path = os.path.join("_work", sb, "tests.py")
    raw = open(path, encoding="utf-8").read().splitlines()
    try:
        lines = raw
        tree = ast.parse("\n".join(raw))
    except IndentationError:
        # a fragment delivered with the class indentation already on it: keep that indentation and
        # give the parser a class to hang the methods from, dropping the writer's own header
        start = next(i for i, ln in enumerate(raw) if ln.strip().startswith("def test"))
        lines = ["class _Fragment:"] + raw[start:]
        tree = ast.parse("\n".join(lines))
    nodes = []
    for node in tree.body:
        if isinstance(node, ast.ClassDef):
            nodes.extend(s for s in node.body if isinstance(s, ast.FunctionDef))
        elif isinstance(node, ast.FunctionDef):
            nodes.append(node)
    blocks = []
    for node in nodes:
        if not node.name.startswith("test"):
            continue
        body = textwrap.dedent("\n".join(lines[node.lineno - 1:node.end_lineno])).split("\n")
        head = body[0]
        if not head.rstrip(":").endswith("(self)") and "(self, " not in head:
            head = head.replace("def %s()" % node.name, "def %s(self)" % node.name, 1)
        merged = "\n".join([head] + body[1:])
        blocks.append((node.name, "    " + merged.replace("\n", "\n    ")))
    return blocks


def main():
    text = open(LIVE, encoding="utf-8").read()
    if "\nimport re\n" not in text:
        text = text.replace("\nimport unittest\n", "\nimport re\nimport unittest\n", 1)
    seen = {}
    blocks = []
    for sb in SOURCES:
        for name, body in functions(sb):
            if name in seen:
                raise SystemExit("duplicate test name %s in %s and %s" % (name, seen[name], sb))
            seen[name] = sb
            blocks.append("    # from _work/%s/tests.py\n%s" % (sb, body))
    if ANCHOR not in text:
        raise SystemExit("anchor not found in %s" % LIVE)
    text = text.replace(ANCHOR, "\n" + "\n".join(blocks) + ANCHOR, 1)
    open(LIVE, "w", encoding="utf-8", newline="\n").write(text)
    print("appended %d test methods: %s" % (len(blocks), ", ".join("%s %d" % (s, sum(1 for n in seen if seen[n] == s)) for s in SOURCES)))


if __name__ == "__main__":
    main()
