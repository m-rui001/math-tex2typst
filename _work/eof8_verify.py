# -*- coding: utf-8 -*-
r"""内容不变量：8 条 OLD/NEW 的字符差必须是「只补定界符、字母一个不删」。
Counter(new)-Counter(old) 要只含 `}`/`$`/反引号/`\text` 的拼写部件，Counter(old)-Counter(new) 里
除 `$` 外必须为空（删掉的只可能是定界符）。
"""
import importlib.util
import io
import re
import sys
from collections import Counter

spec = importlib.util.spec_from_file_location(u'drv', u'_work/eof8_apply.py')
# 不执行驱动的落盘段：直接重读文件里的 PAIRS 字面量
src = io.open(u'_work/eof8_apply.py', encoding='utf-8').read()
ns = {}
exec(src.split(u'APPLY =')[0].replace(u'import glob', u'').replace(u'import io', u'')
     .replace(u'import os', u'').replace(u'import subprocess', u'').replace(u'import sys', u''), ns)
PAIRS = ns[u'PAIRS']
DELIM = set(u'$`{}()[]\\ ')
for cid, old, new, expect, dd, dt in PAIRS:
    ca, cb = Counter(old), Counter(new)
    lost = {k: v for k, v in ((k, ca[k] - cb[k]) for k in ca) if v > 0}
    gain = {k: v for k, v in ((k, cb[k] - ca[k]) for k in cb) if v > 0}
    bad_lost = {k: v for k, v in lost.items() if k not in u'$` '}
    letters_lost = [k for k in bad_lost if k.isalnum() or u'一' <= k <= u'鿿']
    print(u'%-6s 丢=%-28s 加=%s  %s' % (
        cid, repr(lost), repr(gain),
        u'OK' if not letters_lost else u'!!! 丢了内容字符 ' + repr(letters_lost)))
print(u'单=%d' % len(PAIRS))

# 盘上复核：这 8 行现在到底长什么样（只看改动的那一段）
import glob
import os
WATCH = [(u'D16', 303, u'\\sup_{h'), (u'D335', 244, u'再抬'), (u'D335', 304, u'再抬'),
         (u'D402', 169, u'Steinberg'), (u'D490', 139, u's^{A-1'), (u'D500', 326, u'B^{-1-c_{*}'),
         (u'D762', 493, u'n^{-5/6+15m'), (u'D765', 385, u'P_j^{')]
for cid, line, needle in WATCH:
    f = glob.glob(os.path.join(u'研究笔记', cid + u'-*.md'))[0]
    t = io.open(f, encoding='utf-8').read().split(u'\n')[line - 1]
    i = t.find(needle)
    print(u'  %s:%d  %s' % (cid, line, t[max(0, i - 26):i + 62] if i >= 0 else u'NOT FOUND ' + needle))
