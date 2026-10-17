# -*- coding: utf-8 -*-
# 台账格宽度一致性普查（gate 的盲区）：尺子在 _work/pipe_lib.py，与修法共用一把。
# 用法：python _work/pipe_census2.py [ID ...]（给 ID 就只查这些篇，与 pipe_fix.py 同一套 argv 语义）
import glob
import io
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from pipe_lib import bare, blocks_of

ONLY = set(a for a in sys.argv[1:] if not a.startswith(u"--"))
out, rows_bad, blocks, notes_hit, escaped = [], 0, 0, 0, 0
hist = {}
for f in sorted(glob.glob(u"研究笔记/D*.md")):
    key = re.match(u"(D\\d+)", os.path.basename(f)).group(1)
    if ONLY and key not in ONLY:
        continue
    lines = io.open(f, encoding=u"utf-8", newline=u"\n").read().split(u"\n")
    prev, bad = None, []
    for ln, text, w in blocks_of(lines):
        if prev is None or ln != prev + 1:
            blocks += 1
        prev = ln
        hist[w] = hist.get(w, 0) + 1
        escaped += text.count(u"\\|")
        if len(bare(text.strip())) != w:
            bad.append((ln, len(bare(text.strip())), w, text.strip()[:120]))
    if bad:
        notes_hit += 1
        rows_bad += len(bad)
        out.append(u"%s x%d" % (key, len(bad)))
        for ln, c, w, t in bad[:4]:
            out.append(u"   %d bare=%d width=%d %s" % (ln, c, w, t))

io.open(u"_work/pipe_census2_out.txt", "wb").write(u"\n".join(
    [u"blocks=%d table_rows=%d notes_with_mismatch=%d mismatch_lines=%d escaped_pipes=%d" % (
        blocks, sum(hist.values()), notes_hit, rows_bad, escaped),
     u"width_hist=" + u" ".join(u"%d:%d" % (k, v) for k, v in sorted(hist.items()))] + out
).encode(u"utf-8"))
print(u"blocks=%d rows=%d notes=%d lines=%d escaped=%d -> _work/pipe_census2_out.txt" % (
    blocks, sum(hist.values()), notes_hit, rows_bad, escaped))
