# -*- coding: utf-8 -*-
# 派单查重第二步：给一个 preprints 目录名，列出「本篇素材就是它」的笔记。
# 归属判据＝该目录以 `preprints/<目录>` 的路径形态出现在稿子开头 15 行内（§0 登记块）。
# 两条被淘汰的判据都实测造过假：头部 3,000 字窗口把 D173 那种「正文里点名姊妹篇」
# 的裸目录名算成别名；「行内出现归属措辞」把 D82 第 415 行那种中途提及算成 OWNING。
import glob
import io
import json
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8")
PATH = re.compile(r"preprints[\\/]([A-Za-z0-9._-]+)")
# 第二个归属通道：_work/preamble_tables.json 的 dir（按正文对 .tex 的引用次数定，
# 覆盖那 19 篇 §0 不写路径的低号笔记——只看头部路径会把它们的真别名读成孤本）。
TBL = json.load(io.open(u"_work/preamble_tables.json", encoding=u"utf-8"))
want = sys.argv[1:]
for d in want:
    print(u"===== " + d)
    for p in sorted(glob.glob(u"研究笔记/D*.md")):
        t = io.open(p, encoding=u"utf-8", errors="replace").read()
        key = os.path.basename(p).split(u"-")[0]
        head = u"\n".join(t.split(u"\n")[:15])
        owned = d in set(PATH.findall(head)) or (TBL.get(key) or {}).get(u"dir") == d
        if owned or d in t:
            print(u"  %-6s bytes=%-8d hits=%-3d %s" % (
                key, len(t.encode(u"utf-8")), t.count(d),
                u"OWNER" if owned else u"mention-only"))
