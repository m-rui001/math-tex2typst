# -*- coding: utf-8 -*-
# 主线1 遗留不达标笔记的实测：体量 / 台账 / 主对象目录。
import io, glob, os, re, sys

HDR = (u'| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | '
       u'\u4f4d\u7f6e(\u6587\u4ef6:\u884c) | \u88ab\u8c01\u6d88\u8d39 | '
       u'\u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |')
srcpat = re.compile(r'preprints[/\\]+([A-Za-z0-9][A-Za-z0-9._\-]*)')
keys = ['001', '002', '003', 'D01', 'D02', 'D03', 'D04', 'D05', 'D06', 'D07',
        'D08', 'D10', 'D20', 'D44', 'D45', 'D46', 'D47']
out = []
for k in keys:
    fs = [p for p in glob.glob(u'研究笔记/*.md')
          if os.path.basename(p).split(u'-')[0] == k]
    if not fs:
        out.append(u'%-4s ABSENT' % k)
        continue
    t = io.open(fs[0], encoding='utf-8', errors='replace').read()
    lines = t.split('\n')
    rows = 0
    for i, l in enumerate(lines):
        if l.strip() == HDR:
            j = i + 1
            while j < len(lines) and lines[j].strip().startswith(u'|') \
                    and lines[j].count(u'|') == 6:
                rows += 1
                j += 1
    d = srcpat.findall(t)
    out.append(u'%-4s size=%7d hdr=%d rows=%3d math=%5d dir=%s'
               % (k, len(t.encode('utf-8')), t.count(HDR),
                  rows, t.count(u'$') + t.count(u'\\('),
                  d[0][:40] if d else u'-'))
sys.stdout.buffer.write(('\n'.join(out) + '\n').encode('utf-8'))
