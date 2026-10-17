# -*- coding: utf-8 -*-
r"""全库普查：环境名（tikzcd/CD/cd/align/equation 等）出现在**行内代码跨度**里还是**数学跨**里。

`python _work/env_house_census.py [环境正则]`——默认 `tikzcd|CD|cd|equation|align`。
按台账口径先粗切：数该行 `\begin{env}` 之前反引号枚数的奇偶，奇＝坐在行内代码里。
"""
import collections
import glob
import io
import re
import sys

pat = re.compile(u'\\\\begin\\{(' + (sys.argv[1] if len(sys.argv) > 1 else u'tikzcd|CD|cd|equation|align') + u')\\}')
TICK = chr(96)
c = collections.Counter()
ex = collections.defaultdict(list)
for p in glob.glob(u'研究笔记/D*.md'):
    for i, l in enumerate(io.open(p, encoding='utf-8'), 1):
        for m in pat.finditer(l):
            inside = l.count(TICK, 0, m.start()) % 2 == 1
            key = (m.group(1), u'code-span' if inside else u'math-or-plain')
            c[key] += 1
            if len(ex[key]) < 3:
                ex[key].append((p.split(u'\\')[-1][:8], i, l.strip()[:110]))
for k, v in c.most_common():
    print(v, k)
print()
for k, v in sorted(ex.items()):
    print(k)
    for e in v:
        print(u'    %s:%d  %s' % e)
