import os, re, sys, io
from collections import Counter
sys.stdout.reconfigure(encoding="utf-8")
ROOT = os.path.join(os.getcwd(), u"\u7814\u7a76\u7b14\u8bb0")
H2 = re.compile(u"^## *(?:\u00a7 *)?(\\d+|[^\u4e00-\u9fff]*[\u4e00-\u9fff]+)(?:[.\u3001 ]|$)")
CN = u"\u4e00\u4e8c\u4e09\u56db\u4e94\u516d\u4e03\u5168\u4e5d\u5341"
REF = re.compile(u"\u00a7(\\d+)(?![\\.\\d])")


def cn2int(s):
    s = s.strip()
    if re.match(u"^\\d+$", s):
        return int(s)
    m = re.match(u"^([\u4e00-\u4e5d]\u5341)?([\u4e00-\u4e5d])?$", s)
    if not m:
        return None
    t = {u"\u4e00": 1, u"\u4e8c": 2, u"\u4e09": 3, u"\u56db": 4, u"\u4e94": 5,
         u"\u516d": 6, u"\u4e03": 7, u"\u516b": 8, u"\u4e5d": 9}
    tens, ones = m.group(1), m.group(2)
    v = 0
    if tens:
        v = (10 if tens == u"\u5341" else t[tens[0]] * 10)
    if ones:
        v += t[ones]
    return v or None


notes = [f for f in sorted(os.listdir(ROOT)) if re.match(u"^D\\d+-.*\\.md$", f)]
dangling, gaps, dup = [], [], []
for name in notes:
    p = os.path.join(ROOT, name)
    lines = io.open(p, encoding="utf-8").read().split(u"\n")
    d = int(name[1:name.find(u"-")])
    seq = []
    for l in lines:
        if l.startswith(u"###"):
            continue
        m = H2.match(l)
        if not m:
            continue
        v = cn2int(m.group(1))
        if v is not None:
            seq.append(v)
    s = set(seq)
    refs = set()
    for l in lines:
        if l.startswith(u"#"):
            continue
        for mm in REF.finditer(l):
            refs.add(int(mm.group(1)))
    miss = sorted(refs - s)
    if miss:
        dangling.append((d, miss, sorted(s)[-3:] if s else []))
    c = Counter(seq)
    dd = sorted(k for k in c if c[k] > 1)
    if dd:
        dup.append((d, dd))
    if len(seq) > 1:
        g = sorted(set(range(min(seq), max(seq) + 1)) - s)
        if g:
            gaps.append((d, g, (min(seq), max(seq))))

print("notes", len(notes))
print("dangling_refs", len(dangling))
for d, m, h in dangling:
    print("   D%d miss %s  heads..%s" % (d, m, h))
print("dupnum", len(dup))
for d, m in dup:
    print("   D%d dup %s" % (d, m))
print("gaps", len(gaps))
for d, m, r in gaps:
    print("   D%d gap %s range %s" % (d, m, r))
