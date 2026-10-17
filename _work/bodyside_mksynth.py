# -*- coding: utf-8 -*-
# Build a synthetic pre-repair copy of D374 so the shortlist detector can be
# validated against a known true positive.
import io, glob, os
BASE = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
GOOD = u'\u8fd9\u4e2a\u987a\u5e8f\u672c\u8eab\u5c31\u662f\u8bba\u6587\u6700\u6df1\u7684\u8bbe\u8ba1\u58f0\u660e\u3002'
BAD = u'\u8fd9\u672c\u8eab\u662f\u8bba\u6587\u6700\u6df1\u7684\u7684\u8bbe\u8ba1\u58f0\u660e\u3002'
src = glob.glob(os.path.join(BASE, 'D374-*.md'))[0]
txt = io.open(src, 'rb').read().decode('utf-8')
lines = txt.split(u'\n')
tgt = [k for k, l in enumerate(lines) if GOOD in l and k + 1 < 260]
lines[tgt[0]] = lines[tgt[0]].replace(GOOD, BAD)
pre = u'\n'.join(lines)
os.makedirs(u'E:/math/_work/bodyside_selftest', exist_ok=True)
io.open(u'E:/math/_work/bodyside_selftest/D374-pre.md', 'wb').write(pre.encode('utf-8'))
info = u'site_line=%d cnt_good=%d cnt_bad=%d\n' % (tgt[0] + 1, pre.count(GOOD), pre.count(BAD))
io.open(u'E:/math/_work/bodyside_selftest/info.txt', 'wb').write(info.encode('utf-8'))
print('site=%d good=%d bad=%d' % (tgt[0] + 1, pre.count(GOOD), pre.count(BAD)))
