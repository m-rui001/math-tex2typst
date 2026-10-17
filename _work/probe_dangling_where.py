# For each surviving dangling ref, where does its label actually live?
#   nowhere            -> the source itself has an unresolved reference; [??] is faithful
#   only in a file that never reached the flat source -> still a flattening gap
#   in the flat source -> the emitter is dropping or mis-binding the anchor
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CASES = [
    ("The-Kervaire-Invariant-Problem-at-the-Prime-2", "finite:enclosures"),
    ("Positive-scalar-curvature-and-uniform-codimension", "fig:topology-compression"),
    ("Exact-asymptotic-moduli-in-a-Daugavet-subspace", "fig:moduli"),
    ("A-boundary-field-gap-for-the-spin-one-Heisenberg-model", "apptr:coupling-table"),
]
LABEL = re.compile(r"\\(?:label|newlabel)\s*\{([^{}]+)\}")


def find_dir(prefix):
    for name in os.listdir(os.path.join(ROOT, "preprints")):
        if name.startswith(prefix) and os.path.isdir(os.path.join(ROOT, "preprints", name)):
            return name
    return None


for prefix, key in CASES:
    paper = find_dir(prefix)
    if not paper:
        print("%-42s NO PAPER DIR for %s" % (prefix, key))
        continue
    where = []
    for dirpath, _dirs, files in os.walk(os.path.join(ROOT, "preprints", paper)):
        for fn in files:
            if not fn.endswith((".tex", ".bbl")):
                continue
            text = open(os.path.join(dirpath, fn), encoding="utf-8", errors="replace").read()
            if key in LABEL.findall(text):
                rel = os.path.relpath(os.path.join(dirpath, fn), os.path.join(ROOT, "preprints", paper))
                where.append(rel)
    flat_p = os.path.join(ROOT, "_work", "flat", paper + ".tex")
    flat = open(flat_p, encoding="utf-8", errors="replace").read() if os.path.exists(flat_p) else ""
    in_flat = key in LABEL.findall(flat)
    refs = len(re.findall(r"\\(?:ref|eqref|autoref|cref|Cref|pageref)\s*\{%s\}" % re.escape(key), flat))
    kind = ("in flat, %d refs -> EMITTER" % refs) if in_flat else (
        "only in %s -> FLATTEN GAP" % ",".join(where) if where else "nowhere -> SOURCE")
    print("%-42s %-24s %s" % (paper[:42], key, kind))
