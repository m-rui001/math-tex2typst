# -*- coding: utf-8 -*-
"""Diff the shipped gauge's dollar-family sites against the corrected gauge's.

Reported per note: how many sites are (a) in both, (b) shipped-only (killed or
moved by the corrected mask), (c) corrected-only (newly surfaced by re-pairing).
"""
import io, json, sys, collections
sys.stdout.reconfigure(encoding='utf-8')

D = chr(36)
KEY = D + chr(39) + u' in math mode'


def fam(p):
    rows = [json.loads(l) for l in io.open(p, encoding=u'utf-8') if l.strip()]
    return [r for r in rows if KEY in (r.get(u'errClass') or u'').strip()], rows


a, ar = fam(sys.argv[1])
b, br = fam(sys.argv[2])
print(u'shipped sites total=%d family=%d' % (len(ar), len(a)))
print(u'corrected sites total=%d family=%d' % (len(br), len(b)))
ka = collections.Counter((r[u'file'], r[u'line']) for r in a)
kb = collections.Counter((r[u'file'], r[u'line']) for r in b)
both = sum(min(ka[k], kb[k]) for k in ka if k in kb)
print(u'same (file,line) in both=%d  shipped-only=%d  corrected-only=%d'
      % (both, len(a) - both, len(b) - both))
files = sorted(set(list(ka) + list(kb)), key=lambda x: x[0])
print(u'per-file: prefix  shipped corrected')
cf_a = collections.Counter(r[u'file'] for r in a)
cf_b = collections.Counter(r[u'file'] for r in b)
for f in sorted(set(list(cf_a) + list(cf_b))):
    print(u'%s  %d %d' % (f.split(u'-')[0], cf_a.get(f, 0), cf_b.get(f, 0)))
print()
print(u'--- shipped-only rows')
seen = collections.Counter()
for r in a:
    k = (r[u'file'], r[u'line'])
    if kb[k] <= seen[k]:
        print(u'%s L%d | %s' % (r[u'file'].split(u'-')[0], r[u'line'],
                               json.dumps(r[u'body'], ensure_ascii=False)[:150]))
    seen[k] += 1
print(u'--- corrected-only rows')
seen = collections.Counter()
for r in b:
    k = (r[u'file'], r[u'line'])
    if ka[k] <= seen[k]:
        print(u'%s L%d | %s' % (r[u'file'].split(u'-')[0], r[u'line'],
                               json.dumps(r[u'body'], ensure_ascii=False)[:150]))
    seen[k] += 1
