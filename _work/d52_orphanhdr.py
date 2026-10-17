# -*- coding: utf-8 -*-
# D52 收稿修补两件事：
#   (1) §29 的数据块（535--557）自己声明「沿用 §19 表头、不再重抄」，于是这段没有表头，
#       gate 从唯一的 HDR 往后数只数到 42 行；补发「记号」表头＋标准分隔行让这段可解析，
#       HDR2 与 SEP 都不等于 gate 的字面量，所以 hdr／sep 两个计数不动。
#   (2) 三行格内的绝对值是裸竖线（536、538、554），每行因此 8 枚竖线；只把那一处同形
#       字符换成 \lvert...\rvert，内容一字不增不减。
import glob
import io
import re
import sys

sys.stdout.reconfigure(encoding="utf-8")

HDR = (u"| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | \u4f4d\u7f6e(\u6587\u4ef6:\u884c) | "
       u"\u88ab\u8c01\u6d88\u8d39 | \u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |")
HDR2 = HDR.replace(u"\u7b26\u53f7", u"\u8bb0\u53f7", 1)
SEP = u"| --- | --- | --- | --- | --- |"

# 只在那一行台账内改：同一串数学式在正文里还会出现，正文的裸竖线不是缺陷。
FIXES = [
    (536, u"$|H|\\delta^2$", u"$\\lvert H\\rvert\\delta^2$"),
    (538, u"$\\sqrt{\\alpha_d}\\delta\\sqrt{|H|}$", u"$\\sqrt{\\alpha_d}\\delta\\sqrt{\\lvert H\\rvert}$"),
    (554, u"$|e_i|\\leq 2^hL", u"$\\lvert e_i\\rvert\\leq 2^hL"),
]

APPLY = u"--apply" in sys.argv
p = glob.glob(u"研究笔记/D52-*.md")[0]
raw = io.open(p, encoding="utf-8").read()
assert u"\r" not in raw
L = raw.split(u"\n")

pipes = {}
for l in L:
    if l.startswith(u"| "):
        n = l.count(u"|")
        pipes[n] = pipes.get(n, 0) + 1
assert pipes == {6: 64, 8: 3}, pipes
assert raw.count(HDR) == 1, raw.count(HDR)
n0 = len(L)
d0 = raw.count(u"$")
b0 = raw.count(u"`")

for i in (536, 538, 554):
    assert L[i - 1].count(u"|") == 8, i
for ln, old, new in FIXES:
    assert L[ln - 1].count(old) == 1, (ln, old, L[ln - 1].count(old))
    L[ln - 1] = L[ln - 1].replace(old, new, 1)
    assert L[ln - 1].count(u"|") == 6, (ln, L[ln - 1].count(u"|"))

assert L[534].startswith(u"| $\\mathcal M_0(B)$"), L[534][:40]
assert not L[533].startswith(u"| ")
L[534:534] = [HDR2, SEP]
raw = u"\n".join(L)

assert len(L) == n0 + 2, (n0, len(L))
assert raw.count(u"$") == d0 and raw.count(u"`") == b0
assert u"\r" not in raw
pipes = {}
for l in L:
    if l.startswith(u"| "):
        n = l.count(u"|")
        pipes[n] = pipes.get(n, 0) + 1
assert pipes == {6: 64 + 2 + 3}, pipes
assert raw.count(HDR) == 1
print("lines", n0, "->", len(L), "bytes", len(raw.encode("utf-8")),
      "hdr2 at", 535, "pipes", pipes, "dollar", raw.count(u"$"), "apply", APPLY)
if APPLY:
    io.open(p, "w", encoding="utf-8", newline="\n").write(raw)
    print("WROTE", p)
