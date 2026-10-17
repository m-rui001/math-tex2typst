# -*- coding: utf-8 -*-
# Landing verification (read-only): every ORDER site must now show the good form on its
# declared line and the bad form gone from that line. Also re-checks size vs the apply log.
import io, re, os, json, glob, collections, sys

SITES = json.load(io.open(r'E:\math\_work\order_sites.json', encoding='utf-8'))
OUT = []
def log(s): OUT.append(s)

# expected after-sizes from the apply log
t = io.open(r'E:\math\_work\exec_order_apply_log.txt', encoding='utf-8').read().split('\n')
after = {}
for l in t:
    m = re.match(r'^   edited_lines=\d+ groups=\d+ bytes \d+ -> (\d+) \(delta', l)
    if m:
        nid = None
        after.setdefault('_seq', [])
        after['_seq'].append(int(m.group(1)))
    m2 = re.match(r'^== (D\d+)\s', l)
    if m2:
        after.setdefault(m2.group(1), None)
        after['_cur'] = m2.group(1)
# simpler: pair note headers with the following "bytes a -> b" line
after2 = {}
cur = None
for l in t:
    m = re.match(r'^== (D\d+)\s', l)
    if m:
        cur = m.group(1)
        continue
    m = re.match(r'^   edited_lines=\d+ groups=\d+ bytes (\d+) -> (\d+) \(delta ([+-]\d+)\)', l)
    if m and cur:
        after2[cur] = (int(m.group(1)), int(m.group(2)))
        cur = None

bad = []
sizes = {}
notes = sorted(set(s['note'] for s in SITES), key=lambda x: int(x[1:]))
for nid in notes:
    p = sorted(glob.glob(os.path.join(r'E:\math', u'研究笔记', nid + '-*.md')))[0]
    raw = io.open(p, 'rb').read()
    txt = raw.decode('utf-8')
    cr = txt.count('\r')
    lines = txt.replace('\r\n', '\n').split('\n')
    sizes[nid] = (len(raw), cr)
    for s in [x for x in SITES if x['note'] == nid]:
        i = s['line'] - 1
        line = lines[i] if 0 <= i < len(lines) else ''
        if s['kind'] == 'macro':
            still = re.search(re.escape(s['bad']) + u'(?![A-Za-z])', line)
        else:
            still = re.search(re.escape(s['bad']), line)
        if still:
            bad.append((nid, s['line'], s['family'], 'BAD FORM STILL PRESENT', line[:60]))
        if s['good'] not in line:
            bad.append((nid, s['line'], s['family'], 'GOOD FORM ABSENT', s['good'][:60]))

log('sites verified = %d  notes = %d' % (len(SITES), len(notes)))
log('failures (rolled back or half-applied) = %d' % len(bad))
for b in bad:
    log('  %s' % (b,))
mism = []
for nid in notes:
    got, cr = sizes[nid]
    exp = after2.get(nid, (None, None))[1]
    if exp is not None and got != exp:
        mism.append((nid, exp, got, cr))
    if cr:
        mism.append((nid, 'CR', cr))
log('notes whose size changed after my write (writer churn / rollback) = %d' % len(mism))
for m in mism:
    log('  %s expected=%s now=%s' % (m,))
log('all CR counts = %d' % (0 if not any(s[1] for s in sizes.values()) else 1))
io.open(r'E:\math\_work\verify_landing.txt', 'w', encoding='utf-8').write('\n'.join(OUT) + '\n')
sys.stdout.write('failures=%d size_mismatch=%d\n' % (len(bad), len(mism)))
