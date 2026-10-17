# -*- coding: utf-8 -*-
r"""单一反斜杠＋数字的控制字普查：`\<digit>` 在数学跨里会被宏表展开（语料宏表定义了 `\0`＝`\mathbf 0`）。

用法：`PYTHONIOENCODING=utf-8 python _work/digit_cs_census.py`
用法：`PYTHONIOENCODING=utf-8 python _work/digit_cs_census.py`
只数**前面不是反斜杠**的那些（`\\0` 是矩阵换行＋列首数字，合法），逐条打 file:line＋上下文。
"""
import glob
import io
import re

BS = chr(92)
PAT = re.compile('(?<![' + BS + BS + r'])[' + BS + BS + r'][0-9]')

schema = io.open(u'_work/katex_macros.json', encoding='utf-8').read()
tbl = {}
try:
    import json
    tbl = json.loads(schema)
except Exception:
    pass
digit_keys = sorted(k for k in tbl if re.match(r'^' + BS + BS + r'[0-9]$', str(k)))
print(u'宏表里以数字为名的控制字=%s' % (
    u' '.join(u'%s->%s' % (k, json.dumps(tbl[k], ensure_ascii=False)[:40]) for k in digit_keys),))

rows = []
for p in sorted(glob.glob(u'研究笔记/D*.md')):
    text = io.open(p, encoding='utf-8').read()
    for i, line in enumerate(text.split(u'\n'), 1):
        for m in PAT.finditer(line):
            rows.append((p.split(BS)[-1], i, line[max(0, m.start() - 34):m.start() + 26]))
print(u'单反斜杠＋数字 命中=%d 篇=%d' % (len(rows), len(set(r[0] for r in rows))))
for f, i, c in rows[:30]:
    print(u'  %s:%d  %r' % (f[:18], i, c))
