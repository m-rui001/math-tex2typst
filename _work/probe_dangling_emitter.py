# Same question, whitespace honestly normalized: for each surviving dangling ref, is the float's
# caption text present in the generated Typst, and which name did the float actually get?
import io
import json
import os
import re
import sys

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

CASES = [
    ("The-Kervaire-Invariant-Problem-at-the-Prime-Three-September-24-2026", "finite:enclosures"),
    ("Positive-scalar-curvature-and-uniform-codimension-two-width-September-23-2026", "fig:topology-compression"),
    ("A-boundary-field-gap-for-the-spin-one-Heisenberg-chain-September-24-2026", "apptr:coupling-table"),
]


def norm(text):
    return " ".join(text.split())


for paper, key in CASES:
    flat = norm(open(os.path.join(ROOT, "_work", "flat", paper + ".tex"), encoding="utf-8", errors="replace").read())
    typ = norm(open(os.path.join(ROOT, "typst", paper, "main.typ"), encoding="utf-8", errors="replace").read())
    print("==== %s  [%s]" % (paper[:56], key))
    i = flat.find("\\label{%s}" % key)
    cap = flat.rfind("\\caption{", 0, i)
    depth = 0
    end = cap
    for j in range(cap + len("\\caption{"), len(flat)):
        if flat[j] == "{":
            depth += 1
        elif flat[j] == "}":
            if not depth:
                end = j
                break
            depth -= 1
    text = flat[cap + len("\\caption{") + 1:end].strip()
    probe = text[:60]
    print("   caption in flat : %s" % probe)
    print("   caption in typst: %s" % (probe in typ))
    if probe in typ:
        k = typ.index(probe)
        print("   emitted around: ...%s" % typ[max(0, k - 200):k + len(probe) + 40][-260:])
    names = re.findall(r"<([A-Za-z0-9:_.-]+)>", typ[max(0, typ.index(probe) - 400):typ.index(probe) + 400]) if probe in typ else []
    print("   labels near it: %s ; this key emitted: %s" % (names, '<%s>' % key in typ))
