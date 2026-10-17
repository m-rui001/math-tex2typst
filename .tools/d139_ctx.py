# -*- coding: utf-8 -*-
import io, re, glob, sys

p = glob.glob('研究笔记/D139-*.md')[0]
t = io.open(p, encoding='utf-8').read()
lines = t.split('\n')
HDR = '| 符号 | 数值或增长率 | 位置(文件:行) | 被谁消费 | 若改动断在哪一步 |'
out = []
out.append('--- HDR lines (1-based) ---')
for i, l in enumerate(lines, 1):
    if l.startswith('| 符号 '):
        out.append('%d: %s' % (i, l[:120]))
out.append('--- em dash lines ---')
for i, l in enumerate(lines, 1):
    if chr(8212) in l:
        out.append('%d: %s' % (i, l.strip()[:200]))
out.append('--- banned phrases / eqref / row7 ---')
for i, l in enumerate(lines, 1):
    if ('换句话说' in l or '值得注意' in l or r'\eqref{}' in l or r'\|y\|' in l
            or '不是' in l and '而是' in l):
        out.append('%d: %s' % (i, l.strip()[:220]))
io.open('.tools/d139_ctx.txt', 'w', encoding='utf-8').write('\n'.join(out))
print(len(out))
