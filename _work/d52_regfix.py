# -*- coding: utf-8 -*-
# D52 两处登记项的机械修：
#   (1) 旧稿第 102 行的逐字引用把开符误写成 \\(，论文原文（sections/03-weights.tex:89）
#       写的是 $s,s'\\in B$；这属"定界符字符类型错"族，按引用保真原则改回源串。
#   (2) §0 的队列行号登记缺「其他」两字，规格要求的逐字串是「其他队列第 NN 行号」。
import glob
import io
import sys

sys.stdout.reconfigure(encoding="utf-8")

B = chr(92)
# 笔记里那一枚误写是「反斜杠＋左括号」，论文源串是美元号
FIX1 = (B + u"(s,s'" + B + u"in B$", u"$s,s'" + B + u"in B$")
FIX2 = (u"（队列第 57 行号）", u"（其他队列第 57 行号）")

APPLY = u"--apply" in sys.argv
p = glob.glob(u"研究笔记/D52-*.md")[0]
raw = io.open(p, encoding="utf-8").read()
assert u"\r" not in raw
n0 = len(raw.encode("utf-8"))
l0 = raw.count(u"\n")
d0 = raw.count(u"$")

for old, new in (FIX1, FIX2):
    assert raw.count(old) == 1, (repr(old), raw.count(old))
    raw = raw.replace(old, new, 1)

assert raw.count(u"\n") == l0
assert raw.count(u"\r") == 0
assert raw.count(u"$") == d0 + 1
nb = len(raw.encode("utf-8"))
assert nb == n0 - 1 + 6, (n0, nb)
print("bytes", n0, "->", nb, "lines", raw.count(u"\n") + 1,
      "dollar", d0, "->", raw.count(u"$"))
if APPLY:
    io.open(p, "w", encoding="utf-8", newline="\n").write(raw)
    print("WROTE", p)
