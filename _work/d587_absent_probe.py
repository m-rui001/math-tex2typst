# -*- coding: utf-8 -*-
import glob
import io
import os

p = glob.glob(u'研究笔记/D587-*.md')[0]
print(u'note=%s' % p)
lines = io.open(p, encoding='utf-8').read().split(u'\n')
for n, l in enumerate(lines, 1):
    if u'08-n-locking' in l:
        print(u'L%d %s' % (n, l[:320]))
print(u'==== §0 前 20 行 ====')
for n in range(1, 21):
    print(u'%3d %s' % (n, lines[n - 1][:200]))
print(u'==== 素材目录里 08 开头的文件 ====')
for m in lines[:40]:
    d = None
    if u'preprints/' in m:
        i = m.index(u'preprints/') + len(u'preprints/')
        d = m[i:].split(u'`')[0].split(u'/')[0].strip()
        break
print(u'dir=%s' % d)
if d:
    root = os.path.join(u'preprints', d)
    for dp, dn, fn in os.walk(root):
        for f in fn:
            if f.startswith(u'08') or f.startswith(u'07') or f.startswith(u'09'):
                print(u'   %s %d lines' % (os.path.join(dp, f).replace(root, u''),
                                           sum(1 for _ in io.open(os.path.join(dp, f), encoding='utf-8', errors='replace'))))
