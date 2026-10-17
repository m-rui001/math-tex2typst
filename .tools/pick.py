# -*- coding: utf-8 -*-
# 主线2 派单备料：给出下一批未派过的 other_queue 行，并维护派单台账 dispatched.txt。
# 用法：
#   python .tools/pick.py 6          # 打印下 6 单（含 ID、行号、目录、tex 字节）
#   python .tools/pick.py 6 --take   # 打印同时把这 6 单记入 dispatched.txt 与 inflight.txt
import io, os, re, sys

Q = '.tools/other_queue.txt'
D = '.tools/dispatched.txt'
F = '.tools/inflight.txt'

rows = []
for l in io.open(Q, encoding='utf-8').read().split('\n'):
    if l.strip():
        p = l.split()
        rows.append((p[0], p[1], int(p[2])))

taken = set()
ids = []
if os.path.exists(D):
    for l in io.open(D, encoding='utf-8').read().split('\n'):
        if l.strip():
            k, r = l.split('\t')[:2]
            taken.add(r)
            m = re.match(r'D(\d+)$', k)
            if m:
                ids.append(int(m.group(1)))

inflight = set(io.open(F, encoding='utf-8').read().split())
for t in inflight:
    m = re.match(r'D(\d+)$', t)
    if m:
        ids.append(int(m.group(1)))
next_id = (max(ids) + 1) if ids else 177

n = int(sys.argv[1]) if len(sys.argv) > 1 else 6
take = '--take' in sys.argv
picks = [r for r in rows if r[0] not in taken][:n]
out = []
for i, (r, d, b) in enumerate(picks):
    out.append('D%-4d row=%-4s bytes=%-8d %s dir=%s'
               % (next_id + i, r, b, 'THIN' if b < 40000 else '    ', d))
sys.stdout.buffer.write(('\n'.join(out) + '\n').encode('utf-8'))
sys.stdout.buffer.write(('next-id=%d taken=%d queue=%d inflight=%d\n'
                         % (next_id + len(picks), len(taken), len(rows),
                            len(inflight))).encode('utf-8'))

if take and picks:
    if os.path.exists(D):
        io.open(D, 'a', encoding='utf-8').write('\n')
    with io.open(D, 'a', encoding='utf-8') as f:
        for i, (r, d, b) in enumerate(picks):
            f.write('D%d\t%s\t%s\n' % (next_id + i, r, d))
    with io.open('.tools/wave.txt', 'a', encoding='utf-8') as f:
        for i, (r, d, b) in enumerate(picks):
            f.write('D%d\trow=%s\tbytes=%d\tthin=%s\tdir=preprints/%s\n'
                    % (next_id + i, r, b, 'yes' if b < 40000 else 'no', d))
    io.open(F, 'w', encoding='utf-8').write(
        ' '.join(sorted(inflight | set('D%d' % (next_id + i)
                                       for i in range(len(picks))))) + '\n')
