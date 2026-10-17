# -*- coding: utf-8 -*-
# despace_verify.py — independent re-measure of the despace batch: per file the byte
# delta, the delimiter counts, the line count and the odd-'$'-line count, from the backup
# and the live note. The applier's own assertions are not evidence until they are read
# again from disk.
import io, glob, json, os, sys
sys.stdout.reconfigure(encoding='utf-8')

rows = {}
for l in io.open('_work/dollarmath_flip_tiers.jsonl', encoding='utf-8'):
    if l.strip():
        r = json.loads(l)
        rows.setdefault(r['file'], []).append(r)

tot_bytes = tot_odd = tot_files = 0
bad = []
for bk in sorted(glob.glob(u'_work/*.pre-despace.md')):
    k = os.path.basename(bk).split(u'.')[0]
    live = glob.glob(u'研究笔记/D%s-*.md' % k)
    assert len(live) == 1, live
    a = io.open(bk, encoding='utf-8').read()
    b = io.open(live[0], encoding='utf-8').read()
    la, lb = a.split(u'\n'), b.split(u'\n')
    odd = [i + 1 for i, l in enumerate(lb) if l.count(u'$') % 2 == 1]
    edits = sum(1 for r in rows[os.path.basename(live[0])] if
                [c for c in r['wsClear'] if c.startswith('DESPACE') and r['cands'][c]['spans'] == 1])
    checks = {
        'bytes_delta': len(b.encode('utf-8')) - len(a.encode('utf-8')),
        'expected': -edits,
        'lines': (len(la), len(lb)),
        'dollars': (a.count(u'$'), b.count(u'$')),
        'backticks': (a.count(u'`'), b.count(u'`')),
        'cr': (a.count(u'\r'), b.count(u'\r')),
        'odd_lines_after': len(odd),
    }
    ok = (checks['bytes_delta'] == checks['expected'] and checks['lines'][0] == checks['lines'][1]
          and checks['dollars'][0] == checks['dollars'][1]
          and checks['backticks'][0] == checks['backticks'][1]
          and checks['cr'][0] == checks['cr'][1] == 0)
    if not ok:
        bad.append((k, checks))
    tot_files += 1
    tot_bytes += -checks['bytes_delta']
    tot_odd += len(odd)
    print(u'D%-4s edits=%-2d bytes%+d $=%d `=%d oddlines=%d %s' % (
        k, edits, checks['bytes_delta'], checks['dollars'][1], checks['backticks'][1],
        len(odd), 'OK' if ok else 'FAIL'))
print(u'BYTES_FREED=%d odd_lines_total=%d files=%d FAIL=%d' % (tot_bytes, tot_odd, tot_files, len(bad)))
for k, c in bad:
    print(u'FAIL', k, c)
