# -*- coding: utf-8 -*-
# 缩写式位置引用的闭合反引号误打成 $：btick_bulk 的 STRICT 要求 `名字.tex:行`，
# 旧笔记大量写 `local:694-780`、`labels:503-616` 这种无扩展名缩写，整族对它隐形。
# 形如：反引号开、内容是 名字:数字(-数字)、紧接一枚 $ 而没有闭反引号。
import glob
import io
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8")
B = chr(92)
TICK = chr(96)
PAT = re.compile(TICK + u"([A-Za-z0-9_.\\-]+:[A-Za-z0-9_.\\-]+)[$]")

tot = 0
notes = 0
rows = []
for p in sorted(glob.glob(u"研究笔记/D*.md")):
    t = io.open(p, encoding="utf-8", errors="replace").read()
    hits = 0
    for i, l in enumerate(t.split(u"\n")):
        for m in PAT.finditer(l):
            hits += 1
            if len(rows) < 15:
                rows.append((os.path.basename(p)[:10], i + 1, m.group(0)[:40]))
    if hits:
        notes += 1
        tot += hits
print(u"缩写式闭合误写命中 =", tot, u" 笔记数 =", notes)
for r in rows:
    print(r)
