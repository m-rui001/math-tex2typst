# -*- coding: utf-8 -*-
import io, re, sys

SRC = u'E:\\math\\_work\\bodyside_v12.txt'
txt = io.open(SRC, 'r', encoding='utf-8').read().split(u'\n')
blocks = []
cur = None
for l in txt:
    if l.startswith(u'## '):
        cur = [l]
        blocks.append(cur)
    elif l.startswith(u'-- '):
        blocks.append([l])
    elif cur is not None and l.startswith(u'   REL'):
        cur.append(l)

out = []
nrel = norel = 0
for b in blocks:
    if b[0].startswith(u'-- '):
        norel += 1
        continue
    nrel += 1
    rels = b[1:]
    m = re.search(r'filecnt=(\d+) ratio=([0-9.]+) d=(.*)$', rels[0])
    cnt = int(m.group(1))
    ratio = float(m.group(2))
    if cnt == 1 and ratio >= 0.85:
        out.append(b[0])
        for r in rels[:3]:
            out.append(r)
        out.append(u'')
out.insert(0, u'blocks_total=%d with_relative=%d no_relative=%d kept=%d' %
           (len(blocks), nrel, norel, len([1 for x in out if x.startswith(u'## ')])))
with io.open(u'E:\\math\\_work\\bodyside_v12_short.txt', 'wb') as f:
    f.write(u'\n'.join(out).encode('utf-8'))
sys.stdout.write('kept written\n')
