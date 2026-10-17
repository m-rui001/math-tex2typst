r"""The real pipeline's AST for the two measured floats.

convert_paper(keep_work=True) leaves the pandoc JSON beside the flat source in _work_tex, so this
reads the same AST the emitter saw: the block that carries the figure's second \label, the table
floats split into Div>Table pairs, and every Link that names a label of either float.
"""
import io
import json
import os
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import convert  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
OUT = os.path.join(ROOT, "_work", "_probe_labels")
WORKTEX = os.path.join(FLAT, "_work_tex")

PAPERS = [
    "A-boundary-field-gap-for-the-spin-one-Heisenberg-chain-September-24-2026",
    "Positive-scalar-curvature-and-uniform-codimension-two-width-September-23-2026",
]
NEEDLES = ["apptr:entry-table", "apptr:endpoint-table", "apptr:coupling-table",
           "fig:topology-compression", "packet:collar-figure"]


def idents(node, depth=0, into=None):
    into = [] if into is None else into
    if isinstance(node, dict):
        t = node.get("t")
        if t in ("Figure", "Table", "Div", "Span", "Link"):
            c = node.get("c")
            first = c[0] if isinstance(c, list) else None
            into.append((depth, t, json.dumps(first, ensure_ascii=False)[:120]))
        for v in node.values():
            idents(v, depth + 1, into)
    elif isinstance(node, list):
        for v in node:
            idents(v, depth, into)
    return into


for paper in PAPERS:
    out_dir = os.path.join(OUT, paper[:40])
    os.makedirs(out_dir, exist_ok=True)
    res = convert.convert_paper(os.path.join(FLAT, paper + ".tex"), out_dir, paper, keep_work=True)
    print("=" * 90)
    print(paper, "ok=%s tables=%s figures=%s stats=%s" %
          (res.get("ok"), res.get("tables"), res.get("figures"), res.get("stats")))
    js = os.path.join(WORKTEX, paper + ".json")
    if not os.path.isfile(js):
        print("no json at", js)
        continue
    blocks = json.load(open(js, encoding="utf-8"))["blocks"]
    for i, node in enumerate(blocks):
        text = json.dumps(node, ensure_ascii=False)
        hits = [n for n in NEEDLES if n in text]
        if not hits:
            continue
        kind = node["t"]
        nested = [h for h in hits if kind in ("Figure", "Table", "Div") and
                  ("label" + h) not in text]
        print("--- block %d %s mentions %s" % (i, kind, hits))
        if kind in ("Figure", "Table", "Div"):
            for depth, t, ident in idents(node)[:12]:
                print("      %s%s %s" % ("  " * depth, t, ident))
        else:
            print("      " + text[:300])
    typ = open(os.path.join(out_dir, "main.typ"), encoding="utf-8", errors="replace").read()
    for needle in NEEDLES:
        if needle in typ:
            i = typ.find(needle)
            print("typ %s -> %r" % (needle, typ[max(0, i - 60):i + 40]))
