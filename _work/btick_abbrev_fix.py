# -*- coding: utf-8 -*-
# 缩写式位置串的闭合符误打成 $：`local:694-780$ 应为 `local:694-780`。
# STRICT 族（带 .tex 扩展名）已封零，这一族当时不在它的正则视野里。
# 三道护栏，缺一不改：
#   1) 该行 $ 数为奇（btick_bulk 同律：只有真少一枚闭合符时才会让整行变奇）；
#   2) 把命中的 n 枚 $ 换成反引号后该行仍为偶（(count-n) 为偶），否则整行跳过；
#   3) 命中点不能在 ``` 围栏内（逐字引文里的 $ 是源文内容，不是我们的错字）；
#   另加一条：命中的 $ 后面紧跟反引号的（即 `$…` 形态）不动，那是另一族。
# 用法：python _work/btick_abbrev_fix.py [--apply] [D07 D08 ...]；不给号即全库。
import glob
import io
import os
import re
import sys

sys.stdout.reconfigure(encoding="utf-8")
TICK = chr(96)
PAT = re.compile(TICK + u"([A-Za-z0-9_.\\-]+:[A-Za-z0-9_.,\\-]+)[$]")
FENCE = TICK * 3
APPLY = u"--apply" in sys.argv
ONLY = set(a for a in sys.argv[1:] if re.match(u"^D[0-9]+$", a))

tot_notes = tot_flips = tot_skip = 0
for p in sorted(glob.glob(u"研究笔记/D*.md")):
    base = os.path.basename(p)
    k = base[:base.find(u"-")] if u"-" in base else base
    if ONLY and k not in ONLY:
        continue
    raw = io.open(p, encoding="utf-8", errors="replace").read()
    L = raw.split(u"\n")
    inf, mask = False, []
    for l in L:
        if l.strip().startswith(FENCE):
            inf = not inf
        mask.append(inf)
    new = list(L)
    hits = skips = 0
    for i, l in enumerate(L):
        if l.count(u"$") % 2 != 1:
            continue
        ms = [m for m in PAT.finditer(l)]
        if not ms:
            continue
        if (l.count(u"$") - len(ms)) % 2 != 0:
            skips += len(ms)
            continue
        kept = []
        for m in ms:
            nxt = m.end()
            if mask[i] or (nxt < len(l) and l[nxt] == TICK):
                skips += 1
            else:
                kept.append(m)
        if not kept:
            continue
        for m in reversed(kept):
            s, e = m.start(), m.end()
            new[i] = new[i][:e - 1] + TICK + new[i][e:]
        hits += len(kept)
    if not hits:
        continue
    ob = raw.encode("utf-8")
    nb = u"\n".join(new).encode("utf-8")
    assert len(ob) == len(nb), (k, len(ob), len(nb))
    assert ob.count(b"$") - nb.count(b"$") == hits
    assert nb.count(b"`") - ob.count(b"`") == hits
    assert nb.count(b"\r") == ob.count(b"\r")
    odd_after = [i + 1 for i, l in enumerate(new) if l.count(u"$") % 2 == 1]
    print(u"%s flips=%d skipped=%d odd_after=%s size=%d" % (k, hits, skips, odd_after[:6], len(nb)))
    tot_notes += 1
    tot_flips += hits
    tot_skip += skips
    if APPLY:
        io.open(u"_work/%s.pre-abbrtick.md" % k, u"w", encoding="utf-8", newline="\n").write(raw)
        io.open(p, "wb").write(nb)
print(u"NOTES=%d FLIPS=%d SKIPPED=%d APPLY=%s" % (tot_notes, tot_flips, tot_skip, APPLY))
