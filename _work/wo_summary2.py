# -*- coding: utf-8 -*-
import io, collections, re

P = u'_work/workorders.tsv'
lines = io.open(P, 'rb').read().decode('utf8', 'replace').split(u'\n')
hdr = lines[0].split(u'\t')
idx = dict((k, i) for i, k in enumerate(hdr))
rows = []
for l in lines[1:]:
    if not l.strip():
        continue
    c = l.split(u'\t')
    if len(c) != len(hdr):
        continue
    rows.append(dict((k, c[idx[k]]) for k in hdr))
print('rows', len(rows))
cat = collections.Counter(r['cat'] for r in rows)
kind = collections.Counter(r['kind'] for r in rows)
notes = collections.Counter(r['note'] for r in rows)
sec = collections.Counter(r['sec_head'][:24] for r in rows)
order = collections.Counter(r['note'] for r in rows if r['cat'].upper() == 'ORDER')
ver = collections.Counter((r['cat'], r['verified']) for r in rows)
out = [u'rows=%d notes-with-sections=%d' % (len(rows), len(notes))]
out.append(u'CAT: ' + u', '.join(u'%s=%d' % kv for kv in cat.most_common()))
out.append(u'KIND top: ' + u', '.join(u'%s=%d' % kv for kv in kind.most_common(12)))
out.append(u'SECHEAD top: ' + u', '.join(u'%s=%d' % kv for kv in sec.most_common(10)))
out.append(u'VERIFIED by cat: ' + u', '.join(u'%s/%s=%d' % (k[0], k[1], v) for k, v in ver.most_common(12)))
out.append(u'notes with ORDER>0: %d' % len(order))
out.append(u'TOP notes by ORDER: ' + u', '.join(u'%s=%d' % kv for kv in order.most_common(20)))
out.append(u'--- sample ORDER rows:')
k = 0
for r in rows:
    if r['cat'].upper() == 'ORDER' and k < 8:
        out.append(u'%s L%s stated=%s cur=%s | %s | FIX=%s | EV=%s' % (
            r['note'][:16], r['sec_line'], r['stated'], r['cur'], r['quote'][:90], r['fix'][:90], r['evidence'][:40]))
        k += 1
io.open(u'_work/workorders_summary2.txt', 'wb').write(u'\n'.join(out).encode('utf8'))
print('ok')
