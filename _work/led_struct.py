# -*- coding: utf-8 -*-
# 台账结构性普查：台账节数、标准表头份数、分隔行枚数
import io, glob, os, re

hits = []
n = 0
for f in sorted(glob.glob("E:/math/研究笔记/D*.md")):
    if os.sep + "_work" in f:
        continue
    b = io.open(f, "rb").read()
    if b.count(b"\r"):
        hits.append((os.path.basename(f), "CR", 0, 0, 0))
    s = b.decode("utf-8")
    n += 1
    heads = [l for l in s.split("\n") if l.startswith("## ")]
    led = [h for h in heads if u"台账" in h]
    std = len(re.findall(u"(?m)^\\| *(符号|记号) *\\|", s))
    sep = s.count(u"| --- | --- | --- | --- | --- |")
    bad = []
    if len(led) >= 2:
        bad.append("ledsec=%d" % len(led))
    if std >= 2:
        bad.append("hdr=%d" % std)
    if sep >= 3:
        bad.append("sep=%d" % sep)
    if bad:
        hits.append((os.path.basename(f), " ".join(bad), len(led), std, sep))
out = io.open("E:/math/_work/led_struct.txt", "w", encoding="utf-8", newline="\n")
out.write("notes=%d flagged=%d\n" % (n, len(hits)))
for h in hits:
    out.write("%s | %s | led=%d hdr=%d sep=%d\n" % (h[0][:52], h[1], h[2], h[3], h[4]))
out.close()
print("notes", n, "flagged", len(hits))
