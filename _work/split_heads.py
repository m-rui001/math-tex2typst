# -*- coding: utf-8 -*-
# 通用「标题落进行内」修复：把行尾独占的 "## §N 标题" 串切回独立一行。
# 只在 N 属于该档缺号、且该串之后没有其它文字时动手；只做插入，不删任何字节。
import glob
import io
import re
import sys

sys.stdout.reconfigure(encoding="utf-8")
HEAD = re.compile(u"## \u00a7? *([0-9]+)(?![0-9.])")
H2 = re.compile(u"^## *(?:\u00a7 ?)?([0-9]+)(?:[. ]|$)")


def seq_of(lines):
    out = []
    for l in lines:
        if l.startswith(u"###"):
            continue
        m = H2.match(l)
        if m:
            out.append(int(m.group(1)))
    return out


def find_targets(lines, miss):
    hits = []
    for i, l in enumerate(lines):
        if l.startswith(u"#"):
            continue
        for m in HEAD.finditer(l):
            n = int(m.group(1))
            if n not in miss:
                continue
            if l[m.start():].strip() != l[m.start():].rstrip():
                continue
            if not l[:m.start()].rstrip().endswith((u"。", u"）", u"：", u"!", u"?")):
                continue
            hits.append((i, n, m.start(), l[m.start():].rstrip()))
    return hits


for d in sys.argv[1:]:
    if d == u"--apply":
        continue
    path = glob.glob(u"研究笔记/D%s-*.md" % d)[0]
    raw = io.open(path, encoding="utf-8").read()
    lines = raw.split(u"\n")
    sq = seq_of(lines)
    miss = set(range(min(sq), max(sq) + 1)) - set(sq)
    tg = find_targets(lines, miss)
    found = set(t[1] for t in tg)
    print("=== D%s size=%d miss=%s splitable=%s unexplained=%s" % (
        d, len(raw.encode("utf-8")), sorted(miss), sorted(found),
        sorted(miss - found)))
    for i, n, col, txt in tg:
        print("    line %d num %s col %d | %s" % (i + 1, n, col, txt[:56]))
        print("      body_tail ...%s" % lines[i][max(0, col - 26):col])
    if u"--apply" in sys.argv and tg:
        out = list(lines)
        for i, n, col, txt in tg:
            l = out[i]
            assert l.endswith(txt)
            out[i] = l[:col] + u"\n\n" + txt
        new = u"\n".join(out)
        # 只做插入：把插入的两个换行去掉必须逐字还原
        chk = list(out)
        for i, n, col, txt in tg:
            l = chk[i]
            assert l[col:col + 2] == u"\n\n" and l[col + 2:] == txt
            chk[i] = l[:col] + txt
        assert u"\n".join(chk) == raw, "not insertion-only"
        ns = seq_of(new.split(u"\n"))
        assert ns == sorted(ns), ns
        io.open(u"_work/D%s.pre-splithead.md" % d, "w",
                encoding="utf-8", newline=u"\n").write(raw)
        io.open(path, "w", encoding="utf-8", newline=u"\n").write(new)
        print("    APPLIED size %d -> %d seq_ok=%s heads=%d" % (
            len(raw.encode("utf-8")), len(new.encode("utf-8")),
            ns == sorted(ns), len(ns)))
