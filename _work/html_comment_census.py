# -*- coding: utf-8 -*-
# 只读普查：扫描全部研究笔记里遗留的 HTML 注释起始标记 "<!--"。
# 输出 _work/html_comment_sites.txt，一行一个命中点。不做任何修改。
import glob
import io
import os
import re

OPEN_MARK = chr(60) + chr(33) + chr(45) + chr(45)          # "<!--"
CLOSE_MARK = chr(45) + chr(45) + chr(62)                    # "-->"

NOTES = sorted(glob.glob(u"E:/math/" + u"\u7814\u7a76\u7b14\u8bb0" + u"/D*.md"))

rows = []
total_occ = 0
notes_hit = 0
files_with_cr = []

for path in NOTES:
    base = os.path.basename(path)
    m = re.match(r"(D\d+)-", base)
    note_id = m.group(1) if m else base
    raw = io.open(path, "rb").read()
    cr = raw.count(bytes([13]))
    if cr:
        files_with_cr.append((note_id, cr))
    text = raw.decode("utf-8")
    occ = text.count(OPEN_MARK)
    if not occ:
        continue
    notes_hit += 1
    lines = text.split(chr(10))
    for idx, line in enumerate(lines):
        n = line.count(OPEN_MARK)
        if not n:
            continue
        total_occ += n
        window = line if len(line) <= 160 else line[:160] + u"..."
        rows.append(u"%s\t%d\t%d\t%s" % (note_id, idx + 1, n, window))
        # 同行是否配平（有 -->）
        bal = line.count(CLOSE_MARK)

hdr = [u"NOTE\tLINE\tOCC\tLINE_TEXT", u"# total_marker_lines=%d total_notes=%d" % (len(rows), notes_hit)]
out = chr(10).join(hdr + rows) + chr(10)
io.open(u"E:/math/_work/html_comment_sites.txt", "wb").write(out.encode("utf-8"))

summary = [
    u"notes scanned: %d" % len(NOTES),
    u"lines containing opening marker: %d" % len(rows),
    u"opening marker occurrences (sites): %d" % total_occ,
    u"notes hit: %d" % notes_hit,
    u"notes with CR bytes: %s" % (files_with_cr,),
]
io.open(u"E:/math/_work/html_comment_census_summary.txt", "wb").write(
    (chr(10).join(summary) + chr(10)).encode("utf-8"))
