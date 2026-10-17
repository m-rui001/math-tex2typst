# -*- coding: utf-8 -*-
# 只读：把每个命中点前后 3 行上下文导出，用于 REPAIR/KEEP 判类。
import glob
import io
import os
import re

OPEN_MARK = chr(60) + chr(33) + chr(45) + chr(45)
CLOSE_MARK = chr(45) + chr(45) + chr(62)

sites = []
with io.open(u"E:/math/_work/html_comment_sites.txt", encoding="utf-8") as f:
    for ln in f:
        if ln.startswith(u"#") or ln.startswith(u"NOTE" + chr(9)):
            continue
        parts = ln.rstrip(chr(10)).split(chr(9))
        if len(parts) < 4:
            continue
        sites.append((parts[0], int(parts[1]), parts[2], parts[3]))

out = []
for nid, lineno, occ, text in sites:
    path = glob.glob(u"E:/math/\u7814\u7a76\u7b14\u8bb0/" + nid + u"-*.md")
    lines = io.open(path[0], encoding="utf-8").read().split(chr(10))
    stripped = text.strip()
    whole = stripped.startswith(OPEN_MARK) and stripped.endswith(CLOSE_MARK)
    bal = text.count(CLOSE_MARK)
    inback = text.count(chr(96))
    out.append(u"=== %s L%d occ=%s close_on_line=%d backticks=%d whole_line=%s file_lines=%d" % (
        nid, lineno, occ, bal, inback, whole, len(lines)))
    lo = max(0, lineno - 4)
    hi = min(len(lines), lineno + 3)
    for i in range(lo, hi):
        mark = u">>>" if (i + 1) == lineno else u"   "
        out.append(u"%s %5d|%s" % (mark, i + 1, lines[i][:300]))
    out.append(u"")

io.open(u"E:/math/_work/html_comment_ctx.txt", "wb").write(
    (chr(10).join(out) + chr(10)).encode("utf-8"))
