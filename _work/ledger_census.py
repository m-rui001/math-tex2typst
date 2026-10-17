# -*- coding: utf-8 -*-
# 台账连续性普查：表头唯一性 + 脱队数据行的形状，只量不改。
import glob
import io
import os
import sys

sys.stdout.reconfigure(encoding="utf-8")
HDR = (u"| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | "
       u"\u4f4d\u7f6e(\u6587\u4ef6:\u884c) | \u88ab\u8c01\u6d88\u8d39 | "
       u"\u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |")
CELL = u"\u6570\u503c\u6216\u589e\u957f\u7387"          # 表头单元文字
SEP = u"| --- | --- | --- | --- | --- |"
FLIGHT = set(u"D741 D691 D227 D598".split())
stats = {"notes": 0, "no_hdr": 0, "multi_hdr": 0,
         "stray_notes": 0, "stray_rows": 0, "stray_hdr_rows": 0,
         "stray_one_run": 0, "stray_scattered": 0, "badpipe_notes": 0}
detail = []
for f in sorted(glob.glob(u"研究笔记/D*.md")):
    b = os.path.basename(f)
    k = b[:b.find("-")]
    if k in FLIGHT or not b.startswith("D"):
        continue
    stats["notes"] += 1
    L = io.open(f, encoding="utf-8").read().split(u"\n")
    hs = [i for i, l in enumerate(L) if l == HDR]
    if len(hs) == 0:
        stats["no_hdr"] += 1
        continue
    if len(hs) > 1:
        stats["multi_hdr"] += 1
    h = hs[0]
    e = h + 2 if h + 1 < len(L) and L[h + 1].strip() == SEP else h + 1
    while e < len(L) and L[e].startswith(u"| "):
        e += 1
    stray = [(i, l) for i, l in enumerate(L)
             if i >= e and l.startswith(u"| ") and (l.count(u"|") == 6
             or CELL in l)]
    if not stray:
        continue
    hdr_rows = [i for i, l in stray if CELL in l or l.strip() == SEP]
    rows = len(stray) - len(hdr_rows)
    stats["stray_notes"] += 1
    stats["stray_rows"] += rows
    stats["stray_hdr_rows"] += len(hdr_rows)
    idx = [i for i, _ in stray if i not in hdr_rows]
    one_run = bool(idx) and (len(idx) == 1 or all(
        idx[j + 1] - idx[j] <= 2 for j in range(len(idx) - 1)))
    if one_run:
        stats["stray_one_run"] += 1
    elif idx:
        stats["stray_scattered"] += 1
    bad = [i for i, l in enumerate(L) if l.startswith(u"| ") and l.count(u"|") != 6]
    if bad:
        stats["badpipe_notes"] += 1
    detail.append((k, rows, len(hdr_rows), one_run, len(bad)))

print(stats)
print("sample (ID, 脱队数据行, 脱队表头行, 单段?, 竖线数异常行):")
for t in detail[:25]:
    print("   ", t)
