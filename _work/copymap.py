import os, re, json
from collections import defaultdict

odd_dir = r"E:/math/lean/OAI/Algebra/OddKaplansky"
c2_dir = r"E:/math/lean/OAI/RingTheory/DirectFiniteness"

DECL = re.compile(r'^\s*(?:private\s+|protected\s+|noncomputable\s+|partial\s+)*'
                  r'(?:theorem|lemma|def|abbrev|structure|inductive|instance|class|example|axiom|mutual)\s+'
                  r'([A-Za-z_][\w.\']*)')

def decls(path):
    s = set()
    with open(path, encoding='utf-8', errors='replace') as f:
        for line in f:
            m = DECL.match(line)
            if m:
                n = m.group(1)
                if n == 'where':
                    continue
                s.add(n.split('.')[-1])
    return s

def files(d):
    return {f[:-5]: os.path.join(d, f) for f in os.listdir(d) if f.endswith('.lean')}

of = files(odd_dir); cf = files(c2_dir)
odecl = {k: decls(v) for k, v in of.items()}
cdecl = {k: decls(v) for k, v in cf.items()}

print("odd decls total:", sum(len(v) for v in odecl.values()))
print("c2 decls total:", sum(len(v) for v in cdecl.values()))
print("odd files:", len(of), "c2 files:", len(cf))

rows = []
for k in sorted(of):
    a = odecl[k]
    if not a:
        rows.append((k, len(a), [], 0))
        continue
    best = []
    for ck, b in cdecl.items():
        n = len(a & b)
        if n:
            best.append((n, ck))
    best.sort(reverse=True)
    tot_overlap = sum(n for n, _ in best[:3])
    rows.append((k, len(a), best[:4], tot_overlap))

for k, na, best, _ in rows:
    b = ", ".join(f"{c}:{n}" for n, c in best)
    print(f"{k:26s} decls={na:4d}  {b}")
