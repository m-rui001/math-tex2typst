# -*- coding: utf-8 -*-
import glob, io, sys

D = chr(124)
M = chr(36)

f = glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D%s-*.md' % sys.argv[1])[0]
L = io.open(f, encoding='utf-8').read().split(u'\n')
for i, l in enumerate(L):
    if not l.startswith(D):
        continue
    segs = l.split(M)
    for j in range(1, len(segs), 2):
        if D in segs[j]:
            print(i + 1, l.count(D), repr(segs[j][:60]))
            break
