r"""Full JSON of the float blocks that carry the corpus multi-labels.

The corpus has two shapes: a table float split into Div>Table nodes whose name pandoc puts on the
wrapper, and a figure float with two \labels where the AST shows only one name at all. Print both
verbatim so the fix is aimed at the right stage rather than at a guess.
"""
import io
import json
import os
import subprocess
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(ROOT, "_work", "_probe_labels")

A = os.path.join(WORK, "A-boundary-field-gap-for-the-s.tex")
P = os.path.join(WORK, "Positive-scalar-curvature-and-.tex")


def blocks(path):
    if not os.path.isfile(path):
        return []
    js = path[:-4] + ".json"
    if not os.path.isfile(js):
        subprocess.run([os.environ.get("PANDOC", "pandoc"), path, "-f", "latex", "-t", "json",
                        "-o", js], capture_output=True, text=True, encoding="utf-8")
    return json.load(open(js, encoding="utf-8"))["blocks"]


def flatten(node, into):
    into.append(json.dumps(node, ensure_ascii=False))
    return into


def show(path, pred, title, limit=6, width=1400):
    print("=" * 90)
    print(title)
    for i, node in enumerate(blocks(path)):
        if pred(node):
            print("--- block %d %s" % (i, node["t"]))
            print(json.dumps(node, ensure_ascii=False)[:width])
            limit -= 1
            if limit <= 0:
                return


def text_of(node):
    return json.dumps(node, ensure_ascii=False)


show(A, lambda n: "entry-table" in text_of(n) or "coupling-table" in text_of(n)
     or "endpoint-table" in text_of(n), "A-boundary: Div wrappers holding the appendix tables", 4, 900)
show(P, lambda n: "collar-figure" in text_of(n) or "two maps used" in text_of(n)
     or "topology" in text_of(n), "Positive-scalar: the two-label figure float", 4, 2600)

print("=" * 90)
print("Positive-scalar: every top-level block mentioning packet or topology")
for i, node in enumerate(blocks(P)):
    t = text_of(node)
    if "packet" in t or "topology" in t:
        print("block %d %s :: %s" % (i, node["t"], t[:220]))
