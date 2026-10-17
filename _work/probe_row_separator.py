"""Raw bytes of a row separator: aligned display vs the matrix that collapsed inside `cases`."""
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

a = open("typst/A-C1-Counterexample-to-the-Entropy-Conjecture-September-25-2026/main.typ",
         encoding="utf-8", errors="replace").read()
i = a.find("t' &")
print("ALIGN  :", repr(a[i:i + 150]))

b = open("typst/The-Quasi-Riemann-Hypothesis-October-5-2026/main.typ",
         encoding="utf-8", errors="replace").read()
lines = b.splitlines()
for n in (1234, 1235):
    j = lines[n].find("cases(")
    print("CASES %d: %s" % (n + 1, repr(lines[n][j:j + 200])))
