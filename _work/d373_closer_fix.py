# -*- coding: utf-8 -*-
# D373 第 271 行的闭合符错位：作者自己在勘误节（第 745 行）申报过这处。
# btick_bulk.py 的纯翻转会把这行留下三枚反引号（行末那枚还留着），故此处按"把闭符归位"改：
# `$` 换成反引号，并删掉行末那枚多出来的反引号；`之前` 两字作为正文保留，不删内容。
import glob
import io
import re
import sys

sys.stdout.reconfigure(encoding="utf-8")

hits = glob.glob(u"研究笔记/D373-*.md")
assert len(hits) == 1, hits
PATH = hits[0]
LINE = 271
OLD = u"`rows.tex:264-271$ 之前`"
NEW = u"`rows.tex:264-271` 之前"

raw = io.open(PATH, encoding="utf-8").read()
L = raw.split(u"\n")
l = L[LINE - 1]
assert l.count(u"$") == 3, l.count(u"$")
assert l.count(u"`") == 2
assert l.count(OLD) == 1, l.count(OLD)

b = raw.encode("utf-8")
L[LINE - 1] = l.replace(OLD, NEW)
nb = u"\n".join(L).encode("utf-8")

assert len(nb) == len(b) - 1, (len(b), len(nb))
assert nb.count(b"$") == b.count(b"$") - 1
assert nb.count(b"`") == b.count(b"`")
assert nb.count(b"\r") == b.count(b"\r")
assert u"\n".join(L).split(u"\n").__len__() == len(L)
assert L[744].count(u"$") == 1  # 勘误节那行逐字引用坏形，按 INSTRUMENT-FP 律不动

odd = [i + 1 for i, x in enumerate(u"\n".join(L).split(u"\n")) if x.count(u"$") % 2 == 1]
print(u"bytes %d->%d lines=%d odd_after=%s" % (len(b), len(nb), len(L), odd))
if u"--apply" in sys.argv:
    io.open(u"_work/D373.pre-btickfix.md", u"w", encoding="utf-8").write(raw)
    io.open(PATH, "wb").write(nb)
    print(u"APPLIED")
