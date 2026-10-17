import os, re, sys, io
sys.stdout.reconfigure(encoding="utf-8")
ROOT = os.path.join(os.getcwd(), u"\u7814\u7a76\u7b14\u8bb0")
H2 = re.compile(u"^## *(\u00a7?)(\\d+)(\\.\\d+)? +")
REF = re.compile(u"\u00a7(\\d+)(?![\\.\\d])")
sys.path.insert(0, os.path.join(os.getcwd(), u".tools"))
import gate

bad_ref, gaps, dup, gate_bad = [], [], [], []
n = 0
for name in sorted(os.listdir(ROOT)):
    if re.match(u"^D\\d+-.*\\.md$", name) is None:
        continue
    p = os.path.join(ROOT, name)
    txt = io.open(p, encoding="utf-8").read()
    n += 1
    d = int(name[1:name.find(u"-")])
    seq = []
    for line in txt.split(u"\n"):
        m = H2.match(line)
        if m and m.group(3) is None:
            seq.append(int(m.group(2)))
    s = set(seq)
    refs = set()
    for line in txt.split(u"\n"):
        if line.startswith(u"#"):
            continue
        for m in REF.finditer(line):
            refs.add(int(m.group(1)))
    miss = sorted(refs - s)
    if miss:
        bad_ref.append((d, miss))
    from collections import Counter
    c = Counter(seq)
    dd = sorted(k for k in c if c[k] > 1)
    if dd:
        dup.append((d, dd))
    if seq:
        exp = list(range(min(seq), max(seq) + 1))
        g = sorted(set(exp) - s)
        if g:
            gaps.append((d, g))
    r = gate.chk(p, quiet=True)
    if r.get("problems"):
        gate_bad.append((d, r["problems"]))

print("notes", n)
print("bad_ref", len(bad_ref))
for d, m in bad_ref[:50]:
    print("   D%d missing %s" % (d, m))
print("dupnum", len(dup))
for d, m in dup[:50]:
    print("   D%d dup %s" % (d, m))
print("gaps", len(gaps))
for d, m in gaps[:60]:
    print("   D%d gap %s" % (d, m))
print("gate_bad", len(gate_bad))
for d, m in gate_bad[:15]:
    print("   D%d %s" % (d, m))
