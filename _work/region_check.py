# -*- coding: utf-8 -*-
# 收稿区结构复核：追加区（FROM 起）的台账续行、竖线直方图、逐行 $ 奇偶、控制字吞字母。
import glob
import io
import re
import sys

FROM = int(sys.argv[2])
p = glob.glob(u"研究笔记/%s-*.md" % sys.argv[1])[0]
lines = io.open(p, encoding="utf-8").read().split(u"\n")
seg = lines[FROM - 1:]
HDR = u"| 记号 | 数值 | 位置 | 被谁消费 | 若改动断在哪一步 |"
SEP = re.compile(u"^\\|[\\s:|-]+\\|$")
hist = {}
pipes = []
for i, l in enumerate(seg):
    if l.startswith(u"|"):
        n = l.count(u"|")
        hist[n] = hist.get(n, 0) + 1
        if n != 6 and not SEP.match(l.strip()):
            pipes.append((FROM + i, n, l[:70]))
odd = [(FROM + i, l[:70]) for i, l in enumerate(seg) if l.count(u"$") % 2]
vsp = [(FROM + i, m.group(0)) for i, l in enumerate(seg)
       for m in re.finditer(u"\\\\(?:lVert|rVert|Vert|lvert|rvert|mid(?!dle)|lfloor|upharpoonright)(?=[A-Za-z])", l)]
nsep = sum(1 for l in seg if u"-" in l and SEP.match(l.strip()))
print("seg=%d hdr=%d sep=%d rows=%d hist=%s" % (
    len(seg), sum(1 for l in seg if l == HDR),
    nsep,
    sum(1 for l in seg if l.count(u"|") == 6), hist))
print("badpipe=%s" % (pipes,))
print("dollar_odd=%d %s" % (len(odd), odd[:4]))
print("vsplit=%d %s" % (len(vsp), vsp[:6]))
std = u"| 符号 | 数值 | 位置 | 被谁消费 | 若改动断在哪一步 |"
print("std_hdr_corpus=%d" % io.open(p, encoding="utf-8").read().count(std))
