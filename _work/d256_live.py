# -*- coding: utf-8 -*-
# 只读复测 D256：并发写者接手后的当前形态（探针是否仍为 0、CR、行数、我的修复是否仍在）。
import glob
import io

NL = chr(10)
OPEN_MARK = chr(60) + chr(33) + chr(45) + chr(45)
path = glob.glob(u"E:/math/\u7814\u7a76\u7b14\u8bb0/D256-*.md")[0]
raw = io.open(path, "rb").read()
text = raw.decode("utf-8")
lines = text.split(NL)
snap = io.open(u"E:/math/_work/pre_edit/D256.md", encoding="utf-8").read().split(NL)
out = []
out.append(u"D256 lines=%d cr=%d markers=%d bytes=%d" % (len(lines), raw.count(bytes([13])), text.count(OPEN_MARK), len(raw)))
out.append(u"snapshot lines=%d markers=%d bytes=%d" % (len(snap), sum(l.count(OPEN_MARK) for l in snap), len(u"\n".join(snap).encode("utf-8"))))
out.append(u"L188..191 now:")
for i in range(186, 192):
    if i < len(lines):
        out.append(u"  %4d|%s" % (i + 1, lines[i][:90]))
# 前 189 行是否与"探针置空后的基线"完全一致
head_ok = True
first_bad = None
for i in range(0, min(189, len(lines))):
    e = u"" if i == 188 else snap[i]
    if lines[i] != e:
        head_ok = False
        first_bad = (i + 1, e[:70], lines[i][:70])
        break
out.append(u"first189_lines_match_my_repaired_baseline=%s %s" % (head_ok, first_bad))
io.open(u"E:/math/_work/d256_live.txt", "wb").write((NL.join(out) + NL).encode("utf-8"))
