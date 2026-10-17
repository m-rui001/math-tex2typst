# -*- coding: utf-8 -*-
# 精查：反引号代码跨度之外的 \ref / \label / \eqref（可动手的群体）
import io, glob, re, os

code_span = re.compile(r"`[^`\n]*`")
pat = re.compile(r"\\(?:eq)?ref\{|\\label\{")

rows = []
tot_out = tot_in = 0
note_out = 0
for p in sorted(glob.glob("E:/math/研究笔记/D*.md")):
    s = io.open(p, encoding="utf-8", errors="replace").read()
    masked = code_span.sub(lambda m: " " * len(m.group(0)), s)
    outside = len(pat.findall(masked))
    inside = len(pat.findall(s)) - outside
    # 代码跨度里的命中只统计出现在本行有反引号的行
    tot_in += inside
    if outside:
        rows.append((os.path.basename(p), outside, inside))
        tot_out += outside
        note_out += 1
rows.sort(key=lambda z: -z[1])
out = io.open("E:/math/_work/ref_census2.txt", "w", encoding="utf-8", newline="\n")
out.write("notes_with_outside_hits=%d outside_total=%d inside_code_span_total=%d\n" % (note_out, tot_out, tot_in))
out.write("FILE | outside_spans | inside_spans\n")
for r in rows:
    out.write("%-70s %5d %5d\n" % r)
out.close()
print("ok notes=%d outside=%d inside=%d" % (note_out, tot_out, tot_in))
