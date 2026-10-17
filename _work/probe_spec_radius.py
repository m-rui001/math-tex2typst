r"""Blast radius of the brace-bearing array spec, and the Kervaire float after the patch.

INLINE_ARRAY read an \begin{array} preamble as [^{}]*, so a spec carrying @{\qquad} - or any other
one-level argument - was never seen, the float stayed a maths formula, and pandoc threw its caption
away with the envelope. This counts how many table floats in the corpus are of that shape, then runs
the one converter over the Kervaire paper and shows what its caption became.
"""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import convert, prep  # noqa: E402

FLAT = os.path.join(ROOT, "_work", "flat")
TABLE_FLOAT = re.compile(r"\\begin\{table\*?\}.*?\\end\{table\*?\}", re.S)
ARRAY_SPEC = re.compile(r"\\begin\{array\}\{((?:[^{}]|\{[^{}]*\})*)\}")


def main():
    hit = []
    for fn in sorted(os.listdir(FLAT)):
        if not fn.endswith(".tex"):
            continue
        name = fn[:-4]
        body = open(os.path.join(FLAT, fn), encoding="utf-8", errors="replace").read()
        for m in TABLE_FLOAT.finditer(body):
            spec = ARRAY_SPEC.search(m.group(0))
            if spec and ("{" in spec.group(1) or "|" in spec.group(1)):
                hit.append((name, spec.group(1)[:44]))
    print("table floats whose array spec carries braces or rules: %d, papers: %d"
          % (len(hit), len({h[0] for h in hit})))
    for name, spec in hit[:14]:
        print("   %-52s %s" % (name[:52], spec.encode("unicode_escape").decode()))

    paper = "The-Kervaire-Invariant-Problem-at-the-Prime-Three-September-24-2026"
    out = os.path.join(ROOT, "_work", "_probe_kervaire")
    os.makedirs(out, exist_ok=True)
    res = convert.convert_paper(os.path.join(FLAT, "%s.tex" % paper), out, paper)
    print("convert ok=%s stage=%s" % (res.get("ok"), res.get("stage")))
    typ = open(os.path.join(out, "main.typ"), encoding="utf-8", errors="replace").read()
    i = typ.find("Universal lower")
    print("--- caption region ---")
    print(typ[max(0, i - 260):i + 120] if i >= 0 else "(caption still missing)")
    print("--- dangling refs to finite:enclosures ---", typ.count("[??]"), "??" in typ)


main()
