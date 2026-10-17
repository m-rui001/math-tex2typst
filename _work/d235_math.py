# -*- coding: utf-8 -*-
import io, glob, re

p = glob.glob("E:/math/研究笔记/D235-*.md")[0]
s = io.open(p, encoding="utf-8").read()
L = s.split("\n")
out = io.open("E:/math/_work/d235_math.txt", "w", encoding="utf-8", newline="\n")
out.write("dollar=%d  paren_open=%d paren_close=%d\n" % (
    s.count("$"), s.count("\\("), s.count("\\)")))
for m in re.compile(r"\\(abs|norm|articleid)(?![A-Za-z])").finditer(s):
    ln = s[:m.start()].count("\n") + 1
    line = L[ln - 1]
    out.write("%s line=%d code_backticks=%d new=%s | %s\n" % (
        m.group(0), ln, line.count("`"), "YES" if ln >= 686 else "no", line[:170]))
out.close()
print("ok")
