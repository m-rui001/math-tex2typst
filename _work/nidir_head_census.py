# -*- coding: utf-8 -*-
# 别名查重的盲区普查：头部（前 3000 字）里一个 preprints 路径都没登记的笔记。
# 这类笔记在「给目录名反查登记它的笔记」里永远不出现，D04 与 D500 同篇就是这么漏的。
import glob
import io
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8")
PAT = re.compile(u"preprints[/\\\\]+([A-Za-z0-9][A-Za-z0-9._\\-]*)")
FULL = re.compile(u"preprints[/\\\\]+([A-Za-z0-9][A-Za-z0-9._\\-]*)")

nadir = []
for p in sorted(glob.glob(u"研究笔记/D*.md")):
    t = io.open(p, encoding="utf-8", errors="replace").read()
    if PAT.search(t[:3000]):
        continue
    hits = sorted(set(FULL.findall(t)))
    nadir.append((os.path.basename(p).split(u"-")[0], len(t.encode("utf-8")),
                  hits[0][:56] if hits else u"(全文无路径)"))
print(u"头部无登记数 =", len(nadir))
for k, b, d in nadir:
    print(k, b, d)
