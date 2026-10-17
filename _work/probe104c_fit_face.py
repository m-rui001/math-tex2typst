r"""#104c: how big is the `fit=` face, and what does the emitter do with it today?

The Blockwise-Alperin canvas (run152 on-ink rows 4.56 and 3.36) is not a two-label collision: the
whole flowchart is stacked on top of itself, because `\node[fit=(genus)(lift)] (branches) {}` names a
box we never build, and `below=10mm of branches` then places the next node at a point.

This counts the corpus face for that shape: statements carrying `fit=`, the canvases and papers that
carry them, and separately the statements that place something `... of <fit node>` -- the consumer
that turns a missing box into a wrong placement.
"""
import glob
import io
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
PIC = re.compile(r"\\begin\{tikzpicture\}.*?\\end\{tikzpicture\}", re.S)
FIT = re.compile(r"fit\s*=\s*\(([^)]*)\)")
OF = re.compile(r"(above|below|left|right|above right|below right|above left|below left)"
                r"(?:\s*=\s*[^,]*?)?\s+of\s*\s*([A-Za-z0-9_\-]+)")
NODE = re.compile(r"\\node\s*(?:\[[^\]]*\])?\s*\(?([A-Za-z0-9_\-]*)\)?")


def node_name(stmt):
    r"""The name a `\node` statement gives itself: the first `(...)` after its option bracket.

    `fit=(genus)(lift)` is inside the bracket, so reading the first paren group of the whole
    statement names one of the fitted nodes instead of the new one.
    """
    start = stmt.find("[")
    if start < 0:
        rest = stmt
    else:
        depth, i = 0, start
        while i < len(stmt):
            if stmt[i] == "[":
                depth += 1
            elif stmt[i] == "]":
                depth -= 1
                if depth == 0:
                    break
            i += 1
        rest = stmt[i + 1:]
    m = re.match(r"\s*(?:at\s*\([^)]*\)\s*)?\(\s*([A-Za-z0-9_\-]+)\s*\)", rest)
    return m.group(1) if m else ""


def main():
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    files = sorted(glob.glob(os.path.join(ROOT, "_work", "flat", "*.tex")))
    stmt_rows, hit_canv = [], set()
    consumers = []
    for path in files:
        stem = os.path.basename(path)[:-4]
        text = io.open(path, encoding="utf-8", errors="replace").read()
        for k, m in enumerate(PIC.finditer(text)):
            body = m.group(0)
            fitted = set()
            for s in re.split(r";\s*\n|;\s*(?=\\)", body):
                fm = FIT.search(s)
                if not fm:
                    continue
                hit_canv.add((stem, k))
                label = node_name(s)
                fitted.add(label)
                stmt_rows.append((stem[:44], k, label, fm.group(1)[:40], s.strip()[:120]))
            if fitted:
                for s in re.split(r";\s*\n|;\s*(?=\\)", body):
                    for om in OF.finditer(s):
                        if om.group(2) in fitted:
                            consumers.append((stem[:44], k, om.group(0)[:60]))
    print("flat pictures scanned in %d papers" % len(files))
    print("fit= statements: %d over %d canvases / %d papers"
          % (len(stmt_rows), len(hit_canv), len({s for s, _ in hit_canv})))
    print("placement statements that consume a fit node: %d over %d canvases"
          % (len(consumers), len({(c[0], c[1]) for c in consumers})))
    print("\n-- fit= statements (first 40) --")
    for r in stmt_rows[:40]:
        print("  %s#%d  name=%-14s fit=(%s)" % (r[0], r[1], r[2] or "-", r[3]))
    print("\n-- consumers (first 40) --")
    for c in consumers[:40]:
        print("  %s#%d  %s" % (c[0], c[1], c[2]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
