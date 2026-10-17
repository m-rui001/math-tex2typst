# -*- coding: utf-8 -*-
# 只读：确认 D256 的 gate 缺陷落在并发写者追加的区间（行 >189），不在本次修复的前 189 行。
import glob
import io
import re

NL = chr(10)
EM = chr(8212)
ERSHI = u"\u800c\u662f"
path = glob.glob(u"E:/math/\u7814\u7a76\u7b14\u8bb0/D256-*.md")[0]
text = io.open(path, encoding="utf-8").read()
lines = text.split(NL)
head = NL.join(lines[:189])          # 本次修复触及并验证过的前 189 行
tail = NL.join(lines[189:])          # 并发写者追加的部分
CONTRA = re.compile(u"\u867d\u7136|\u4f46\u662f|\u53cd\u800c|\u7136\u800c|\u5c3d\u7ba1|\u4e0d\u8fc7")
out = []
out.append(u"D256 total_lines=%d" % len(lines))
for name, seg in ((u"head(1-189)", head), (u"tail(190-)", tail)):
    out.append(u"  %s emDash=%d ershi=%d bc=%d contrast=%d cc=%d size=%d" % (
        name, seg.count(EM), seg.count(ERSHI), seg.count(u"\u800c\u4e0d\u662f"),
        len(CONTRA.findall(seg)), seg.count(u"\uff0c\uff0c"), len(seg.encode("utf-8"))))
out.append(u"  head markers=%d" % head.count(chr(60) + chr(33) + chr(45) + chr(45)))
io.open(u"E:/math/_work/d256_defect_locus.txt", "wb").write((NL.join(out) + NL).encode("utf-8"))
