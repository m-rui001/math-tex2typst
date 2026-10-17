# -*- coding: utf-8 -*-
# 倒叙批次登记：把尾部若干行按"编号从高往低"记入 dispatched.txt / wave.txt / inflight.txt。
# 编号来源：现最大 D646 + other_cover 的 remaining(94) = D740，从 D740 起倒着排。
# 用法：python _work/register_reverse.py 6
import io, os, re, sys

N = int(sys.argv[1]) if len(sys.argv) > 1 else 6
TOP = int(sys.argv[2]) if len(sys.argv) > 2 else 740  # 倒叙批次顶号（第一批 D740 = D646 + remaining 94）

Q = '.tools/other_queue.txt'
D = '.tools/dispatched.txt'
W = '.tools/wave.txt'
F = '.tools/inflight.txt'

rows = [l.split() for l in io.open(Q, encoding='utf-8').read().split('\n') if l.strip()]
taken = set()
for l in io.open(D, encoding='utf-8').read().split('\n'):
    if l.strip():
        taken.add(l.split('\t')[1])

# 倒叙候选：行号从大到小（498 是撤稿豁免行，跳过）
cands = [r for r in sorted(rows, key=lambda r: -int(r[0])) if r[0] not in taken and r[0] != '498'][:N]

out = []
for i, (r, d, b) in enumerate(cands):
    kid = 'D%d' % (TOP - i)
    out.append((kid, r, d, int(b)))

# 1) dispatched.txt（追加）
with io.open(D, 'a', encoding='utf-8', newline='\n') as f:
    f.write('\n')
    for kid, r, d, b in out:
        f.write('%s\t%s\t%s\n' % (kid, r, d))

# 2) wave.txt（追加）
with io.open(W, 'a', encoding='utf-8', newline='\n') as f:
    for kid, r, d, b in out:
        f.write('%s\trow=%s\tbytes=%d\tthin=%s\tdir=preprints/%s\n'
                % (kid, r, b, 'yes' if b < 40000 else 'no', d))

# 3) inflight.txt（重写，保持 sorted 空格分隔）
inf = set(io.open(F, encoding='utf-8').read().split())
inf |= set(k for k, _r, _d, _b in out)
io.open(F, 'w', encoding='utf-8', newline='\n').write(' '.join(sorted(inf)) + '\n')

for kid, r, d, b in out:
    print('%s  row=%s  bytes=%d  %s' % (kid, r, b, d))
print('inflight =', ' '.join(sorted(inf)))
