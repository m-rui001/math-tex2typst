# -*- coding: utf-8 -*-
"""Diagnostics on the evidence dump: quality of extracted bad/good per verdict."""
from __future__ import print_function
import io, json, collections

res = json.load(io.open('_work/wo_evidence.json', 'rb'))
out = []
qc = collections.Counter()
for x in res:
    v = x['verdict']
    for s in x.get('sites', []):
        bad = s.get('bad')
        good = s.get('good')
        qc[v + '|has-bad'] += 1 if bad else 0
        qc[v + '|has-good'] += 1 if good else 0
        if bad:
            qc[v + '|bad-len-ge6'] += 1 if len(bad) >= 6 else 0
            qc[v + '|bad-short'] += 1 if len(bad) < 6 else 0
        if good:
            qc[v + '|good-len-ge6'] += 1 if len(good) >= 6 else 0
            qc[v + '|good-short'] += 1 if len(good) < 6 else 0
        gb = s.get('good_body_occ') or []
        if gb:
            tot = sum(c for n, c in gb)
            qc[v + '|good-body-count-%s' % ('1-3' if tot <= 3 else ('4-15' if tot <= 15 else 'gt15'))] += 1
out.append('=== quality counters ===')
for k in sorted(qc):
    out.append('%s = %d' % (k, qc[k]))

out.append('')
out.append('=== 12 ALREADY-DONE samples ===')
n = 0
for x in res:
    if x['verdict'] != 'ALREADY-DONE' or n >= 12:
        continue
    n += 1
    out.append('---- %s | %s | fam=%s' % (x['id'], x['note'], x.get('fam')))
    out.append('  FIX: %s' % x.get('fix', '')[:150])
    for s in x['sites']:
        out.append('   L=%s R=%s' % (repr(s.get('raw_left'))[:70], repr(s.get('raw_right'))[:70]))
        out.append('    bad=%s' % repr(s.get('bad'))[:110])
        out.append('    good=%s' % repr(s.get('good'))[:110])
        out.append('    occ=%s body=%s decl=%s good_body=%s delta=%s parity=%s' % (
            s.get('occ'), s.get('body_occ'), s.get('decl_occ'), s.get('good_body_occ'),
            s.get('byte_delta'), s.get('parity_break')))

out.append('')
out.append('=== all EXEC rows ===')
for x in res:
    if x['verdict'] != 'EXEC':
        continue
    out.append('---- %s | %s | fam=%s' % (x['id'], x['note'], x.get('fam')))
    out.append('  FIX: %s' % x.get('fix', '')[:160])
    for s in x['sites']:
        out.append('    bad=%s' % repr(s.get('bad'))[:120])
        out.append('    good=%s' % repr(s.get('good'))[:120])
        out.append('    body=%s decl=%s good_body=%s delta=%s parity=%s' % (
            s.get('body_occ'), s.get('decl_occ'), s.get('good_body_occ'),
            s.get('byte_delta'), s.get('parity_break')))

out.append('')
out.append('=== all NEEDS-NEW-LINE / STALE-COORD / NO-VERBATIM rows ===')
for x in res:
    if x['verdict'] not in ('NEEDS-NEW-LINE', 'STALE-COORD', 'NO-VERBATIM', 'CONFLICT-RISK'):
        continue
    out.append('---- %s | %s | %s | fam=%s' % (x['verdict'], x['id'], x['note'], x.get('fam')))
    out.append('  FIX: %s' % x.get('fix', '')[:160])
    out.append('  reason=%s flags=%s' % (x.get('reason'), x.get('flags')))
    for s in x.get('sites', []):
        out.append('    bad=%s good=%s occ=%s good_body=%s parity=%s' % (
            repr(s.get('bad'))[:90], repr(s.get('good'))[:90], s.get('occ'),
            s.get('good_body_occ'), s.get('parity_break')))
io.open('_work/wo_diag.txt', 'wb').write(u'\n'.join(out).encode('utf-8'))
print('sites checked', sum(1 for x in res for _ in x.get('sites', [])))
