import io, re, sys

f = sys.argv[1]
t = io.open(f, encoding='utf-8').read().split('\n')
out = []
for i, s in enumerate(t, 1):
    if 'tex:' not in s and ':http' not in s:
        continue
    # keep lines that carry an explicit numeric/parametric constant
    if re.search(r'(\\frac|\\tfrac|\\le ?[0-9]|\\ge ?[0-9]|= ?[0-9]\.|[0-9]\.[0-9]|\\delta|\\epsilon|\\eta|\\lambda|\\kappa|\\theta|\\rho)', s):
        out.append((i, s))
for i, s in out:
    print(i, '|', s[:420])
    print()
