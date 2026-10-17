# -*- coding: utf-8 -*-
from __future__ import print_function
import io, collections

HDR = ['id','note','sec_line','sec_head','no','label','cat','kind','fam',
       'stated','cur','verified','quote','fix','evidence','verify_note']

rows = []
raw = io.open('_work/workorders.tsv','rb').read()
assert raw.count(b'\r') == 0
text = raw.decode('utf-8')
lines = text.split('\n')
if lines and lines[-1] == '':
    lines = lines[:-1]
head = lines[0].split('\t')
assert head == HDR, head
for ln in lines[1:]:
    parts = ln.split('\t')
    if len(parts) != 16:
        parts = parts + [''] * (16 - len(parts))
    rows.append(dict(zip(HDR, parts)))

order = [r for r in rows if r['cat'] == 'ORDER']
out = []
out.append('total rows %d  ORDER rows %d' % (len(rows), len(order)))
out.append('ORDER notes %d' % len(set(r['note'] for r in order)))
out.append('ORDER kind counts: %s' % dict(collections.Counter(r['kind'] for r in order)))
out.append('ORDER cat/kind: %s' % dict(collections.Counter((r['kind']) for r in order)))
out.append('ORDER with fix nonempty: %d' % sum(1 for r in order if r['fix'].strip()))
out.append('ORDER without fix: %d' % sum(1 for r in order if not r['fix'].strip()))
out.append('ORDER fam tokens top: %s' % collections.Counter(
    t for r in order for t in r['fam'].split(',') if t).most_common(30))
out.append('ORDER label top: %s' % collections.Counter(r['label'][:24] for r in order).most_common(25))
out.append('ORDER sec_head top: %s' % collections.Counter(r['sec_head'][:30] for r in order).most_common(20))
out.append('verified col values: %s' % dict(collections.Counter(r['verified'] for r in order)))
out.append('stated col values sample: %s' % dict(collections.Counter(r['stated'] for r in order).most_common(10)))
out.append('cur col values sample: %s' % dict(collections.Counter(r['cur'] for r in order).most_common(10)))
out.append('evidence nonempty: %d' % sum(1 for r in order if r['evidence'].strip()))
out.append('verify_note nonempty: %d' % sum(1 for r in order if r['verify_note'].strip()))
out.append('quote empty: %d' % sum(1 for r in order if not r['quote'].strip()))
out.append('quote len stats: min %d max %d' % (min(len(r['quote']) for r in order), max(len(r['quote']) for r in order)))
out.append('fix len stats: min %d max %d' % (min(len(r['fix']) for r in order if r['fix'].strip()),
                                             max(len(r['fix']) for r in order)))
# sample rows
for r in order[:6]:
    out.append('SAMPLE ' + r['id'] + ' | ' + r['note'][:30] + ' | sec_line=' + r['sec_line'] +
               ' | kind=' + r['kind'] + ' | fam=' + r['fam'] + ' | stated=' + r['stated'] +
               ' | cur=' + r['cur'] + ' | verified=' + r['verified'])
    out.append('   QUOTE: ' + r['quote'][:300])
    out.append('   FIX  : ' + r['fix'][:300])
    out.append('   EVID : ' + r['evidence'][:200])
    out.append('   VNOTE: ' + r['verify_note'][:200])

io.open('_work/wo_probe.txt','wb').write(u'\n'.join(out).encode('utf-8'))
print('ok', len(order))
