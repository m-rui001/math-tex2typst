# -*- coding: utf-8 -*-
import io

GOOD = u'\u53cd\u5012\u662f'   # 反倒 是
SRC = u'\u53cd\u800c\u662f'    # 反而 是
bad = []
for M in (u'C:/Users/hp/.qoder-cn/projects/E--math/memory/style-ban-batch-repair.md',
          u'C:/Users/hp/.qoder-cn/projects/E--math/memory/body-side-note-gate-fixes.md'):
    t = io.open(M, 'rb').read().decode('utf8')
    for i, l in enumerate(t.split(u'\n')):
        if GOOD in l:
            bad.append(u'%s:%d | %s' % (M.split('/')[-1], i + 1, l[:170]))
io.open(u'_work/good_lines.txt', 'wb').write(u'\n\n'.join(bad).encode('utf8'))
print('lines dumped', len(bad))
