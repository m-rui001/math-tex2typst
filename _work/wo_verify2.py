# -*- coding: utf-8 -*-
# Re-verify ORDER rows properly: id is DNNN-L<line>-I<nn>, and the fix column is
# prose with before->after pairs. A pair is executable only if its left side occurs
# verbatim in the note today. Measure how many rows really qualify.
import io, os, csv, re, collections

B = chr(92)
ARROW = u'\u2192'
ROOT = os.path.join('E:' + B + B, 'math', u'\u7814\u7a76\u7b14\u8bb0')
P = os.path.join('E:' + B + B, 'math', '_work', 'workorders.tsv')
rows = list(csv.reader(io.open(P, encoding='utf-8', errors='replace'), delimiter='\t'))
head, body = rows[0], rows[1:]
gi = {k: i for i, k in enumerate(head)}

names = {}
for f in os.listdir(ROOT):
    if f.endswith('.md') and f.startswith('D'):
        names[f.split('-')[0]] = f
cache = {}

def note_text(nid):
    if nid not in cache:
        fn = names.get(nid)
        cache[nid] = io.open(os.path.join(ROOT, fn), encoding='utf-8', errors='replace').read() if fn else None
    return cache[nid]

stats = collections.Counter()
good = []
for r in body:
    if len(r) != len(head) or r[gi['cat']] != 'ORDER':
        continue
    stats['ORDER'] += 1
    nid = r[gi['id']].split('-L')[0]
    t = note_text(nid)
    if t is None:
        stats['bad_id'] += 1
        continue
    q, f = r[gi['quote']], r[gi['fix']]
    if ARROW not in f:
        stats['no_arrow'] += 1
        if q and '\n' not in q and len(q) >= 4 and t.count(q):
            stats['quote_verbatim_no_arrow'] += 1
        continue
    pairs = [p.strip() for p in f.split(ARROW) if p.strip()]
    # a row can carry several pairs glued with ' / '; rebuild them as src->dst by
    # walking the split fragments two at a time is unsound, so keep only the first
    # src/dst pair that is a literal substring of the note.
    srcs = [s for s in re.split(u'\\s*/\\s*', f) if ARROW in s]
    hits = []
    for chunk in srcs:
        s, d = chunk.split(ARROW, 1)
        s, d = s.strip(), d.strip()
        if len(s) >= 2 and t.count(s) and s != d and '\n' not in s and '\n' not in d:
            hits.append((s, d, t.count(s)))
    if hits:
        stats['rows_with_literal_pair'] += 1
        stats['literal_pairs'] += len(hits)
        for s, d, n in hits:
            good.append([nid, r[gi['id']], r[gi['fam']], str(n), s, d])
    else:
        stats['arrow_but_no_literal'] += 1
        if q and '\n' not in q and len(q) >= 4 and t.count(q):
            stats['quote_verbatim_arrow_unsound'] += 1

out = ['notes in corpus=%d' % len(names)] + ['%s=%d' % kv for kv in stats.most_common()]
out.append('')
by_note = collections.Counter(x[0] for x in good)
out.append('literal pairs=%d over %d notes; notes with >=2 pairs=%d' % (len(good), len(by_note), sum(1 for v in by_note.values() if v >= 2)))
out.append('top: ' + ', '.join('%s:%d' % kv for kv in by_note.most_common(20)))
io.open(os.path.join('E:' + B + B, 'math', '_work', 'wo_verify2.txt'), 'wb').write(('\n'.join(out) + '\n').encode('utf-8'))
w = csv.writer(io.open(os.path.join('E:' + B + B, 'math', '_work', 'wo_literal.tsv'), 'w', encoding='utf-8', newline=''), delimiter='\t')
w.writerows(good[:400])
print('ok pairs=%d' % len(good))
