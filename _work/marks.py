# -*- coding: utf-8 -*-
r"""逐字符定界符位置表：`python _work/marks.py D108:104 D36:354 …`。
把 `$`、反引号与 `\[ \] \( \)` 的逐字符下标打出来，配前后各 26 字的窗口，
再用 `texmask.line_delims` 报该行的单 `$` 枚数、`$$` 枚数与行末反引号开关态。
判形靠这张表：哪一枚定界符落单、哪一枚坐错跨度，一目了然。
"""
import glob
import io
import sys

sys.path.insert(0, u'_work')
from texmask import line_delims  # noqa: E402

for arg in sys.argv[1:]:
    if u':' not in arg:
        continue
    cid, ln = arg.split(u':')[0], int(arg.split(u':')[1])
    f = glob.glob(u'研究笔记/' + cid + u'-*.md')[0]
    lines = io.open(f, encoding=u'utf-8').read().split(u'\n')
    t = lines[ln - 1]
    s, d, tick = line_delims(t)
    print(u'\n=== %s:%d len=%d  $=%d `=%d  行内单$=%d $$=%d 反引号开=%d ===' % (
        cid, ln, len(t), t.count(u'$'), t.count(u'`'), s, d, tick))
    for i, c in enumerate(t):
        if c in (u'$', u'`') or (c == u'\\' and i + 1 < len(t) and t[i + 1] in u'[]()'):
            print(u'  %4d %-2s  %s' % (i, c + t[i + 1] if c == u'\\' else c,
                                       repr(t[max(0, i - 26):i + 26])[1:-1]))
