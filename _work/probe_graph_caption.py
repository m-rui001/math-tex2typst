r"""Where does the last flagged caption stand, outside any figure or table float?

`probe_tabularx.py` showed the tabularx float's caption is on the page, so the run of prose I called
missing was my needle straddling a formula. The other flagged caption in the same paper, "The graph
used …", sits in no figure or table float at all - so print its surroundings, and whether the current
page has its prose runs. That tells whether the orphan-caption path (`_lift_captions`) reached it.
"""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
from t2t import cetz, prep  # noqa: E402

PAPER = "An-Irrational-Trace-Counterexample-to-Reduced-Baum-Connes-September-23-2026"
CAP = re.compile(r"\\caption\b\s*(?:\[[^\]]*\])?\s*\{")
body = open(os.path.join(ROOT, "_work", "flat", "%s.tex" % PAPER),
            encoding="utf-8", errors="replace").read()
out = open(os.path.join(ROOT, "typst", PAPER, "main.typ"),
           encoding="utf-8", errors="replace").read()

for m in CAP.finditer(body):
    inner, end = cetz.bracketed(body, m.end() - 1)
    if "The graph used" not in inner:
        continue
    lo = body.rfind("\n", 0, m.start() - 500)
    hi = body.find("\n", end + 300)
    region = body[lo:hi]
    print("--- source region ---")
    for line in region.splitlines():
        print("| " + line[:120].encode("unicode_escape").decode()[:150])
    print("--- envs enclosing the caption (innermost last) ---")
    print(re.findall(r"\\\\(?:begin|end)\{([a-zA-Z*]+)\}", region))
    print("--- after prep.lift_captions: \\caption still outside a float? ---")
    lifted = prep.lift_captions(region)
    print("floats added: %d ; caption count %d -> %d"
          % (lifted.count("\\begin{figure}") + lifted.count("\\begin{table}"),
             region.count("\\caption"), lifted.count("\\caption")))
    for line in lifted.splitlines()[:14]:
        print("> " + line[:120].encode("unicode_escape").decode()[:150])
    print("--- words on the page ---")
    runs = [w for w in re.sub(r"[^a-zA-Z ]+", " ", inner).split()]
    print("first 8 prose words: %r" % " ".join(runs[:8]))
    print("present in main.typ: %s" % (" ".join(runs[:4]) in re.sub(r"[^a-zA-Z ]+", " ", out)))
