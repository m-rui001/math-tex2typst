# -*- coding: utf-8 -*-
# 只读探针：列出 other_queue 里"未派且未被任何笔记覆盖"的行号（倒叙派单的目标池）。
import io, glob, os, re

rows = [l.split() for l in io.open('.tools/other_queue.txt', encoding='utf-8').read().split('\n') if l.strip()]
taken = set()
for l in io.open('.tools/dispatched.txt', encoding='utf-8').read().split('\n'):
    if l.strip():
        taken.add(l.split('\t')[1])

srcpat = re.compile(r'preprints[/\\]+([A-Za-z0-9][A-Za-z0-9._\-()]*)')
qdir = dict((r[1], r[0]) for r in rows)
covered = set()
for p in glob.glob(u'\u7814\u7a76\u7b14\u8bb0/*.md'):
    t = io.open(p, encoding='utf-8', errors='replace').read()
    for m in srcpat.findall(t):
        if m in qdir:
            covered.add(qdir[m])
            break

missing = [r[0] for r in rows if r[0] not in taken and r[0] not in covered]
print('rows=%d dispatched=%d covered=%d missing=%d' % (len(rows), len(taken), len(covered), len(missing)))
print('missing rows: ' + ' '.join(missing))
print('tail (descending): ' + ' '.join(sorted(missing, key=int, reverse=True)[:30]))
rowmap = dict((r[0], (r[1], int(r[2]))) for r in rows)
print('--- next 8 reverse candidates ---')
for r in sorted(missing, key=int, reverse=True)[:8]:
    d, b = rowmap[r]
    print('row=%s bytes=%d dir=%s' % (r, b, d))
