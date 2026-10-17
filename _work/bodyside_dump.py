# -*- coding: utf-8 -*-
# Dump chosen (note, line-range) windows into one review file.
import io, os, re, glob, sys
BASE = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
WANT = [
    ('D008', 1120, 1140), ('D211', 230, 250), ('D247', 245, 262),
    ('D196', 152, 175), ('D274', 230, 250), ('D335', 295, 320),
    ('D373', 726, 745), ('D194', 440, 462), ('D200', 440, 455),
    ('D021', 226, 240), ('D234', 172, 186), ('D366', 25, 40),
    ('D040', 525, 540), ('D189', 968, 982), ('D277', 165, 180),
    ('D298', 175, 190),
]
out = []
for tag, a, b in WANT:
    p = glob.glob(os.path.join(BASE, tag + u'-*.md'))
    if not p:
        out.append(u'!! no file %s' % tag)
        continue
    lines = io.open(p[0], 'rb').read().decode('utf-8').split(u'\n')
    out.append(u'===== %s %s  total_lines=%d' % (tag, os.path.basename(p[0]), len(lines)))
    for i in range(a - 1, min(b, len(lines))):
        out.append(u'%5d| %s' % (i + 1, lines[i]))
    out.append(u'')
io.open(u'E:/math/_work/bodyside_review1.txt', 'wb').write(u'\n'.join(out).encode('utf-8'))
print('blocks=%d' % len(WANT))
