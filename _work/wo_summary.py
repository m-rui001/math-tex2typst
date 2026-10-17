# -*- coding: utf-8 -*-
import io, collections

P = u'_work/workorders.tsv'
raw = io.open(P, 'rb').read()
txt = raw.decode('utf8', 'replace')
lines = txt.split(u'\n')
print('bytes %d lines %d CR %d' % (len(raw), len(lines), raw.count(b'\r')))
hdr = lines[0].split(u'\t')
print('cols %d: %s' % (len(hdr), hdr))
cnt = collections.Counter()
widths = collections.Counter()
notes = collections.Counter()
order_notes = collections.Counter()
bad_rows = 0
for l in lines[1:]:
    if not l.strip():
        continue
    c = l.split(u'\t')
    widths[len(c)] += 1
    if len(c) < 5:
        bad_rows += 1
        continue
    cat = c[4].strip() if len(c) > 4 else u'?'
    cnt[cat] += 1
    notes[c[0]] += 1
    if cat.upper().startswith('ORDER'):
        order_notes[c[0]] += 1
out = [u'rows by column-count: %s' % dict(widths), u'unparseable %d' % bad_rows,
       u'category counts:']
for k, v in cnt.most_common():
    out.append(u'  %-12s %d' % (k, v))
out.append(u'notes with any item: %d' % len(notes))
out.append(u'TOP notes by any item: %s' % notes.most_common(12))
out.append(u'notes with ORDER items: %d' % len(order_notes))
out.append(u'TOP notes by ORDER: %s' % order_notes.most_common(15))
io.open(u'_work/workorders_summary.txt', 'wb').write(u'\n'.join(out).encode('utf8'))
print('summary written')
