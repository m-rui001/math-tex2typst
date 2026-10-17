# -*- coding: utf-8 -*-
# 判据实验：124 KB 量级的中文 markdown，Edit 一把工具落盘会不会把整篇换行写成 CRLF。
# 步骤：把台账复制成 LF 副本 -> 记录基线 -> 交由 Edit 工具改一行 -> 再量一次。
import io

src = u"研究笔记/队列台账.md"
dst = u"_work/crlf_bigcopy.md"
b = io.open(src, "rb").read()
lf = b.replace(b"\r\n", b"\n").replace(b"\r", b"\n")
io.open(dst, "wb").write(lf)
print("copy bytes", len(lf), "CR", lf.count(b"\r"), "LF", lf.count(b"\n"))
