# -*- coding: utf-8 -*-
"""Inspect rows whose quote is not found verbatim + the sec_line vs quote-line geometry."""
from __future__ import print_function
import io, os, collections

HDR = ['id','note','sec_line','sec_head','no','label','cat','kind','fam',
       'stated','cur','verified','quote','fix','evidence','verify_note']
raw = io.open('_work/workorders.tsv','rb').read()
lines = raw.decode('utf-8').split('\n')
if lines and lines[-1] == '':
    lines = lines[:-1]
rows = [dict(zip(HDR, ln.split('\t'))) for ln in lines[1:]]
order = [r for r in rows if r['cat'] == 'ORDER']

cache = {}
def load(note):
    if note not in cache:
        path = os.path.join(u'\u7814\u7a76\u7b14\u8bb0', note)
        cache[note] = io.open(path, 'rb').read().decode('utf-8').split('\n')
    return cache[note]

out = []
geom = collections.Counter()
maxabs = 0
miss = []
for r in order:
    ls = load(r['note'])
    q = r['quote'].strip()
    hits = [i+1 for i, l in enumerate(ls) if q in l]
    sl = int(r['sec_line'])
    if hits:
        h = hits[0]
        d = h - sl
        geom[('above' if d < 0 else ('equal' if d == 0 else 'below'))] += 1
        maxabs = max(maxabs, abs(d))
        bucket = abs(d)
        geom['bucket_' + ('0' if bucket == 0 else '<=10' if bucket <= 10 else '<=40' if bucket <= 40 else '<=120' if bucket <= 120 else '>120')] += 1
        # is sec_line a header?
        geom['secline_is_header_' + str(ls[sl-1].startswith('#') if 0 < sl <= len(ls) else 'oor')] += 1
        geom['quote_line_is_header_' + str(ls[h-1].startswith('#'))] += 1
        # is quote line inside the section that starts at sec_line?
    else:
        miss.append(r)

out.append('=== geometry (quote line - sec_line) ===')
out.append('max_abs_delta = %d' % maxabs)
for k in sorted(geom):
    out.append('%s = %s' % (k, geom[k]))
out.append('')
out.append('=== %d rows with no verbatim quote hit ===' % len(miss))
for r in miss:
    ls = load(r['note'])
    q = r['quote'].strip()
    out.append('---- %s | %s | sec_line=%s | fam=%s' % (r['id'], r['note'], r['sec_line'], r['fam']))
    out.append('  QLEN=%d QTAIL=%s' % (len(q), repr(q[-25:])))
    # locate by best prefix
    best = None
    for n in (100, 96, 90, 80, 70, 60, 50, 40, 30, 20, 12, 8):
        if n > len(q):
            continue
        ph = [i+1 for i, l in enumerate(ls) if q[:n] in l]
        if ph:
            best = (n, ph)
            break
    if best is None:
        out.append('  NO PREFIX MATCH AT ALL (tried down to 8 chars)')
        continue
    n, ph = best
    ln = ls[ph[0]-1]
    out.append('  best prefix len %d at lines %s' % (n, ph))
    out.append('  ON-DISK LINE[:200] = %s' % ln[:200])
    out.append('  ON-DISK LINE[-80:] = %s' % ln[-80:])
    out.append('  Q[:%d]           = %s' % (min(n+40, len(q)), q[:n+40]))
    # char-by-char first divergence
    k = 0
    while k < len(q) and q[k] in ln:
        k += 1
    out.append('  first divergence around q[%d] = %s' % (k, repr(q[max(0,k-10):k+20])))
    out.append('  FIX = %s' % r['fix'][:160])
    out.append('  VNOTE = %s' % r['verify_note'][:160])
io.open('_work/wo_miss.txt','wb').write(u'\n'.join(out).encode('utf-8'))
print('misses', len(miss))
