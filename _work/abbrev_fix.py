# -*- coding: utf-8 -*-
# 缩写位置串腿：歧义／越界／跨篇三族一次改成唯一可解析形态。
# 每处替换带计数；dry-run 打印每篇命中数与字节差。
import glob, io, re, sys

APPLY = u"--apply" in sys.argv
rep = {}


def load(k):
    p = glob.glob(u"研究笔记/%s-*.md" % k)[0]
    raw = io.open(p, "rb").read().decode("utf-8")
    assert u"\r" not in raw, k
    return p, raw.split(u"\n")


def sub(lines, pat, old, new, tag, want=1):
    R = re.compile(pat)
    n = 0
    for i, l in enumerate(lines):
        if not R.search(l):
            continue
        c = l.count(old)
        if want and c != want:
            print(u"  CNT %s @%d count=%d want=%d  %s" % (tag, i + 1, c, want, old))
        lines[i] = l.replace(old, new)
        n += c
    return n


# ---------------- D31：01: 与 07r: 两个同义前缀 ----------------
p31, L = load(u"D31")
META = sub(L, u"这类速记", u"`01:", u"`\x01:", u"D31 meta-protect", 0)   # 作者自述口径，逐字保留
S01 = sub(L, u"`01:", u"`01:", u"`01-introduction.tex:", u"D31 01", 0)
S01 -= sub(L, u"这类速记", u"`\x01:", u"`01:", u"D31 meta-restore", 0)
S07 = sub(L, u"`07r:", u"`07r:", u"`reduced:", u"D31 07r", 0)
# 三处行号实核（素材 01-introduction.tex：no-claim 句在 86-87，Hermitian 句在 88-89；
# 01-history.tex：Netzer 五变量三次在 19-20，16-17 是 Raghavendra 下界）
A87 = sub(L, u"`01-introduction\\.tex:87-88", u"`01-introduction.tex:87-88",
          u"`01-introduction.tex:86-87", u"D31 87-88", 0)
A87 += sub(L, u"`01-introduction\\.tex:87`", u"`01-introduction.tex:87`",
           u"`01-introduction.tex:86-87`", u"D31 87", 0)
A92 = sub(L, u"`01-introduction\\.tex:88-92", u"`01-introduction.tex:88-92",
          u"`01-introduction.tex:88-89", u"D31 88-92", 0)
AH = sub(L, u"`01h:16-17", u"`01h:16-17", u"`01h:19-20", u"D31 netzer", 0)
rep[u"D31"] = (p31, L, u"01->full=%d 07r->reduced=%d 87->86-87=%d 88-92->88-89=%d 01h:16-17->19-20=%d meta-keep=%d" % (
    S01, S07, A87, A92, AH, META))

# ---------------- D37：03:334-356 越界 149 行，实为 02-pruning.tex 末段 ----------------
p37, L = load(u"D37")
S37 = sub(L, u"`03:334-356`", u"`03:334-356`", u"`02:334-356`", u"D37", 0)
rep[u"D37"] = (p37, L, u"03:334-356 -> 02:334-356 sites=%d (02-pruning.tex 356 行，03 只 148)" % S37)

# ---------------- D95：两处区间尾越界 ----------------
p95, L = load(u"D95")
B1 = sub(L, u"`07b:96-99`", u"`07b:96-99`", u"`07b:90-96`", u"D95 07b", 0)
B2 = sub(L, u"`03:38-238`", u"`03:38-238`", u"`03:38-236`", u"D95 03", 0)
rep[u"D95"] = (p95, L, u"07b:96-99->90-96=%d (文件 96 行，uniform-prior 句在 90-96) 03:38-238->38-236=%d (文件 236 行)" % (B1, B2))

# ---------------- D54：跨篇引用改散文形，避免被当成本篇位置串 ----------------
p54, L = load(u"D54")
OLD54 = u"（其笔记第 14 行转述的 `00:98`）"
NEW54 = u"（D40 素材 `00-introduction.tex` 第 98 行，其笔记第 14 行转述）"
C54 = sub(L, re.escape(OLD54), OLD54, NEW54, u"D54", 0)
rep[u"D54"] = (p54, L, u"跨篇 `00:98`->散文 sites=%d (D40 00-introduction.tex:98 实测为该句)" % C54)

# ---------------- 复量与落盘 ----------------
tot = 0
for k in sorted(rep):
    p, L, msg = rep[k]
    raw = u"\n".join(L).encode("utf-8")
    b0 = io.open(p, "rb").read()
    print(u"%s %s\n     bytes %d->%d (%+d)  tick %d->%d  dollar %d->%d  pipe %d->%d" % (
        k, msg, len(b0), len(raw), len(raw) - len(b0),
        b0.count(b"`"), raw.count(b"`"), b0.count(b"$"), raw.count(b"$"),
        b0.count(b"|"), raw.count(b"|")))
    tot += len(raw) - len(b0)
    if APPLY:
        io.open(u"_work/%s.pre-abbrev.md" % k, "wb").write(b0)
        assert u"\r" not in raw.decode("utf-8")
        io.open(p, "wb").write(raw)
print(u"APPLY=%s total=%+d B" % (APPLY, tot))
