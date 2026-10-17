# -*- coding: utf-8 -*-
"""只读探针：逐篇列奇数 `$` 行，并判它为什么并不了线。

用法：python -X utf8 _work/c_odd_probe.py C41 C42
"""
import io
import re
import sys

sys.path.insert(0, '_work')
from c_line_merge import STOP, fence_idx

for cid in sys.argv[1:]:
    path = io.open(u'被引笔记/%s-*.md' % cid, encoding='utf-8') if False else None
    import glob
    fs = glob.glob(u'被引笔记/%s-*.md' % cid)
    if not fs:
        print(cid, 'NOFILE')
        continue
    lines = io.open(fs[0], encoding='utf-8').read().split(u'\n')
    inside = fence_idx(lines)
    print('====', cid, 'lines=%d' % len(lines))
    n = 0
    for i, l in enumerate(lines):
        if i in inside or l.count(u'$') % 2 == 0:
            continue
        n += 1
        # 为什么 closed 不了：往后看能吃到哪一行
        j = i + 1
        blocked = None
        while j < len(lines):
            if j in inside:
                blocked = u'fence@%d' % j
                break
            if STOP.match(lines[j]):
                blocked = u'STOP@%d:%r' % (j, lines[j][:40])
                break
            if (l.rstrip() + u' ' + lines[j].lstrip()).count(u'$') % 2 == 0:
                blocked = u'close@%d' % j
                break
            j += 1
        else:
            blocked = u'EOF'
        odd = [k for k in range(i + 1, min(j + 1, len(lines)))
               if lines[k].count(u'$') % 2]
        print(u'L%-5d $=%d  %s  下一奇数行=%s' % (
            i + 1, lines[i].count(u'$'), blocked,
            (u'L%d' % (odd[0] + 1)) if odd else u'无'))
        print(u'      |' + lines[i][:110])
    print('   奇数行合计', n)
