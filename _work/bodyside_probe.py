# -*- coding: utf-8 -*-
# For one (note, regex) pair: print every matching line number with its full
# text length and an unicode-escaped excerpt, ASCII-safe for the console.
import io, os, re, glob, sys
BASE = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
tag = sys.argv[1]
pat = sys.argv[2]
p = glob.glob(os.path.join(BASE, tag + u'-*.md'))[0]
lines = io.open(p, 'rb').read().decode('utf-8').split(u'\n')
res = []
for i, l in enumerate(lines):
    if re.search(pat, l):
        res.append(u'%5d| len=%d | %s' % (i + 1, len(l), l[:200]))
io.open(u'E:/math/_work/bodyside_probe.txt', 'wb').write(
    (u'\n'.join(res) or u'NO MATCH').encode('utf-8'))
print('%s matches=%d' % (tag, len(res)))
