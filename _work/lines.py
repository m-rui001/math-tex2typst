import os
odd_dir = r"E:/math/lean/OAI/Algebra/OddKaplansky"
rows=[]
for f in sorted(os.listdir(odd_dir)):
    if not f.endswith(".lean"): continue
    p=os.path.join(odd_dir,f)
    with open(p,encoding='utf-8',errors='replace') as fh:
        txt=fh.read()
    lines=txt.count("\n")+1
    imports=[l.strip() for l in txt.splitlines() if l.startswith("import") and "OddKaplansky" in l]
    # extract namespace declarations top-level
    rows.append((f[:-5],lines,len(imports)))
rows.sort(key=lambda r:-r[1])
for r in rows: print(f"{r[0]:26s} lines={r[1]:5d} internalImports={r[2]}")
print("TOTAL LINES:", sum(r[1] for r in rows))
