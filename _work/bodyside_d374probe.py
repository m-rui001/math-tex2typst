# -*- coding: utf-8 -*-
import io, glob, os
BASE = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
GOOD = u'\u8fd9\u4e2a\u987a\u5e8f\u672c\u8eab\u5c31\u662f\u8bba\u6587\u6700\u6df1\u7684\u8bbe\u8ba1\u58f0\u660e\u3002'
BAD = u'\u8fd9\u672c\u8eab\u662f\u8bba\u6587\u6700\u6df1\u7684\u7684\u8bbe\u8ba1\u58f0\u660e\u3002'
src = glob.glob(os.path.join(BASE, 'D374-*.md'))[0]
raw = io.open(src, 'rb').read()
txt = raw.decode('utf-8')
lines = txt.split(u'\n')
info = [u'CR=%d LF=%d lines=%d' % (raw.count(b'\r'), raw.count(b'\n'), len(lines)),
        u'txt GOOD=%d BAD=%d' % (txt.count(GOOD), txt.count(BAD))]
for k, l in enumerate(lines):
    if GOOD in l or BAD in l:
        info.append(u'L%d  nGOOD=%d nBAD=%d  %s' % (k + 1, l.count(GOOD), l.count(BAD), l[:300]))
io.open(u'E:/math/_work/bodyside_d374_probe.txt', 'wb').write(u'\n'.join(info).encode('utf-8'))
print('probe written')
