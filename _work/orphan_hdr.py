# -*- coding: utf-8 -*-
# 台账孤表补表头：`## N 台账…` 标题下直接跟数据行（无表头无分隔行）→ 渲染成字面文本。
# 只在首行数据之前插两行（记号表头 + 分隔行），数据行一个字节不动。
# 判据：插进去的不是标准 HDR 串，gate 的 hdr 仍为 1；gate rows 只数 HDR 后第一连续块，不变。
import glob
import io
import os
import sys
from collections import Counter

sys.stdout.reconfigure(encoding="utf-8")
HDR = (u"| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | "
       u"\u4f4d\u7f6e(\u6587\u4ef6:\u884c) | \u88ab\u8c01\u6d88\u8d39 | "
       u"\u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |")
ALT = (u"| \u8bb0\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | "
       u"\u4f4d\u7f6e(\u6587\u4ef6:\u884c) | \u88ab\u8c01\u6d88\u8d39 | "
       u"\u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |")
SEP = u"| --- | --- | --- | --- | --- |"
FLIGHT = set(u"D681 D682 D683 D684 D685 D686 D691 D741 D149 D10 D06".split())
DONE = set(u"D578 D627 D711 D296".split())

CASES = {
    u"D578": [u"## \u00a731 \u53f0\u8d26\u8865\u5f55",
              u"## \u00a734 \u53f0\u8d26\u8865\u5f55\uff08\u7eed\uff09"],
    u"D627": [u"## \u00a726 \u53f0\u8d26"],
    u"D711": [u"## \u00a727 \u53f0\u8d26\u8865\u5f55"],
    u"D368": [u"## \u00a728 \u53f0\u8d26\u7eed\u884c"],
    u"D530": [u"## \u00a732 \u53f0\u8d26\u7eed\uff08\u53ea\u8ffd\u52a0\u6570\u636e\u884c\uff09"],
}
apply = u"--apply" in sys.argv
for k, heads in CASES.items():
    if k in FLIGHT or k in DONE:
        print(u"%s SKIP flight/done" % k)
        continue
    p = glob.glob(u"研究笔记/%s-*.md" % k)[0]
    raw = io.open(p, encoding="utf-8").read()
    L = raw.split(u"\n")
    assert u"\r" not in raw, k
    ins = []
    for h in heads:
        idx = [i for i, l in enumerate(L) if l == h]
        assert len(idx) == 1, (k, h, len(idx))
        i = idx[0]
        j = i + 1
        while j < len(L) and L[j] == u"":
            j += 1
        assert L[j].startswith(u"| "), (k, h, j + 1, L[j][:30])
        assert L[j].count(u"|") == 6, (k, h)
        assert L[j] != ALT and L[j] != SEP
        ins.append(j)
    for j in sorted(ins, reverse=True):
        L[j:j] = [ALT, SEP]
    new = u"\n".join(L)
    ob = raw.encode(u"utf-8")
    nb = new.encode(u"utf-8")
    assert nb.count(b"\r") == 0
    per = len((ALT + u"\n" + SEP + u"\n").encode("utf-8"))
    assert len(nb) - len(ob) == per * len(ins)
    old_nb = [l for l in raw.split(u"\n") if l.strip()]
    new_nb = [l for l in new.split(u"\n") if l.strip()]
    assert Counter(new_nb) == Counter(old_nb) + Counter({ALT: len(ins), SEP: len(ins)})
    assert new.count(HDR) == raw.count(HDR)
    print(u"%s ins=%d rows_at=%s +%dB size=%d" %
          (k, len(ins), [j + 1 for j in ins], len(nb) - len(ob), len(nb)))
    if apply:
        io.open(u"_work/%s.pre-orphanhdr.md" % k, u"w", encoding="utf-8").write(raw)
        io.open(p, "wb").write(nb)
print(u"APPLY=%s" % apply)
