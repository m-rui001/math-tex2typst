r"""Show each caption that never reached its page, with the float it sits in.

Five captions are missing from the rendered text of five papers. Whether that is one mechanism or
five decides the size of the repair, so print for each: the enclosing float head, what stands
between the float and its caption, and whether the caption survives `prep` at all.
"""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz, prep  # noqa: E402

TARGETS = {
    "A-boundary-field-gap-for-the-spin-one-Heisenberg-chain-September-24-2026": "All fifteen couplings",
    "An-Irrational-Trace-Counterexample-to-Reduced-": "Parameter choices",
    "Finite-angular-cylinder-covers-below-the-half-": "At zero tilt",
    "Strongly-rational-unitary-vertex-operator-alge": "The fixed geometry used",
    "The-Deligne-Drinfeld-conjecture-September-23-2": "The five parenthesizations",
}
CAP = re.compile(r"\\caption\b\s*(?:\[[^\]]*\])?\s*\{")
FLOAT = re.compile(r"\\begin\{(figure|table|float|sidewaystable|longtable)\*?\}")


def main():
    flat = os.path.join(ROOT, "_work", "flat")
    for fn in sorted(os.listdir(flat)):
        paper = fn[:-4]
        key = next((t for t in TARGETS if paper.startswith(t)), None)
        if not key:
            continue
        body = open(os.path.join(flat, fn), encoding="utf-8", errors="replace").read()
        print("======== %s" % paper[:70])
        for m in CAP.finditer(body):
            inner, end = cetz.bracketed(body, m.end() - 1)
            if TARGETS[key].lower() not in inner.lower():
                continue
            lo = body.rfind("\\begin{", 0, m.start())
            hi = body.find("\\end{", end)
            region = body[max(0, lo - 120):hi + 30]
            print("  caption words: %r" % inner[:80].encode("unicode_escape").decode())
            fh = FLOAT.search(region)
            print("  float head: %r ; env nesting inside region: %s"
                  % (fh.group(0) if fh else None, region.count("\\begin{")))
            print("  --- raw region (first 18 lines) ---")
            for line in region.splitlines()[:18]:
                print("  | " + line[:120].encode("unicode_escape").decode()[:160])
            after = prep.lift_captions(region) if fh else region
            print("  --- after lift_captions: caption still inline in float: %s"
                  % (after.count("\\caption") > 0,))
            for line in after.splitlines()[:10]:
                print("  > " + line[:120].encode("unicode_escape").decode()[:160])


main()
