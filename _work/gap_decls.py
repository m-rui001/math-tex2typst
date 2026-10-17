# -*- coding: utf-8 -*-
# 打印 C_gap 剩余成员里与「缺号/标题被吞」有关的申报段，供逐个判定修复通道。
import glob
import io
import re
import sys

sys.stdout.reconfigure(encoding="utf-8")
NOTES = {"244": [11, 12], "290": [15], "351": [15], "379": [31], "497": [13],
         "560": [9], "561": [9], "569": [14, 27], "643": [9], "747": [22],
         "758": [4]}
KEY = re.compile(u"(标题|缺号|锚点|编号|连续)")
S = u"\u00a7"

for d, miss in NOTES.items():
    path = glob.glob(u"研究笔记/D%s-*.md" % d)[0]
    lines = io.open(path, encoding="utf-8").read().split(u"\n")
    hits = []
    for i, l in enumerate(lines):
        if l.startswith(u"#"):
            continue
        if KEY.search(l) is None:
            continue
        if not any((S + str(k)) in l or (u"第 %s 节" % k) in l or
                   (u"第%s节" % k) in l for k in miss):
            continue
        hits.append((i + 1, l))
    print("=== D%s %s miss=%s (申报候选 %d 段)" % (
        d, path.split(u"-", 1)[1][:18], miss, len(hits)))

    for no, l in hits:
        if len(l) < 40:
            continue
        print("  L%d: %s" % (no, l[:520]))
        print()
