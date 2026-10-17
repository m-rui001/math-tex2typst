import glob, os

jobs = [('D492', 735, 738)]
for i, s, e in jobs:
    p = glob.glob('E:\\math\\*\\%s-*.md' % i)[0]
    raw = open(p, encoding='utf-8').read()
    L = raw.split('\n')
    before = len(raw.encode())
    assert L[e - 1].strip() == '', (i, 'block must end on a blank line', repr(L[e - 1][:40]))
    assert L[s - 2].strip() == '', (i, 'block must start after a blank line', repr(L[s - 2][:40]))
    L2 = L[:s - 1] + L[e:]
    out = '\n'.join(L2)
    open(p, 'w', encoding='utf-8', newline='').write(out)
    print('%s del %d-%d lines %d->%d bytes %d->%d removed=%d' % (
        i, s, e, len(L), len(L2), before, len(out.encode()), before - len(out.encode())))
