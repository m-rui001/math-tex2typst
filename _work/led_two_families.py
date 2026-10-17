# -*- coding: utf-8 -*-
# 两族台账结构缺陷定位：重复标准表头 / 无表头的孤立分隔行
import io, glob, os, re

SEP = u"| --- | --- | --- | --- | --- |"
HDR = re.compile(u"(?m)^\\| *(符号|记号) *\\|")
DUP = ["D37", "D42", "D44", "D47"]

out = io.open("E:/math/_work/led_two_families.txt", "w", encoding="utf-8", newline="\n")

out.write(u"### A 族：符号表头出现两次以上\n")
for i in DUP:
    f = glob.glob("E:/math/研究笔记/" + i + "-*.md")[0]
    s = io.open(f, encoding="utf-8").read()
    L = s.split("\n")
    pos = [m.start() for m in HDR.finditer(s)]
    heads = [(j + 1, l[:40]) for j, l in enumerate(L) if l.startswith("## ")]
    out.write("-- %s  heads=%d  furows=%d\n" % (i, len(heads), s.count(u"| 符号 |")))
    for m in re.finditer(u"(?m)^\\| *符号 *\\|.*$", s):
        ln = s[:m.start()].count("\n") + 1
        nxt = L[ln] if ln < len(L) else ""
        nxt2 = L[ln + 1] if ln + 1 < len(L) else ""
        out.write("   line %d: %s\n     next: %s\n     after: %s\n" % (
            ln, m.group(0)[:70], nxt[:70], nxt2[:70]))

out.write(u"\n### B 族：分隔行的前一行不是表格行\n")
tot = 0
for f in sorted(glob.glob("E:/math/研究笔记/D*.md")):
    s = io.open(f, encoding="utf-8").read()
    L = s.split("\n")
    orph = []
    for j, l in enumerate(L):
        if l.strip() != SEP:
            continue
        prev = L[j - 1].strip() if j else ""
        if not (prev.startswith(u"|") and prev.endswith(u"|")):
            orph.append(j + 1)
    if orph:
        tot += len(orph)
        out.write("%s sep_total=%d orphan=%s\n" % (
            os.path.basename(f)[:44], s.count(SEP), orph[:12]))
out.write("orphan_rows=%d\n" % tot)
out.close()
print("ok")
