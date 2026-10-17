# -*- coding: utf-8 -*-
# 重复标准表头就地修：后一份五列表头首格 符号 -> 记号（D37:1637, D44:510）
import io, glob, os, re

JOBS = [("D37", 1636), ("D44", 509)]
for ID, LN in JOBS:
    f = glob.glob("E:/math/研究笔记/" + ID + "-*.md")[0]
    raw = io.open(f, "rb").read()
    s = raw.decode("utf-8")
    L = s.split("\n")
    line = L[LN - 1]
    assert line.startswith(u"| 符号 |"), (ID, LN, line[:40])
    assert len([c for c in line.strip("|").split("|")]) == 5
    nxt = L[LN]
    assert nxt.strip() == u"| --- | --- | --- | --- | --- |", (ID, nxt[:40])
    L[LN - 1] = line.replace(u"| 符号 |", u"| 记号 |", 1)
    new = "\n".join(L)
    io.open(f, "w", encoding="utf-8", newline="\n").write(new)
    back = io.open(f, "rb").read()
    nb = back.decode("utf-8")
    print(ID, "bytes %d->%d" % (len(raw), len(back)),
          "CR=%d" % back.count(b"\r"),
          "fu=%d" % len(re.findall(u"(?m)^\\| *符号 *\\|", nb)),
          "ji=%d" % len(re.findall(u"(?m)^\\| *记号 *\\|", nb)),
          "lines %d->%d" % (len(L), nb.count("\n") + 1))
