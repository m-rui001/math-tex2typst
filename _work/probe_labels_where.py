r"""Where did the A-boundary appendix tables go, and what does the Positive figure hold?

Dumps the generated main.typ region for both measured papers plus the pandoc JSON shape of a
two-label figure, so the fix can be aimed at the stage that actually loses the name.
"""
import io
import json
import os
import re
import subprocess
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TYPST = os.path.join(ROOT, "typst")

A = "A-boundary-field-gap-for-the-spin-one-Heisenberg-chain-September-24-2026"
P = "Positive-scalar-curvature-and-uniform-codimension-two-width-September-23-2026"

for stem, keys in ((A, ["apptr:", "Every allowed entry", "All fifteen"]),
                   (P, ["packet:collar-figure", "topology-compression"])):
    path = os.path.join(TYPST, stem, "main.typ")
    typ = open(path, encoding="utf-8", errors="replace").read()
    print("=" * 80)
    print(stem, "lines", typ.count("\n"))
    report = os.path.join(TYPST, stem, "report.json")
    if os.path.isfile(report):
        rep = json.loads(open(report, encoding="utf-8").read())
        print("tables=%s figures=%s labels=%s compile_ok=%s" %
              (rep.get("tables"), rep.get("figures"), rep.get("labels"), rep.get("compile_ok")))
        print("stats:", {k: v for k, v in rep.get("stats", {}).items()
                         if k in ("dangling_ref", "unhandled_block:Figure", "unhandled_rawblock")})
        print("samples:", {k: v for k, v in rep.get("samples", {}).items() if k == "dangling_ref"})
    for key in keys:
        i = typ.find(key)
        print("--- %-24s %s" % (key, "found at %d" % i if i >= 0 else "NOT PRESENT"))
        if i >= 0:
            print(typ[max(0, i - 200):i + 200])
