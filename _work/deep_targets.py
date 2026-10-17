# -*- coding: utf-8 -*-
# Prepare the deepening dispatch: for each target note collect the preprints dir the
# note itself names, current gate metrics, and the [speculation] marker count.
import io, os, sys

B = chr(92)
ROOT = os.path.join('E:' + B + B, 'math', u'\u7814\u7a76\u7b14\u8bb0')
sys.path.insert(0, os.path.join('E:' + B + B, 'math', '.tools'))
import gate as G

PRE = u'preprints'
SPEC = u'[' + u'\u63a8\u6d4b' + u']'
out = []
for nid in ('D535', 'D256', 'D278'):
    fn = [f for f in os.listdir(ROOT) if f.startswith(nid + '-')]
    p = os.path.join(ROOT, fn[0])
    t = io.open(p, encoding='utf-8', errors='replace').read()
    r = G.chk(p, quiet=True)
    i = t.find(PRE)
    out.append('%s file=%s' % (nid, fn[0]))
    out.append('   bytes=%d secs=%d rows=%d math=%d spec=%d problems=%s' % (r['size'], r['secs'], r['rows'], r['math'], t.count(SPEC), r['problems']))
    out.append('   first-preprints@%d: %s' % (i, t[max(0, i - 60):i + 90].replace('\n', ' / ') if i >= 0 else 'NONE'))
    head = t[:400].replace('\n', ' / ')
    out.append('   head: ' + head[:260])
io.open(os.path.join('E:' + B + B, 'math', '_work', 'deep_targets.txt'), 'wb').write(('\n'.join(out) + '\n').encode('utf-8'))
print('ok')
