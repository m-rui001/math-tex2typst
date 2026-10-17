# -*- coding: utf-8 -*-
import io, glob, sys

sys.path.insert(0, u'_work')
from pipe_lib import bare

IDS = [u'D274', u'D309', u'D341', u'D368', u'D544']
paths = {}
for p in glob.glob(u'研究笔记/D*.md'):
    ID = p.split(u'\\')[-1].split(u'/')[-1].split(u'-')[0]
    if ID in IDS:
        paths[ID] = p

out = []
for ID in IDS:
    p = paths[ID]
    L = io.open(p, 'rb').read().decode('utf8').split(u'\n')
    out.append(u'==== %s lines=%d' % (ID, len(L)))
    i = 0
    while i < len(L):
        if L[i].startswith(u'| '):
            j = i
            while j < len(L) and L[j].startswith(u'| '):
                j += 1
            widths = set(len(bare(L[k])) for k in range(i, j))
            out.append(u'  block L%d-L%d rows=%d bareWidths=%s' % (i + 1, j, j - i, sorted(widths)))
            out.append(u'    head1: %s' % L[i][:110])
            out.append(u'    last : %s' % L[j - 1][:110])
            i = j
        else:
            i += 1
io.open(u'_work/rowcount_blocks.txt', 'wb').write(u'\n'.join(out).encode('utf8'))
print('blocks dumped', len(out))
