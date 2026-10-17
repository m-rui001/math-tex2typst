# -*- coding: utf-8 -*-
# 台账追加：python _work/ledger_append.py <草稿文件>
# LF 归一后追加，落盘按字节复量 size 与 CR。
import io
import os
import sys

DRAFT = sys.argv[1]
LP = u"研究笔记/队列台账.md"
old = io.open(LP, "rb").read()
add = io.open(DRAFT, "rb").read().replace(b"\r\n", b"\n").replace(b"\r", b"")
add = add.rstrip(b"\n") + b"\n"
assert b"\r" not in add, u"draft still has CR"
new = old.rstrip(b"\n") + b"\n\n" + add
io.open(LP, "wb").write(new)
back = io.open(LP, "rb").read()
assert back == new
print("size %d -> %d (+%d)  CR %d -> %d  getsize=%d" % (
    len(old), len(back), len(back) - len(old), old.count(b"\r"), back.count(b"\r"),
    os.path.getsize(LP)))
