# -*- coding: utf-8 -*-
"""Dump the non-target-given ORDER rows in full for manual reading."""
from __future__ import print_function
import io, os

HDR = ['id','note','sec_line','sec_head','no','label','cat','kind','fam',
       'stated','cur','verified','quote','fix','evidence','verify_note']
raw = io.open('_work/workorders.tsv','rb').read()
lines = [l for l in raw.decode('utf-8').split('\n') if l]
rows = [dict(zip(HDR, ln.split('\t'))) for ln in lines[1:]]
order = [r for r in rows if r['cat'] == 'ORDER']

out = []
out.append('=== rows in D80 / D94 / D66 (in-flight writers) ===')
n = 0
for r in order:
    if r['note'].startswith(('D080-', 'D80-', 'D094-', 'D94-', 'D066-', 'D66-')):
        n += 1
        out.append('%s | %s | sec_line=%s | fam=%s | kind=%s' % (r['id'], r['note'][:50], r['sec_line'], r['fam'], r['kind']))
        out.append('   Q: %s' % r['quote'][:130])
        out.append('   F: %s' % r['fix'][:130])
out.append('in-flight rows total = %d' % n)
out.append('')
out.append('=== mechanical-count-correction + mechanical-delete ===')
for r in order:
    if r['kind'] != 'mechanical-target-given':
        out.append('---- %s | %s | kind=%s | sec_line=%s | sec_head=%s | fam=%s' % (
            r['id'], r['note'], r['kind'], r['sec_line'], r['sec_head'], r['fam']))
        out.append('   stated=%s cur=%s verified=%s' % (r['stated'], r['cur'], r['verified']))
        out.append('   Q: %s' % r['quote'])
        out.append('   F: %s' % r['fix'])
        out.append('   E: %s' % r['evidence'])
        out.append('   V: %s' % r['verify_note'])
io.open('_work/wo_special.txt','wb').write(u'\n'.join(out).encode('utf-8'))
print('wrote', len(out))
