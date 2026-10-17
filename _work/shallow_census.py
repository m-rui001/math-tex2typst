# -*- coding: utf-8 -*-
# Shallow-tail census for the content leg: gate fields per note, so the deepening
# queue can be sized by measured section counts instead of by memory.
import io, os, glob, sys, collections

B = chr(92)
ROOT = os.path.join('E:' + B + B, 'math', u'\u7814\u7a76\u7b14\u8bb0')
sys.path.insert(0, os.path.join('E:' + B + B, 'math', '.tools'))
import gate as G

recs = []
for p in sorted(glob.glob(os.path.join(ROOT, 'D*.md'))):
    nid = os.path.basename(p).split('-')[0]
    r = G.chk(p, quiet=True)
    recs.append((nid, r['secs'], r['rows'], r['size'], r['math'], len(r['problems'])))

sec_hist = collections.Counter(x[1] for x in recs)
low = [x for x in recs if x[1] <= 12]
bad = [x for x in recs if x[5]]
out = ['notes=%d' % len(recs),
       'sections histogram: ' + ', '.join('%d:%d' % kv for kv in sorted(sec_hist.items())),
       'median secs=%s  mean=%.1f' % (sorted(x[1] for x in recs)[len(recs) // 2], sum(x[1] for x in recs) / float(len(recs))),
       'notes with secs<=12: %d   secs<=10: %d' % (len(low), sum(1 for x in recs if x[1] <= 10)),
       'notes with any gate problem: %d' % len(bad),
       'mean size=%d  min size=%d' % (sum(x[3] for x in recs) / len(recs), min(x[3] for x in recs)),
       '', 'shallow tail (secs<=12): note secs rows size math problems']
out += ['%s %d %d %d %d %d' % x for x in sorted(low, key=lambda y: (y[1], -y[3]))]
out.append('')
out.append('gate-problem notes: ' + ' '.join('%s(%d)' % (x[0], x[5]) for x in bad[:40]))
io.open(os.path.join('E:' + B + B, 'math', '_work', 'shallow_tail.txt'), 'wb').write(('\n'.join(out) + '\n').encode('utf-8'))
print('notes=%d shallow=%d problems=%d' % (len(recs), len(low), len(bad)))
