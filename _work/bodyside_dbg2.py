# -*- coding: utf-8 -*-
import io, os, re, sys, difflib
sys.path.insert(0, u'E:\\math\\_work')
import bodyside_detect as B
import importlib.util
spec = importlib.util.spec_from_file_location(u'v11', u'E:\\math\\_work\\bodyside_v11.py')

BASE = u'E:\\math\\\u7814\u7a76\u7b14\u8bb0'
fn = u'D374-\u65e0\u7406\u89d2\u4e09\u89d2\u5f62\u53f0\u7403\u7684\u904d\u5386\u6027\uff1a\u53cc\u5c42\u6784\u9020\u4e0e\u4e24\u6b65\u6781\u9650\u7684\u8bba\u8bc1\u7f1d\u9699\u5730\u56fe.md'
lines = B.load(os.path.join(BASE, fn))
q = u'\u8fd9\u4e2a\u987a\u5e8f\u672c\u8eab\u5c31\u662f\u8bba\u6587\u6700\u6df1\u7684\u8bbe\u8ba1\u58f0\u660e\u3002'
out = []
out.append(u'q len=%d exists_in=%s' % (len(q), [i + 1 for i, l in enumerate(lines) if q in l]))
site = u'\u8fd9\u4e2a\u987a\u5e8f\u672c\u8eab\u662f\u8bba\u6587\u6700\u6df1\u7684\u8bbe\u8ba1\u58f0\u660e\u3002'
out.append(u'site len=%d lines=%s' % (len(site), [i + 1 for i, l in enumerate(lines) if site in l]))
for i, l in enumerate(lines):
    if u'\u8fd9\u4e2a\u987a\u5e8f' in l or u'\u8bba\u6587\u6700\u6df1' in l:
        out.append(u'L%d len=%d :: %s' % (i + 1, len(l), l[:400]))
parts = [re.escape(q[0])]
for ch in q[1:]:
    parts.append(u'.{0,8}')
    parts.append(re.escape(ch))
rx = re.compile(u''.join(parts))
out.append(u'pattern=' + u''.join(parts))
for i, l in enumerate(lines):
    ms = list(rx.finditer(l))
    if ms:
        out.append(u'MATCH L%d spans=%s' % (i + 1, [(m.start(), m.end(), l[m.start():m.end()]) for m in ms][:4]))
with io.open(u'E:\\math\\_work\\bodyside_dbg2.txt', 'wb') as f:
    f.write(u'\n'.join(out).encode('utf-8'))
sys.stdout.write('ok %d\n' % len(out))
