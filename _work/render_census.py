# -*- coding: utf-8 -*-
# 全库渲染缺陷复量（只读）：表内空行截断 / 孤儿分隔行 / 行内代码闭合符误打 $。
import glob
import io
import re
import sys

sys.stdout.reconfigure(encoding="utf-8")
FLIGHT = set(u"D95 D93 D452 D24 D25 D26 D28 D29 D30 D32 D34 D36 D364 D41 D44 D47 D50 D65 D68".split())
CELL = re.compile(u"^:?-+:?$")
BTICK = re.compile(u"`([A-Za-z0-9_./-]+\\.(?:tex|bib|sty|lean):[0-9]+(?: *(?:--|-|to|到) *[0-9]+)?)\\$")


def is_data(l):
    return l.startswith(u"| ") and l.count(u"|") == 6


def is_sep(l):
    if not (l.startswith(u"|") and l.endswith(u"|")):
        return False
    cells = l.strip(u"|").split(u"|")
    return len(cells) >= 2 and all(CELL.match(c.strip()) for c in cells)


n = 0
blanks = []
seps = []
bticks = []
for p in sorted(glob.glob(u"研究笔记/D*.md")):
    kid = p.split(u"\\")[-1].split(u"-")[0]
    if kid in FLIGHT:
        continue
    n += 1
    t = io.open(p, encoding="utf-8").read()
    L = t.split(u"\n")
    # 1) 数据行块内部夹空行：| 行 ... 空行 ... | 行，且中间无其它内容
    i = 0
    while i < len(L):
        if is_data(L[i]):
            j = i + 1
            gap = None
            while j < len(L) and (is_data(L[j]) or L[j] == u""):
                if L[j] == u"" and gap is None:
                    k = j + 1
                    while k < len(L) and L[k] == u"":
                        k += 1
                    if k < len(L) and is_data(L[k]):
                        gap = j
                        break
                    else:
                        break
                j += 1
            if gap is not None:
                blanks.append((kid, gap + 1))
            i = j + 1 if gap is None else gap + 1
        else:
            i += 1
    # 2) 孤儿分隔行：上一非空行不是 | 行
    for i, l in enumerate(L):
        if not is_sep(l):
            continue
        j = i - 1
        while j >= 0 and L[j] == u"":
            j -= 1
        if j < 0 or not L[j].startswith(u"|"):
            seps.append((kid, i + 1, L[j][:40] if j >= 0 else u""))
    # 3) 行内代码用 $ 收尾
    for i, l in enumerate(L):
        h = len(BTICK.findall(l))
        if h and l.count(u"$") % 2 == 1 and (l.count(u"$") - h) % 2 == 0:
            bticks.append((kid, i + 1, h))
print(u"scanned=%d blanks=%d orphan_sep=%d btick=%d" % (n, len(blanks), len(seps), len(bticks)))
for x in blanks[:20]:
    print(u"BLANK %s L%d" % x)
for x in seps[:20]:
    print(u"SEP %s L%d prev=%s" % x)
for x in bticks[:20]:
    print(u"BTICK %s L%d hits=%d" % x)
