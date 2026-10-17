import os, re, sys, io
from collections import Counter
sys.stdout.reconfigure(encoding="utf-8")
ROOT = u"\u7814\u7a76\u7b14\u8bb0"
H = re.compile(u"^## *(?:\u00a7 ?)?(\\d+)(?:[. ]|$)")
REF = re.compile(u"\u00a7(\\d+)(?![\\.\\d])")
DREF = re.compile(u"\u00a7(\\d+)\\.")

# 「申报性缺号」判据：作者本人在稿内把这个号 declared 成永久/已在他号下照录恢复，
# 且同一行同时出现该号的阿拉伯或中文写法与下列标记之一。内容不算丢。
MARK = [u"\u6c38\u4e45\u7f3a\u53f7", u"\u4e0d\u56de\u6539", u"\u9010\u5b57\u91cd\u520a",
        u"\u7167\u5f55\u6062\u590d", u"\u73b0\u843d\u5728\u7b2c", u"\u4e0d\u518d\u4e8c\u6b21\u4e66\u5199",
        u"\u7f3a\u53f7\u4ecd\u4e3a"]
U = u"\u4e00\u4e8c\u4e09\u56db\u4e94\u516d\u4e03\u516b\u4e5d"


def cn(n):
    if n < 10:
        return U[n - 1]
    if n < 20:
        return u"\u5341" + (U[n - 11] if n > 10 else u"")
    return U[n // 10 - 1] + u"\u5341" + (U[n % 10 - 1] if n % 10 else u"")


def krefs(k):
    return [u"\u00a7%d" % k, u"\u00a7 %d" % k, u"\u7b2c %d \u8282" % k,
            u"\u7b2c%d\u8282" % k, u"\u7b2c %d\u8282" % k,
            u"\u7b2c%s\u8282" % cn(k), u"\u7b2c %s \u8282" % cn(k),
            u"\u7b2c%s\u8282" % cn(k)]

fam = {"A_perm": [], "B_dup": [], "C_gap": [], "C2_restored": [], "C4_declared": [],
       "D_dangling": []}
for name in sorted(os.listdir(ROOT)):
    if re.match(u"^D\\d+-.*\\.md$", name) is None:
        continue
    lines = io.open(os.path.join(ROOT, name), encoding=u"utf-8").read().split(u"\n")
    d = name[1:name.find(u"-")]
    seq = []
    for l in lines:
        if l.startswith(u"###"):
            continue
        m = H.match(l)
        if m:
            seq.append(int(m.group(1)))
    if not seq:
        continue
    s = set(seq)
    c = Counter(seq)
    dup = sorted(k for k in c if c[k] > 1)
    mono = seq == sorted(seq)
    gap = sorted(set(range(min(seq), max(seq) + 1)) - s) if len(seq) > 1 else []
    refs = set()
    for l in lines:
        if l.startswith(u"#"):
            continue
        for mm in REF.finditer(l):
            refs.add(int(mm.group(1)))
    dang = sorted(refs - s)
    if dup:
        fam["B_dup"].append((d, dup, len(seq)))
    elif not mono:
        fam["A_perm"].append((d, gap, len(seq)))
    elif gap:
        # 补缺批通道的判据：缺的号只要在本稿里申报过「某新节补回它」或给出 §k->§m 映射，
        # 内容就不算丢，单列一族，不与真丢号混计。
        cur = None
        covered = set()
        declared = set()
        for l in lines:
            m = H.match(l)
            if m and not l.startswith(u"###"):
                cur = int(m.group(1))
                continue
            if cur is None or l.startswith(u"#"):
                continue
            for k in gap:
                mm = re.search(u"\u00a7%s\u2192\u00a7(\\d+)" % k, l)
                if mm and int(mm.group(1)) in s:
                    covered.add(k)
                if re.search(u"\u8865\u56de\u66fe\u7f3a\u5931\u7684 ?\u00a7%s" % k, l):
                    covered.add(k)
                if any(mk in l for mk in MARK) and any(t in l for t in krefs(k)):
                    declared.add(k)
        gap = sorted(set(gap) - covered - declared)
        if declared:
            fam["C4_declared"].append((d, sorted(declared)))
        if covered:
            fam["C2_restored"].append((d, sorted(covered), len(gap)))
        if gap:
            fam["C_gap"].append((d, gap))
    if dang and not dup and mono:
        fam["D_dangling"].append((d, dang, gap))

for k in ["A_perm", "B_dup", "C_gap", "C4_declared", "C2_restored", "D_dangling"]:
    v = fam[k]
    print("%s = %d" % (k, len(v)))
    for r in v:
        print("   ", r)
io.open(os.path.join("_work", "sec_census3.txt"), "w", encoding=u"utf-8").write(
    repr(fam))
