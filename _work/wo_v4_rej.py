# -*- coding: utf-8 -*-
"""Rejection statistics + samples for the v4 gates."""
from __future__ import print_function
import io, json, collections, random

res = json.load(io.open('_work/wo_v4_evidence.json', 'rb'))
rc = collections.Counter()
samples = collections.defaultdict(list)
random.seed(3)
for x in res:
    for c in x['cands']:
        rc[c.get('reject') or 'CLEAN'] += 1
        samples[c.get('reject') or 'CLEAN'].append((x, c))
out = ['=== rejection counts over %d raw pairs ===' % sum(rc.values())]
for k, v in rc.most_common():
    out.append('%-28s %d' % (k, v))
for k in ('CLEAN', 'no-defect-noun', 'kind-mismatch-not-aligned', 'generic-bad-unpinned',
          'neither-form-on-disk', 'ellipsis', 'length-ratio', 'empty-or-identical',
          'no-common-core', 'too-short'):
    pool = samples.get(k, [])
    if not pool:
        continue
    out.append('')
    out.append('=== samples of %s (%d) ===' % (k, len(pool)))
    for x, c in random.sample(pool, min(8, len(pool))):
        out.append('%s | %s | verdict=%s' % (x['id'], x['note'][:34], x['verdict']))
        out.append('   clause: %s' % c['clause'][:170])
        out.append('   mk=%s badkind=%s bad=%s' % (c['marker'], c['bad_kind'], repr(c['bad'])[:80]))
        out.append('   goodkind=%s good=%s core=%s' % (c['good_kind'], repr(c['good'])[:80], repr(c.get('core', ''))[:60]))
        out.append('   nb=%s ng=%s bad_all=%s good_all=%s flags=%s' % (
            c.get('nb'), c.get('ng'), c.get('bad_all'), c.get('good_all'), c.get('flags')))
io.open('_work/wo_v4_rej.txt', 'wb').write(u'\n'.join(out).encode('utf-8'))
print('reject classes', len(rc))
