# -*- coding: utf-8 -*-
# 未译残留判形：新段（520 起）里的拉丁词 vs 本笔记旧段是否也用同一形。
import io, glob, re
from collections import Counter

p = glob.glob(u'研究笔记/D530-*.md')[0]
L = io.open(p, encoding='utf-8').read().split('\n')
NEW, OLD = 519, 519

W = re.compile(r'[A-Za-z]{4,}')
# 排除常见合法形：宏名、代码跨度内的引文、路径
CODE = re.compile(r'`[^`]*`')


def words(lines):
    c = Counter()
    for l in lines:
        s = CODE.sub(u'', l)
        if s.lstrip().startswith(u'## §'):
            pass
        for w in W.findall(s):
            c[w] += 1
    return c


newc, oldc = words(L[NEW:]), words(L[:OLD])
only_new = [(w, n, oldc.get(w, 0)) for w, n in newc.items() if oldc.get(w, 0) == 0]
out = [u'new distinct=%d old distinct=%d' % (len(newc), len(oldc))]
out.append(u'new-only (old=0), sorted by count:')
for w, n, o in sorted(only_new, key=lambda x: -x[1])[:40]:
    out.append(u'  %s new=%d' % (w, n))
out.append(u'shared forms (new/old):')
for w, n in sorted(newc.items(), key=lambda x: -x[1])[:18]:
    out.append(u'  %s new=%d old=%d' % (w, n, oldc.get(w, 0)))
io.open(u'_work/d530_residue.txt', 'w', encoding='utf-8', newline='\n').write(u'\n'.join(out) + u'\n')
print('ok', len(only_new))
