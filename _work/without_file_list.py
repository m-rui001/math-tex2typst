# -*- coding: utf-8 -*-
import io, os, re, glob, sys
sys.stdout.reconfigure(encoding='utf-8')
notes = os.listdir(u'研究笔记')
missing = []
for line in io.open('.tools/dispatched.txt', encoding='utf-8'):
    f = line.rstrip('\n').split('\t')
    if len(f) < 2 or not re.match(r'^D\d+$', f[0]):
        continue
    if not any(n.startswith(f[0] + '-') for n in notes):
        missing.append((f[0], f[1]))
print('count', len(missing))
for i, r in missing:
    print(i, 'row=' + r)
