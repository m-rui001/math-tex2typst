# -*- coding: utf-8 -*-
# D497：作者在第 22 节（现勘误节）申报「第 13 节整块落在第 21 节，请本体侧用整块搬迁工具
# 处理，并核对节号连续性与全文节数」。这一趟按其申报执行：
#   1) 把第 21 节整块搬到第 14 节题记之前，标题号改 13，去掉「缺写的第 13 节：」这层元话语；
#   2) 原第 22 节题号改 21，使 0..21 连续（gate 的 contig 要逐差为 1，缺号就为假）；
#   3) 正文「第 21 节」→「第 13 节」、「第 22 节」→「第 21 节」一次性并动（先置占位符）。
import io
import re
import sys

sys.stdout.reconfigure(encoding="utf-8")
P = None
import glob
P = glob.glob(u"研究笔记/D497-*.md")[0]
apply = u"--apply" in sys.argv
raw = io.open(P, encoding="utf-8").read()
assert u"\r" not in raw
L = raw.split(u"\n")
i21 = [i for i, l in enumerate(L) if l.startswith(u"## 21 ")]
i22 = [i for i, l in enumerate(L) if l.startswith(u"## 22 ")]
i14 = [i for i, l in enumerate(L) if l.startswith(u"## 14 ")]
assert len(i21) == len(i22) == len(i14) == 1, (i21, i22, i14)
i21, i22, i14 = i21[0], i22[0], i14[0]
assert i14 < i21 < i22
block = L[i21:i22]
assert block[-1] == u"" and block[0].startswith(u"## 21 ")
old_head = block[0]
tail = old_head[len(u"## 21 "):]
assert tail.startswith(u"缺写的第 13 节："), tail[:20]
block[0] = u"## 13 " + tail[len(u"缺写的第 13 节："):]
new = L[:i14] + block + L[i14:i21] + L[i22:]
assert len(new) == len(L)
n21 = len([l for l in L if u"第 21 节" in l])
n22 = len([l for l in L if u"第 22 节" in l])
assert raw.count(u"第 21 节") == sum(l.count(u"第 21 节") for l in L)
PH = u"第 \x01 节"
PH2 = u"第 \x02 节"
t = u"\n".join(new)
assert t.count(u"## 22 ") == 1
t = t.replace(u"## 22 ", u"## 21 ")
t = t.replace(u"第 22 节", PH).replace(u"第 21 节", u"第 13 节").replace(PH, u"第 21 节")
new = t.split(u"\n")
ob = raw.encode("utf-8")
nb = t.encode("utf-8")
assert nb.count(b"\r") == 0
from collections import Counter
def norm(l):
    if l == old_head:
        l = block[0]
    elif l.startswith(u"## 22 "):
        l = u"## 21 " + l[len(u"## 22 "):]
    return l.replace(u"第 22 节", PH2).replace(
        u"第 21 节", u"第 13 节").replace(PH2, u"第 21 节")
assert Counter(norm(l) for l in L) == Counter(new), "内容行集不等"
print(u"block=%dB head:%s" % (len(u"\n".join(block).encode("utf-8")), block[0][:44]))
print(u"lines with 第21节=%d 第22节=%d  changed_lines=%d delta=%+dB" %
      (n21, n22, sum(1 for a,b in zip(L,new) if a!=b), len(nb) - len(ob)))
nums = []
for l in new:
    m = re.match(u"^## *(?:\u00a7 ?)?(\\d+)(?:[. ]|$)", l)
    if m:
        nums.append(int(m.group(1)))
assert nums == list(range(len(nums))), nums
print(u"nums=%s len=%d" % (nums, len(nums)))
assert u"第 22 节" not in t and u"\x01" not in t
if apply:
    io.open(u"_work/D497.pre-mig13.md", "w", encoding="utf-8").write(raw)
    io.open(P, "wb").write(nb)
print(u"APPLY=%s" % apply)
