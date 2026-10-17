# -*- coding: utf-8 -*-
import glob, io, os, re

P = re.compile(r'\\l(?:angle|Vert|vert)\s*\\r(?:angle|Vert|vert)')
n = 0
for f in sorted(glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md')):
    L = io.open(f, encoding='utf-8', errors='ignore').read().split(u'\n')
    for i, l in enumerate(L):
        for m in P.finditer(l):
            print(os.path.basename(f)[:44], i + 1, repr(l[max(0, m.start() - 30):m.end() + 25]))
            n += 1
print('empty pairs', n)
