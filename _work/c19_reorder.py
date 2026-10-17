# -*- coding: utf-8 -*-
import io, re, sys
p = u'E:\\math\\被引笔记\\C19-Kähler广义对的BBY分解.md'
t = io.open(p, encoding='utf-8', newline='').read()
lines = t.split(u'\n')
i9 = next(i for i, l in enumerate(lines) if l.startswith(u'## 9 '))
i8 = next(i for i, l in enumerate(lines) if l.startswith(u'## 8 '))
assert i8 > i9, (i9, i8)
head = lines[:i9]
seam = lines[i9:i8]
tail = lines[i8:]
out = head + tail + seam
n = u'\n'.join(out)
assert u'\r' not in n
io.open(p, 'w', encoding='utf-8', newline='').write(n)
print('moved: seam was at line %d, block8 from %d to %d' % (i9 + 1, i8 + 1, len(lines)))
for i, l in enumerate(n.split(u'\n')):
    if l.startswith(u'## '):
        print(i + 1, l[:40].encode('unicode_escape').decode('ascii'))
