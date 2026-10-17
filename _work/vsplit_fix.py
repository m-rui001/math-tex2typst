# -*- coding: utf-8 -*-
u"""给被吞进控制词字母修复：\lVertP -> \lVert P。只处理本次参数宏展开造成的 16 篇。"""
import glob, os, re, io, sys

APPLY = u"--apply" in sys.argv

CWS = (u"lVert", u"rVert", u"Vert", u"lvert", u"rvert")
# \mid 单列并排除 \middle：那是真命令，按「控制字后紧跟字母」会被拆成 \mid dle。
PAT = re.compile(u"\\\\(" + u"|".join(CWS) + u"|mid(?!dle))(?=[A-Za-z])")

KEYS = [a for a in sys.argv[1:] if not a.startswith(u"--")]

tot = 0
for k in KEYS:
    cur = glob.glob(os.path.join(u"研究笔记", k + u"-*.md"))
    if not cur:
        print(u"MISSING " + k)
        continue
    p = cur[0]
    raw = io.open(p, encoding="utf-8", newline="").read()
    assert u"\r" not in raw, k
    text = raw.replace(u"\r\n", u"\n")
    hits = []
    for line in text.split(u"\n"):
        if PAT.search(line):
            hits.append(line)
    new = PAT.sub(u"\\\\\\g<1> ", text)
    assert PAT.search(new) is None, k
    n = sum(len(PAT.findall(h)) for h in hits)
    tot += n
    d = len(new.encode(u"utf-8")) - len(text.encode(u"utf-8"))
    print(u"%-6s sites=%-3d bytes=%+d  tick=%d->%d dollar=%d->%d pipe=%d->%d" % (
        k, n, d, text.count(u"`"), new.count(u"`"),
        text.count(u"$"), new.count(u"$"),
        text.count(u"|"), new.count(u"|")))
    if hits:
        s = hits[0]
        m = PAT.search(s)
        i = max(0, m.start() - 40)
        print(u"       sample: " + s[i:m.end() + 40])
    if APPLY:
        io.open(p, "w", encoding="utf-8", newline="").write(new)

print(u"APPLY=%s total_sites=%d" % (APPLY, tot))
