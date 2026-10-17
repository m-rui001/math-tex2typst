# -*- coding: utf-8 -*-
"""Locate-only probe: for every cat=ORDER row, check note existence, quote location,
fix left/right presence on disk. Read-only. Writes UTF-8 report, no CR."""
from __future__ import print_function
import io, os, collections

HDR = ['id','note','sec_line','sec_head','no','label','cat','kind','fam',
       'stated','cur','verified','quote','fix','evidence','verify_note']

raw = io.open('_work/workorders.tsv','rb').read()
assert raw.count(b'\r') == 0
lines = raw.decode('utf-8').split('\n')
if lines and lines[-1] == '':
    lines = lines[:-1]
rows = []
for ln in lines[1:]:
    p = ln.split('\t')
    rows.append(dict(zip(HDR, p)))
order = [r for r in rows if r['cat'] == 'ORDER']

cache = {}
def load(note):
    if note in cache:
        return cache[note]
    path = os.path.join(u'\u7814\u7a76\u7b14\u8bb0', note)
    if not os.path.exists(path):
        cache[note] = None
        return None
    b = io.open(path, 'rb').read()
    assert b.count(b'\r') == 0, note
    cache[note] = b.decode('utf-8').split('\n')
    return cache[note]

stats = collections.Counter()
recs = []
for r in order:
    note = r['note']
    ls = load(note)
    rec = {'id': r['id'], 'note': note, 'kind': r['kind'], 'fam': r['fam'],
           'sec_line': r['sec_line'], 'fix': r['fix'], 'quote': r['quote']}
    if ls is None:
        stats['note-missing'] += 1
        rec['loc'] = 'NOTE-MISSING'
        recs.append(rec)
        continue
    stats['note-loaded'] += 1
    q = r['quote'].strip()
    hits = [i+1 for i, l in enumerate(ls) if q in l]
    occ = sum(l.count(q) for l in ls)
    rec['q_hits'] = hits
    rec['q_occ'] = occ
    rec['nlines'] = len(ls)
    sl = int(r['sec_line']) if r['sec_line'].isdigit() else 0
    rec['sec_line'] = sl
    rec['sec_at'] = ls[sl-1][:60] if 0 < sl <= len(ls) else 'OUT-OF-RANGE'
    rec['sec_match'] = (sl in hits)
    if hits:
        stats['quote-exact-1'] += 1 if len(hits) == 1 else 0
        stats['quote-exact-multi'] += 1 if len(hits) > 1 else 0
        stats['quote-sec-line-match'] += 1 if sl in hits else 0
        stats['quote-sec-line-drift'] += 1 if sl not in hits else 0
        if sl and hits:
            stats['drift-buckets[' + ('0' if sl in hits else ('le20' if min(abs(h-sl) for h in hits) <= 20 else 'gt20')) + ']'] += 1
    else:
        stats['quote-missing'] += 1
        # try prefixes
        for n in (80, 60, 40, 24, 16):
            ph = [i+1 for i, l in enumerate(ls) if q[:n] in l]
            if ph:
                rec['prefix_hit'] = (n, ph)
                stats['quote-prefix-%d' % n] += 1
                break
        else:
            stats['quote-unmatched-any'] += 1
            rec['prefix_hit'] = None
    # fix analysis
    f = r['fix']
    rec['has_arrow'] = u'\u2192' in f
    recs.append(rec)

out = []
out.append('ORDER rows: %d' % len(order))
for k in sorted(stats):
    out.append('%s = %d' % (k, stats[k]))
out.append('')
out.append('=== rows whose quote is NOT found verbatim ===')
for rec in recs:
    if not rec.get('q_hits'):
        out.append('%s | %s | kind=%s | fam=%s | prefix=%s' % (
            rec['id'], rec['note'][:40], rec['kind'], rec['fam'], rec.get('prefix_hit')))
io.open('_work/wo_locate.txt','wb').write(u'\n'.join(out).encode('utf-8'))

# full dump of records as json-ish for reuse
dump = []
for rec in recs:
    dump.append('\t'.join([str(rec.get(k,'')) for k in
        ('id','note','sec_line','nlines','q_occ','q_hits','sec_match','has_arrow','kind','fam')]))
io.open('_work/wo_locate.tsv','wb').write((u'\t'.join(['id','note','sec_line','nlines','q_occ','q_hits','sec_match','has_arrow','kind','fam']) + u'\n' + u'\n'.join(dump) + u'\n').encode('utf-8'))
print('done', dict(stats))
