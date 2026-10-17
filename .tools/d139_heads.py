# -*- coding: utf-8 -*-
import io, glob, re

p = glob.glob('研究笔记/D139-*.md')[0]
lines = io.open(p, encoding='utf-8').read().split('\n')
out = []
for i, l in enumerate(lines, 1):
    if l.startswith('## '):
        out.append('H %d: %s' % (i, l[:80]))
out.append('--- 455-470 ---')
for i in range(454, 470):
    out.append('%d: %s' % (i + 1, lines[i][:150]))
out.append('--- 485-495 ---')
for i in range(484, 495):
    out.append('%d: %s' % (i + 1, lines[i][:150]))
out.append('--- 862-880 ---')
for i in range(861, 880):
    out.append('%d: %s' % (i + 1, lines[i][:150]))
io.open('.tools/d139_heads.txt', 'w', encoding='utf-8').write('\n'.join(out))
print(len(lines))
