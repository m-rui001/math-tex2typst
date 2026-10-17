# -*- coding: utf-8 -*-
import io, re, glob

p = glob.glob('研究笔记/D139-*.md')[0]
t = io.open(p, encoding='utf-8').read()
lines = t.split('\n')
HDR = '| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |'
idx = [i for i, l in enumerate(lines) if l.startswith('| 符号 ')]
out = ['HDR idx=%s' % idx]
h = idx[-1]
for k in range(h, h + 20):
    out.append('R%d pipes=%d :: %s' % (k - h - 2, lines[k].count('|'), lines[k][:300]))
out.append('--- eqref-empty / bars ---')
for i, l in enumerate(lines, 1):
    if 'eqref{}' in l or '\\|' in l:
        out.append('%d: %s' % (i, l.strip()[:200]))
io.open('.tools/d139_ledger.txt', 'w', encoding='utf-8').write('\n'.join(out))
print(len(out))
