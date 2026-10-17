# -*- coding: utf-8 -*-
# Post-leg verification: compare the re-census (sites JSONL) against the triage plan.
# Read-only. Writes _work/verify_orderleg.txt
import io, json, re, collections, os

PLAN = r'E:\math\_work\katex_undef_plan.txt'
POST = r'E:\math\_work\_work\katex_sites_orderleg2.jsonl'
SUMMARY = r'E:\math\_work\_work\katexundef_orderleg2.json'
SITES = json.load(io.open(r'E:\math\_work\order_sites.json', encoding='utf-8'))
OUT = []
def log(s): OUT.append(s)

# ---- Part C per-note adjudication ----
pl = io.open(PLAN, encoding='utf-8').read().split('\n')
i = [k for k, l in enumerate(pl) if l.startswith('PART C')][0]
j = [k for k, l in enumerate(pl) if l.startswith('PART D')][0]
partc = {}
for l in pl[i + 2:j]:
    m = re.match(r'^(D\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s*$', l)
    if m:
        partc[m.group(1)] = dict(order=int(m.group(2)), jud=int(m.group(3)),
                                 keep=int(m.group(4)), waiver=int(m.group(5)), total=int(m.group(6)))
log('Part C notes parsed = %d  sum ORDER=%d' % (len(partc), sum(v['order'] for v in partc.values())))

# ---- post sites ----
post = [json.loads(l) for l in io.open(POST, encoding='utf-8') if l.strip()]
log('post refused spans = %d' % len(post))
byfile = collections.Counter(os.path.basename(p['file']).split('-')[0] for p in post)
summ = json.load(io.open(SUMMARY, encoding='utf-8'))
log('post summary: spans=%d refused=%d filesHit=%d' % (summ['spans'], summ['refused'], summ['filesHit']))
log('baseline (plan header): spans=857603 refused=511 filesHit=196')

touched = sorted(set(s['note'] for s in SITES), key=lambda x: int(x[1:]))
log('touched notes = %d' % len(touched))

# ---- bad forms still on a declared line? ----
badleft = []
for s in SITES:
    for p in post:
        if os.path.basename(p['file']).split('-')[0] != s['note']:
            continue
        if p['line'] != s['line']:
            continue
        if s['kind'] == 'macro':
            if re.search(re.escape(s['bad']) + r'(?![A-Za-z])', p['body']):
                badleft.append((s['note'], s['line'], s['family'], 'macro-still-in-span', p['body'][:90]))
        else:
            if s['bad'] in p['body']:
                badleft.append((s['note'], s['line'], s['family'], 'span-still-refused', p['body'][:90]))
log('declared ORDER sites whose bad form is STILL refused on the declared line = %d' % len(badleft))
for b in badleft:
    log('  %s' % (b,))

# ---- per touched note: post refused vs expected non-ORDER residue ----
log('per-note post vs plan residue (expected = JUDGMENT+KEEP+WAIVER of that note):')
extra_total = 0
for nid in touched:
    c = partc.get(nid, dict(order=0, jud=0, keep=0, waiver=0, total=0))
    exp = c['jud'] + c['keep'] + c['waiver']
    got = byfile.get(nid, 0)
    if got != exp:
        extra_total += 1
        log('  %-7s plan: ORDER=%d JUD=%d KEEP=%d WAIV=%d total=%d | post=%d | delta=%+d'
            % (nid, c['order'], c['jud'], c['keep'], c['waiver'], c['total'], got, got - exp))
        for p in post:
            if os.path.basename(p['file']).split('-')[0] == nid:
                log('     line %d %s body=%r' % (p['line'], (p['tok'] or p['errClass']), p['body'][:80]))
    else:
        log('  %-7s post=%d == residue=%d  OK' % (nid, got, exp))
log('notes whose post count differs from the plan residue = %d' % extra_total)

# ---- notes in plan not touched (untouched residue must be unchanged, modulo writer churn)
other = []
for nid, c in partc.items():
    if nid in touched:
        continue
    got = byfile.get(nid, 0)
    if got != c['total']:
        other.append((nid, c['total'], got))
log('non-touched plan notes with changed refused count = %d' % len(other))
for nid, a, b in sorted(other):
    log('  %-7s plan_total=%d post=%d delta=%+d' % (nid, a, b, b - a))

io.open(r'E:\math\_work\verify_orderleg.txt', 'w', encoding='utf-8').write('\n'.join(OUT) + '\n')
print('wrote verify_orderleg.txt lines=%d' % len(OUT))
