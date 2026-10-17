# -*- coding: utf-8 -*-
import io

GOOD = u'\u53cd\u5012\u662f'   # 反倒 是 (correct word)
SRC = u'\u53cd\u800c\u662f'    # 反而 是 (banned family source)
BAD = u'\u53cd\u9053\u662f'    # 反道 是 (tool artifact)
FEI = u'\u53cd\u9053'          # 反道

def load(p):
    return io.open(p, 'rb').read().decode('utf8')

def save(p, t):
    b = t.encode('utf8')
    assert b.count(b'\r') == 0
    io.open(p, 'wb').write(b)
    assert load(p) == t
    return len(b)

D40 = u'_work/ledger_draft40.md'
t = load(D40)
old = u'`\u53cd\u5012\u662f`\uff08\u574f\u6e90\u5f62\uff09'   # `反倒是`（坏源形）
new = u'`\u53cd\u800c\u662f`\uff08\u574f\u6e90\u5f62\uff09'
assert t.count(old) == 1, t.count(old)
n0 = len(t.encode('utf8'))
save(D40, t.replace(old, new))
print('draft patched %d -> %d' % (n0, len(load(D40).encode('utf8'))))

for M in (u'C:/Users/hp/.qoder-cn/projects/E--math/memory/style-ban-batch-repair.md',
          u'C:/Users/hp/.qoder-cn/projects/E--math/memory/body-side-note-gate-fixes.md'):
    t = load(M)
    a, g, b = t.count(SRC), t.count(GOOD), t.count(BAD)
    print(M.split('/')[-1], 'SRC', a, 'GOOD', g, 'BAD', b)
