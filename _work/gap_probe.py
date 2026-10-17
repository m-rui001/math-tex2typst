# -*- coding: utf-8 -*-
# 普查 C_gap 剩余成员：缺号是「整节内容丢失」还是「标题被锚点吃掉/漏发」？
import io
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8")
ROOT = u"研究笔记"
GAPS = {
    "244": [11, 12], "290": [15], "351": [15], "379": [31], "497": [13],
    "560": [9], "561": [9], "569": [14, 27], "574": [10, 13, 17], "578": [7],
    "643": [9], "747": [22], "758": [4],
}
S = u"\u00a7"
INLINE = re.compile(u"## " + S + u"? *(\\d+)")
KW = (u"锚点", u"顶掉", u"吞", u"标题行", u"落位", u"缺号", u"独占一行")

for d, miss in sorted(GAPS.items()):
    name = [n for n in os.listdir(ROOT) if n.startswith("D%s-" % d)]
    if not name:
        print("D%s NOFILE" % d)
        continue
    path = os.path.join(ROOT, name[0])
    raw = io.open(path, encoding="utf-8").read()
    lines = raw.split(u"\n")
    heads = [(i + 1, l) for i, l in enumerate(lines) if l.startswith(u"## ")]
    inline = []
    for i, l in enumerate(lines):
        if l.startswith(u"## "):
            continue
        for m in INLINE.finditer(l):
            inline.append((i + 1, m.group(1), l[m.start():m.start() + 46]))
    kwlines = [(i + 1, l[:70]) for i, l in enumerate(lines)
               if any(k in l for k in KW)]
    refhits = []
    for k in miss:
        refhits.append((k, [i + 1 for i, l in enumerate(lines)
                            if (S + str(k)) in l]))
    print("    ref_lines=%s" % refhits)
    print("=== D%s size=%d heads=%d seq=%s" % (
        d, len(raw.encode("utf-8")), len(heads),
        [re.match(u"## " + S + u"? *(\\d+)", l).group(1)
         for i, l in heads if re.match(u"## " + S + u"? *(\\d+)", l)]))
    print("    missing=%s inline_headings=%s" % (miss, inline))
    print("    kw_decl=%s" % kwlines[:6])
