# -*- coding: utf-8 -*-
"""加深池：素材厚而笔记薄的号，按 tex 字节降序排出可派清单。
用法: python _work/enrich_pool.py [--write]
"""
import io, os, re, sys

SRC = re.compile(r'preprints[/\\]+([A-Za-z0-9][A-Za-z0-9._\-()]*)')
QROW = re.compile(u'队列第\\s*(\\d{1,3})\\s*行号')
BASE = u'研究笔记'

q = {}
for line in io.open('.tools/other_queue.txt', encoding='utf-8'):
    m = re.match(r'^\s*(\d+)\s+(\S+)\s+(\d+)', line)
    if m:
        q[int(m.group(1))] = (m.group(2), int(m.group(3)))

defect = set()
for l in io.open('_work/dupsec_census.txt', encoding='utf-8'):
    m = re.match(r'^(D\d+) ', l)
    if m:
        defect.add(m.group(1))

others = set()
for tok in io.open('.tools/inflight.txt', encoding='utf-8').read().split():
    others.add(tok)

rows = []
for f in sorted(os.listdir(BASE)):
    m = re.match(r'^(D\d+)-(.+)\.md$', f)
    if not m:
        continue
    i = m.group(1)
    size = os.path.getsize(os.path.join(BASE, f))
    txt = io.open(os.path.join(BASE, f), encoding='utf-8', errors='replace').read()
    rm = QROW.search(txt)
    row = int(rm.group(1)) if rm else None
    if row is None or row not in q:
        continue
    d, tb = q[row]
    sm = SRC.search(txt)
    if not sm or sm.group(1) != d:
        continue
    secn = [int(x) for x in re.findall(u'^## *\u00a7(\\d+)', txt, re.M)]
    rows.append((tb, size, i, row, d, max(secn) if secn else -1))

rows.sort(key=lambda r: -r[0])
out = []
for tb, size, i, row, d, last in rows:
    if i in defect or i in others:
        continue
    if tb < 120000 or size > 82000:
        continue
    out.append('%s\trow=%d\ttex=%d\tnote=%d\tlast_sec=%d\tdir=%s' % (i, row, tb, size, last, d))
print('pool', len(out))
for l in out[:20]:
    print(l)
if '--write' in sys.argv:
    io.open('_work/enrich_pool.txt', 'w', encoding='utf-8', newline='\n').write('\n'.join(out) + '\n')
