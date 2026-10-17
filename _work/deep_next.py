# -*- coding: utf-8 -*-
import io, os

TOOLS = os.path.join('E:', chr(92), chr(92), 'math', '.tools')
TOOL = lambda n: os.path.join(TOOLS, n)

def rows(path):
    return [l for l in io.open(path, 'r', encoding='utf-8').read().split('\n') if l.strip()]

wave = {}
for line in rows(TOOL('wave.txt')):
    parts = line.split('\t')
    wave[parts[0]] = line

lq = {}
for line in rows(TOOL('lean_queue.txt')):
    lq.setdefault(line.split('\t')[0], line)

oq = {}
for line in rows(TOOL('other_queue.txt')):
    oq.setdefault(line.split('\t')[0], line)

ids = []
for line in rows(os.path.join('E:', chr(92), chr(92), 'math', '_work', 'deep_queue.txt')):
    ids.append(line.split(' ')[0])

res = []
res.append('queue=%d' % len(ids))
note_dir = {}
for line in rows(os.path.join('E:', chr(92), chr(92), 'math', '_work', 'deep_queue.txt')):
    fields = line.split(' ')
    dval = [f for f in fields if f.startswith('dir=')]
    note_dir[fields[0]] = dval[0][4:] if dval else 'NONE'
mismatch = 0
for nid in ids:
    w = wave.get(nid)
    if w is None:
        if nid in lq:
            src = 'LEAN_QUEUE:' + lq[nid][:120]
        elif nid in oq:
            src = 'OTHER_QUEUE:' + oq[nid][:120]
        else:
            src = 'UNREGISTERED'
        res.append('%s -> %s' % (nid, src))
    else:
        parts = w.split('\t')
        wd = parts[4].split('/')[-1] if len(parts) > 4 else 'NONE'
        nd = note_dir[nid].split('\\')[0].rstrip('/')
        flag = '' if wd.startswith(nd) or nd.startswith(wd) else '  <-- DIR-MISMATCH'
        if flag:
            mismatch += 1
            res.append('%s DIR note=%s wave=%s' % (nid, nd, wd))
        res.append('%s -> %s%s' % (nid, w, flag))
res.append('DIR_MISMATCHES=%d' % mismatch)

out = os.path.join('E:', chr(92), chr(92), 'math', '_work', 'deep_next.txt')
io.open(out, 'wb').write((u'\n'.join(res) + u'\n').encode('utf-8'))
print('wrote', out, len(res))
