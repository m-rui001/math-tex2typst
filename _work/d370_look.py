# -*- coding: utf-8 -*-
# 只读：确认 D370 L90 先例形态（前一轮已清空的探针行），并核对拟修行的唯一性。
import glob
import io

OPEN_MARK = chr(60) + chr(33) + chr(45) + chr(45)
CLOSE_MARK = chr(45) + chr(45) + chr(62)

out = []
p = glob.glob(u"E:/math/\u7814\u7a76\u7b14\u8bb0/D370-*.md")[0]
lines = io.open(p, encoding="utf-8").read().split(chr(10))
out.append(u"D370 file_lines=%d markers_left=%d" % (len(lines), io.open(p, encoding="utf-8").read().count(OPEN_MARK)))
for i in range(85, 95):
    if i < len(lines):
        out.append(u"%5d|%r" % (i + 1, lines[i][:120]))
io.open(u"E:/math/_work/d370_precedent.txt", "wb").write((chr(10).join(out) + chr(10)).encode("utf-8"))
