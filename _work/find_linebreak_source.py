"""Find the `cases` block whose branch holds a 2x2 matrix (the linebreak warning)."""
import re
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

t = open("_work/flat/The-Quasi-Riemann-Hypothesis-October-5-2026.tex",
         encoding="utf-8", errors="replace").read()
for m in re.finditer(re.escape(r"\begin{cases}"), t):
    end = t.find(r"\end{cases}", m.end())
    seg = t[m.start():end]
    if "matrix" in seg or "array" in seg:
        print("----- offset", m.start())
        print(seg[:900])
        print()
