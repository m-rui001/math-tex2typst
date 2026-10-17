# -*- coding: utf-8 -*-
"""baseline measurement of one note: bytes, CR, line count, counts of two strings."""
import io, os, sys

BASE = u'E:\\math\\\u7814\u7a76\u7b14\u8bb0'
fn = u'D08-Mezard-Parisi\u516c\u5f0f.md'
p = os.path.join(BASE, fn)
raw = open(p, 'rb').read()
DAM = u'\u8bba\u6ca1\u8ba8\u8bba'.encode('utf-8')
RES = u'\u8bba\u6587\u6ca1\u8ba8\u8bba'.encode('utf-8')
lines = raw.decode('utf-8').split(u'\n')
out = []
out.append(u'file=%s' % fn)
out.append(u'bytes=%d' % len(raw))
out.append(u'CR=%d' % raw.count(b'\r'))
out.append(u'LF=%d' % raw.count(b'\n'))
out.append(u'lines=%d' % len(lines))
out.append(u'damaged_total=%d' % raw.count(DAM))
out.append(u'restated_total=%d' % raw.count(RES))
out.append(u'damaged_lines=%s' % [i + 1 for i, l in enumerate(lines) if DAM in l.encode('utf-8')])
out.append(u'restated_lines=%s' % [i + 1 for i, l in enumerate(lines) if RES in l.encode('utf-8')])
out.append(u'L1058_dam=%d L1058_res=%d L1058_len=%d' % (
    lines[1057].count(u'\u8bba\u6ca1\u8ba8\u8bba'), lines[1057].count(u'\u8bba\u6587\u6ca1\u8ba8\u8bba'),
    len(lines[1057].encode('utf-8'))))
with io.open(u'E:\\math\\_work\\bodyside_d008_baseline.txt', 'wb') as f:
    f.write(u'\n'.join(out).encode('utf-8'))
sys.stdout.write('bytes=%d CR=%d lines=%d dam=%d res=%d\n' % (
    len(raw), raw.count(b'\r'), len(lines), raw.count(DAM), raw.count(RES)))
