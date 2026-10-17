# -*- coding: utf-8 -*-
# 修复后复测：重写一份站点清单（写到 _after 文件，保留 step A 的原始普查件不动）。
import glob
import io
import os
import re

OPEN_MARK = chr(60) + chr(33) + chr(45) + chr(45)
NOTES = sorted(glob.glob(u"E:/math/" + u"\u7814\u7a76\u7b14\u8bb0" + u"/D*.md"))
rows, occ, hit = [], 0, 0
for path in NOTES:
    m = re.match(r"(D\d+)-", os.path.basename(path))
    nid = m.group(1) if m else os.path.basename(path)
    text = io.open(path, "rb").read().decode("utf-8")
    if OPEN_MARK not in text:
        continue
    hit += 1
    for i, line in enumerate(text.split(chr(10))):
        n = line.count(OPEN_MARK)
        if n:
            occ += n
            rows.append(u"%s\t%d\t%d\t%s" % (nid, i + 1, n, line if len(line) <= 160 else line[:160] + u"..."))
io.open(u"E:/math/_work/html_comment_sites_after.txt", "wb").write(
    (u"NOTE\tLINE\tOCC\tLINE_TEXT" + chr(10) +
     u"# post-repair recount: sites=%d notes=%d files=%d" % (occ, hit, len(NOTES)) + chr(10) +
     chr(10).join(rows) + chr(10)).encode("utf-8"))
