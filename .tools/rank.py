# -*- coding: utf-8 -*-
import io, glob, re, os

HDR = (u'| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | '
       u'\u4f4d\u7f6e(\u6587\u4ef6:\u884c) | \u88ab\u8c01\u6d88\u8d39 | '
       u'\u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |')
SEP = u'| --- | --- | --- | --- | --- |'
srcpat = re.compile(r'preprints[/\\]+([A-Za-z0-9][A-Za-z0-9._-]*)')
INFLIGHT = set(io.open('.tools/inflight.txt', encoding='utf-8').read().split())
INFLIGHT |= set('D01 D02 D03 D04 D05 D06 D07 D20 D44 D45 D47'.split())
# D10 的论文（An-isomorphism-of-the-free-group-factors）不在主线1 的 162 行队列里
OUT = set(u'D10'.split())
rows = []
for p in sorted(glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md')):
    b = re.match(r'D\d+', os.path.basename(p)).group(0)
    if b in INFLIGHT or b in OUT:
        continue
    t = io.open(p, encoding='utf-8', errors='replace').read()
    size = len(t.encode('utf-8'))
    math = t.count('\\(') + t.count('$')
    hdr = t.count(HDR)
    lines = t.split('\n')
    rowsn = 0
    if HDR in t:
        h = max(i for i, l in enumerate(lines) if l.startswith(HDR))
        j = h + 2
        while j < len(lines) and lines[j].startswith('| '):
            rowsn += 1
            j += 1
    bad = []
    if size < 70000:
        bad.append('size%d' % size)
    if math < 1000:
        bad.append('math%d' % math)
    if hdr != 1:
        bad.append('hdr%d' % hdr)
    if HDR in t and lines[h + 1] != SEP:
        bad.append('sep0')
    if rowsn < 28:
        bad.append('rows%d' % rowsn)
    if bad:
        d = srcpat.findall(t)
        rows.append((len(bad), b, size, ';'.join(bad), d[0][:60] if d else 'NODIR'))
rows.sort(reverse=True)
print(len(rows), 'notes with structural defects')
for r in rows:
    print('%s %7d %-34s | %s' % (r[1], r[2], r[3], r[4]))
