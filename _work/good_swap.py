# -*- coding: utf-8 -*-
import io

GOOD = u'\u53cd\u5012\u662f'   # what I wrongly typed
SRC = u'\u53cd\u800c\u662f'    # the banned family form actually meant
for M in (u'C:/Users/hp/.qoder-cn/projects/E--math/memory/style-ban-batch-repair.md',
          u'C:/Users/hp/.qoder-cn/projects/E--math/memory/body-side-note-gate-fixes.md'):
    b0 = io.open(M, 'rb').read()
    t = b0.decode('utf8')
    n = t.count(GOOD)
    assert n == 2, (M, n)
    t2 = t.replace(GOOD, SRC)
    assert t2.count(GOOD) == 0 and t2.count(SRC) == n
    b1 = t2.encode('utf8')
    assert len(b1) == len(b0) and b1.count(b'\r') == 0
    io.open(M, 'wb').write(b1)
    assert io.open(M, 'rb').read() == b1
    print(M.split('/')[-1], 'swapped', n, 'size', len(b1))
