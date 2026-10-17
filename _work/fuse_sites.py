# -*- coding: utf-8 -*-
# 融合体的落点普查：fuse_probe.js 判出的每一枚「命令名＋字母」，在全库定位到篇与行，
# 并区分正文数学跨度／行内代码／围栏引文——后两档是素材逐字引文，不许动刀。
# 只读不落盘。用法：python _work/fuse_sites.py [--show N]
import glob
import io
import json
import os
import re

TOKS = json.load(io.open(u"_work/fuse_tokens.json", encoding=u"utf-8"))
SEL = [t for t in TOKS if len(t[u"prefix"]) >= 3 and len(t[u"tail"]) <= 3]
SHOW = u"--show" in __import__(u"sys").argv
N = int(__import__(u"sys").argv[-1]) if SHOW and __import__(u"sys").argv[-1].isdigit() else 30

PATS = [(t, re.compile(re.escape(t[u"tok"]) + u"(?![A-Za-z])")) for t in SEL]
rows = []
body = code = fence = 0
notes_hit = set()
for f in sorted(glob.glob(u"研究笔记/D*.md")):
    key = os.path.basename(f).split(u"-")[0]
    lines = io.open(f, encoding=u"utf-8", newline=u"\n").read().split(u"\n")
    infence = False
    hits = []
    for i, l in enumerate(lines):
        if l.strip().startswith(u"```"):
            infence = not infence
            continue
        for t, pat in PATS:
            n = len(pat.findall(l))
            if not n:
                continue
            # 行内反引号奇偶判在码内还是码外
            if infence:
                fence += n
                hits.append((i + 1, t[u"tok"], n, u"fence"))
            else:
                intick = 0
                for m in pat.finditer(l):
                    ticks = l[:m.start()].count(u"`")
                    if ticks % 2 == 1:
                        code += n
                        kind = u"code"
                    else:
                        body += n
                        kind = u"body"
                    hits.append((i + 1, t[u"tok"], n, kind))
    if hits:
        notes_hit.add(key)
        rows.append((key, len(hits), sum(h[2] for h in hits), hits[:4]))

rows.sort(key=lambda r: -r[2])
out = [u"tokens_selected=%d/%d notes=%d body=%d code=%d fence=%d" % (
    len(SEL), len(TOKS), len(notes_hit), body, code, fence)]
for key, nh, occ, hs in rows[:N]:
    out.append(u"%s lines=%d occ=%d %s" % (key, nh, occ, u" ".join(
        u"%d:%s x%d(%s)" % h for h in hs)))
io.open(u"_work/fuse_sites.txt", u"wb").write(u"\n".join(out).encode(u"utf-8"))
print(u"notes=%d body=%d code=%d fence=%d -> _work/fuse_sites.txt" % (
    len(notes_hit), body, code, fence))
