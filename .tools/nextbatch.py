# -*- coding: utf-8 -*-
# 交接：主线1 收尾。用法 python .tools/nextbatch.py
import io, glob, re, os

HDR = (u'| \u7b26\u53f7 | \u6570\u503c\u6216\u589e\u957f\u7387 | '
       u'\u4f4d\u7f6e(\u6587\u4ef6:\u884c) | \u88ab\u8c01\u6d88\u8d39 | '
       u'\u82e5\u6539\u52a8\u65ad\u5728\u54ea\u4e00\u6b65 |')
INFLIGHT = set(io.open('.tools/inflight.txt', encoding='utf-8').read().split())
OUT = set(u'D10'.split())  # 论文不在 162 行队列内

qlines = io.open(u'.tools/lean_queue.txt', encoding='utf-8').read().split('\n')
qidx = {}
for n, l in enumerate(qlines, 1):
    name = l.split('/')[0].strip()
    if name:
        qidx[name] = n

print('%-5s %-8s %-6s %-5s %-5s %-4s %s' % ('ID', 'size', 'math', 'hdr', 'rows', 'reg', 'paper'))
for p in sorted(glob.glob(u'\u7814\u7a76\u7b14\u8bb0/D*.md')):
    b = re.match(r'D\d+', os.path.basename(p)).group(0)
    if b in INFLIGHT or b in OUT:
        continue
    t = io.open(p, encoding='utf-8', errors='replace').read()
    lines = t.split('\n')
    size = len(t.encode('utf-8'))
    math = t.count('$') + t.count('\\(')
    hdr = t.count(HDR)
    rows = 0
    if HDR in t:
        h = max(i for i, l in enumerate(lines) if l.startswith(HDR))
        j = h + 2
        while j < len(lines) and lines[j].startswith('| '):
            rows += 1
            j += 1
    reg = bool(re.search(u'\u961f\u5217.{0,6}\u884c\u53f7', t)) and \
        bool(re.search(r'preprints/[A-Za-z0-9][A-Za-z0-9._-]*', t))
    dirs = re.findall(r'preprints/([A-Za-z0-9][A-Za-z0-9._-]*)', t)
    name = dirs[0] if dirs else 'NODIR'
    bad = []
    if size < 70000:
        bad.append('size')
    if math < 1000:
        bad.append('math')
    if hdr != 1:
        bad.append('hdr')
    if rows < 28:
        bad.append('rows')
    if bad:
        q = qidx.get(name, '?')
        print('%-5s %-8d %-6d %-5d %-5d %-4s %-4s %s' %
              (b, size, math, hdr, rows, ','.join(bad), 'L%s' % q, name))
