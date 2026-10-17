# -*- coding: utf-8 -*-
"""Sampled human read of the v3 verdicts: declaration window + site line + pair."""
from __future__ import print_function
import io, os, json, random, collections

NOTE_DIR = u'\u7814\u7a76\u7b14\u8bb0'
res = json.load(io.open('_work/wo_v3_evidence.json', 'rb'))
cache = {}
def L(note):
    if note not in cache:
        cache[note] = io.open(os.path.join(NOTE_DIR, note), 'rb').read().decode('utf-8').split('\n')
    return cache[note]

out = []
def show(x, nsite=3):
    out.append('---- %s | %s | %s | fam=%s | kind=%s' % (x['verdict'], x['id'], x['note'], x.get('fam'), x.get('kind')))
    out.append('   sec_line=%s anchor=%s decl_range=%s window_len=%s' % (
        x['sec_line'], x.get('anchor_lines'), x.get('decl_range'), x.get('window_len')))
    out.append('   FIX: %s' % x.get('fix', '')[:170])
    out.append('   VNOTE: %s' % x.get('vnote', '')[:150])
    out.append('   WINDOW: %s' % x.get('window', '')[:340])
    for c in x.get('cands', [])[:4]:
        out.append('    CAND mk=%s bad=%s good=%s nb=%s ng=%s bad_all=%s good_all=%s rej=%s flags=%s' % (
            c.get('marker'), repr(c.get('bad'))[:70], repr(c.get('good'))[:70], c.get('nb'),
            c.get('ng'), c.get('bad_all'), c.get('good_all'), c.get('reject'), c.get('flags')))
    for s in x.get('sites', [])[:nsite]:
        ls = L(x['note'])
        n = s['line']
        out.append('    SITE L%s cnt=%s delta=%s macro=%s' % (n, s.get('count'), s.get('delta'), s.get('macro')))
        out.append('      LINE: %s' % ls[n - 1][:260])
    out.append('   reason=%s flags=%s' % (x.get('reason'), x.get('flags')))

buckets = collections.defaultdict(list)
for x in res:
    buckets[x['verdict']].append(x)
random.seed(7)
for k in ('EXEC', 'NO-VERBATIM', 'ALREADY-DONE', 'KEEP-DECLARATION', 'STALE-COORD', 'NEEDS-NEW-LINE'):
    pool = buckets[k]
    pick = pool if len(pool) <= 6 else random.sample(pool, 14 if k == 'EXEC' else 12)
    out.append('')
    out.append('======== %s (%d rows, showing %d) ========' % (k, len(pool), len(pick)))
    for x in pick:
        show(x)
io.open('_work/wo_v3_review.txt', 'wb').write(u'\n'.join(out).encode('utf-8'))
print('review lines', len(out))
print({k: len(v) for k, v in buckets.items()})
