# -*- coding: utf-8 -*-
# 分隔行印在表头之前（`|---|---|` 紧跟 `| 文件 | 字节 | …`）→ GFM 认不出表，整块掉成字面文本。
# 修法：两行互换；互换后若列数不等（分隔行格数≠表头格数），只重写分隔行自身的格数，
# 数据行与表头文字一个字节不动。用法：sep_swap.py [--apply] ID...
import glob
import io
import re
import sys

sys.stdout.reconfigure(encoding="utf-8")
SEPISH = re.compile(u"^:?-{2,}:?$")
apply = u"--apply" in sys.argv


def cells(l):
    s = l.replace(u"\\|", u"\x01")
    a = s.split(u"|")
    if a and a[0].strip() == u"":
        a = a[1:]
    if a and a[-1].strip() == u"":
        a = a[:-1]
    return [x.strip() for x in a]


for k in [a for a in sys.argv[1:] if not a.startswith(u"--")]:
    p = glob.glob(u"研究笔记/%s-*.md" % k)[0]
    raw = io.open(p, encoding="utf-8").read()
    L = raw.split(u"\n")
    done = []
    for i, l in enumerate(L):
        if not l.startswith(u"|"):
            continue
        c = cells(l)
        if not c or not all(SEPISH.match(x) for x in c):
            continue
        if i > 0 and L[i - 1].startswith(u"|") and not all(
                SEPISH.match(x) for x in cells(L[i - 1])):
            continue                       # 正规表：上面就是表头
        h = i + 1
        if h >= len(L) or not L[h].startswith(u"|"):
            continue
        hc = cells(L[h])
        if all(SEPISH.match(x) for x in hc):
            continue                       # 连续两个分隔行，另族
        style = u"|" if u"| " not in l else u"| "
        compact = l.count(u" ") == 0
        newsep = (u"|---" * len(hc) + u"|") if compact else \
                 (u"| " + u" | ".join([u"---"] * len(hc)) + u" |")
        L[i], L[h] = L[h], (l if len(c) == len(hc) else newsep)
        done.append((i + 1, len(c), len(hc)))
    if not done:
        print(u"%s none" % k)
        continue
    new = u"\n".join(L)
    from collections import Counter

    def keep(lines):
        return Counter(l for l in lines
                       if not (l.startswith(u"|") and l.count(u"|") >= 2
                               and all(SEPISH.match(x) for x in cells(l))))
    assert keep(L) == keep(raw.split(u"\n")), k
    ob = raw.encode("utf-8")
    nb = new.encode("utf-8")
    assert nb.count(b"\r") == ob.count(b"\r")
    print(u"%s swapped=%s -%+dB size=%d" % (k, done, len(nb) - len(ob), len(nb)))
    if apply:
        io.open(u"_work/%s.pre-sepswap.md" % k, "w", encoding="utf-8").write(raw)
        io.open(p, "wb").write(nb)
