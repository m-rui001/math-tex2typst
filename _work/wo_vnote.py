# -*- coding: utf-8 -*-
"""What shapes do the verify_note / evidence columns take for ORDER rows?"""
from __future__ import print_function
import io, re, collections

HDR = ['id','note','sec_line','sec_head','no','label','cat','kind','fam',
       'stated','cur','verified','quote','fix','evidence','verify_note']
raw = io.open('_work/workorders.tsv', 'rb').read()
lines = [l for l in raw.decode('utf-8').split('\n') if l]
rows = [dict(zip(HDR, ln.split('\t'))) for ln in lines[1:]]
order = [r for r in rows if r['cat'] == 'ORDER']

BT = chr(96)
shapes = collections.Counter()
out = []
for r in order:
    v = r['verify_note']
    s = re.sub(r'sig=' + BT + r'.*?' + BT, 'SIG', v)
    s = re.sub(r'\[\d[\d, ]*\]', '[LINES]', s)
    s = re.sub(r'found at \d+', 'found at N', s)
    shapes[s[:60]] += 1
for k, c in shapes.most_common(60):
    out.append('%4d  %s' % (c, k))
out.append('')
out.append('=== examples of each of the top shapes ===')
seen = set()
for r in order:
    v = r['verify_note']
    s = re.sub(r'sig=' + BT + r'.*?' + BT, 'SIG', v)
    s = re.sub(r'\[\d[\d, ]*\]', '[LINES]', s)
    key = s[:60]
    if key in seen:
        continue
    seen.add(key)
    if len(seen) > 30:
        break
    out.append('SHAPE %s' % key)
    out.append('   id=%s kind=%s fam=%s' % (r['id'], r['kind'], r['fam']))
    out.append('   VNOTE=%s' % v[:200])
    out.append('   FIX=%s' % r['fix'][:200])
    out.append('   EVID=%s' % r['evidence'][:120])
io.open('_work/wo_vnote.txt', 'wb').write(u'\n'.join(out).encode('utf-8'))
print('shapes', len(shapes))
