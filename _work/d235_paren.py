# -*- coding: utf-8 -*-
import io, glob, re

p = glob.glob("E:/math/研究笔记/D235-*.md")[0]
s = io.open(p, encoding="utf-8").read()
L = s.split("\n")
out = io.open("E:/math/_work/d235_paren.txt", "w", encoding="utf-8", newline="\n")
for m in re.compile(r"\\\(").finditer(s):
    ln = s[:m.start()].count("\n") + 1
    out.write("PAREN line=%d | %s\n" % (ln, L[ln - 1][:300]))
for m in re.compile(r"\\\)", ).finditer(s):
    ln = s[:m.start()].count("\n") + 1
    out.write("PARENC line=%d | %s\n" % (ln, L[ln - 1][:150]))
for m in re.compile(r"\\(abs|norm|articleid)(?![A-Za-z])").finditer(s):
    ln = s[:m.start()].count("\n") + 1
    out.write("MAC %s line=%d bt=%d | %s\n" % (m.group(0), ln, L[ln - 1].count("`"), L[ln - 1][:200]))
out.write("counts dollar=%d lp=%d rp=%d\n" % (s.count("$"), s.count("\\("), s.count("\\)")))
out.close()
print("ok")
