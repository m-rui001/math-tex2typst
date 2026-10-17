# -*- coding: utf-8 -*-
# 台账续行缺表头（第二形态）：标记行（标题或说明句）之后、越过空行与说明段，
# 第一条 6 竖线数据行之前补发「记号」表头＋标准分隔行。数据行一个字节不动。
import glob
import io
import os
import re
import sys
from collections import Counter

sys.stdout.reconfigure(encoding="utf-8")
HDR = (u"| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | \u4f4d\u7f6e(\u6587\u4ef6:\u884c) | "
       u"\u88ab\u8c01\u6d88\u8d39 | \u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |")
ALT = HDR.replace(u"\u7b26\u53f7", u"\u8bb0\u53f7", 1)
SEP = u"| --- | --- | --- | --- | --- |"
FLIGHT = set(u"D149 D10 D06 D691 D741 D681 D682 D683 D684 D685 D686".split())

# ID -> 标记行前缀（本工具只在本文件内用它定位，要求全文唯一命中）
CASES = {
    u"D29": u"### \u672c\u8868\u7eed\u4f53",
    u"D364": u"## \u00a715 \u53f0\u8d26",
    u"D711": u"## \u00a731 \u53f0\u8d26\u7eed\u884c",
    u"D76": u"## 18 \u53f0\u8d26\u7eed\u884c",
    # 2026-10-14 追加批 D605：### 小节标题之后隔一枚空行就是 21 行六竖线数据行。
    u"D605": u"### \u672c\u8282\u53f0\u8d26\uff08\u53ea\u8ffd\u52a0\u6570\u636e\u884c",
}
apply = u"--apply" in sys.argv
# 命令行给 ID 就只跑这几例（同族工具 ledger_merge2 的口径：已修过的号重跑会撞在
# 「块首已是表头」的断言上，那不是事故，是它已经修好的证据）。
sel = [a for a in sys.argv[1:] if a != u"--apply"]
for k, mark in sorted(CASES.items()):
    if sel and k not in sel:
        continue
    if k in FLIGHT:
        print(u"%s SKIP flight" % k)
        continue
    p = glob.glob(u"研究笔记/%s-*.md" % k)[0]
    raw = io.open(p, encoding="utf-8").read()
    assert u"\r" not in raw, k
    L = raw.split(u"\n")
    idx = [i for i, l in enumerate(L) if l.startswith(mark)]
    assert len(idx) == 1, (k, mark, idx)
    i = idx[0] + 1
    while i < len(L) and not L[i].startswith(u"| "):
        assert not L[i].startswith(u"#"), (k, u"crossed a heading", i + 1)
        i += 1
    assert L[i].count(u"|") == 6, (k, i + 1, L[i][:40])
    assert L[i] not in (HDR, ALT, SEP)
    ins = i
    nl = L[:ins] + [ALT, SEP] + L[ins:]
    new = u"\n".join(nl)
    ob, nb = raw.encode("utf-8"), new.encode("utf-8")
    assert nb.count(b"\r") == 0
    per = len((ALT + u"\n" + SEP + u"\n").encode("utf-8"))
    assert len(nb) - len(ob) == per
    assert Counter([l for l in new.split(u"\n") if l.strip()]) == \
        Counter([l for l in L if l.strip()]) + Counter({ALT: 1, SEP: 1})
    assert new.count(HDR) == raw.count(HDR)
    print(u"%s mark@%d rows@%d +%dB size=%d hdr=%d alt=%d" %
          (k, idx[0] + 1, ins + 1, len(nb) - len(ob), len(nb), new.count(HDR), new.count(ALT)))
    if apply:
        io.open(u"_work/%s.pre-orphanhdr2.md" % k, "wb").write(ob)
        io.open(p, "wb").write(nb)
print(u"APPLY=%s" % apply)
