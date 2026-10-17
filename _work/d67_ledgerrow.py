# -*- coding: utf-8 -*-
# D67 台账脱队行：第 534 行格内用裸竖线写绝对值，竖线数 10≠6，Markdown 把该行拆成额外格。
# 单 token 回改成 \lvert/\rvert；断言只允许该行竖线 10->6、全文 | 少 4、$ 与反引号与行数不变。
import glob
import io
import sys

APPLY = u"--apply" in sys.argv
p = glob.glob(u"研究笔记/D67-*.md")[0]
raw = io.open(p, "rb").read().decode("utf-8")
B = chr(92)
old = u"$|" + B + u"sigma|+|" + B + u"tau|=l$"
new = (u"$" + B + u"lvert" + B + u"sigma" + B + u"rvert+"
       + B + u"lvert" + B + u"tau" + B + u"rvert=l$")
lines = raw.split(u"\n")
i = 533
# 全文该串有 3 处，另两处是正文数学里的合法裸竖线：只在这一行内定位替换。
print("全文 occurrences=%d  行内=%d" % (raw.count(old), lines[i].count(old)))
assert lines[i].count(old) == 1, u"行内不唯一，停手"
assert old in lines[i], repr(lines[i][:90])
before = lines[i].count(u"|")
lines[i] = lines[i].replace(old, new)
out = u"\n".join(lines)
assert out.count(u"$") == raw.count(u"$")
assert out.count(u"`") == raw.count(u"`")
assert out.count(u"|") == raw.count(u"|") - 4
assert len(out.split(u"\n")) == len(raw.split(u"\n"))
assert u"\r" not in out
print("line534 pipes %d->%d  bytes %d->%d" % (
    before, lines[i].count(u"|"), len(raw.encode("utf-8")), len(out.encode("utf-8"))))
if APPLY:
    io.open(u"_work/D67.pre-ledgerfix.md", "wb").write(raw.encode("utf-8"))
    io.open(p, "wb").write(out.encode("utf-8"))
    print("APPLIED")
