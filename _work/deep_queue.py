# -*- coding: utf-8 -*-
# Build the deepening queue: for every note in the measured shallow tail, capture the
# gate metrics, the heading shape it actually uses, and the preprints dir its own §0
# registers (verified to exist). Read-only; feeds the next writer dispatch.
import io, os, re, sys, glob

B = chr(92)
ROOT = os.path.join('E:' + B + B, 'math', u'\u7814\u7a76\u7b14\u8bb0')
PRE = os.path.join('E:' + B + B, 'math', 'preprints')
sys.path.insert(0, os.path.join('E:' + B + B, 'math', '.tools'))
import gate as G

TAIL = ['D80', 'D95', 'D93', 'D90', 'D89', 'D81', 'D92', 'D84', 'D463', 'D85', 'D78', 'D94',
        'D66', 'D452', 'D91', 'D265', 'D86', 'D278', 'D769', 'D529', 'D175', 'D12', 'D233',
        'D535', 'D256']
SPEC = chr(91) + u'\u63a8\u6d4b' + chr(93)
DIRRE = re.compile(u'preprints/' + u'([A-Za-z0-9._-]+)')

out = []
for nid in TAIL:
    hits = [f for f in os.listdir(ROOT) if f.startswith(nid + '-') and f.endswith('.md')]
    if len(hits) != 1:
        out.append('%s NOTE-LOOKUP-AMBIGUOUS %s' % (nid, hits))
        continue
    p = os.path.join(ROOT, hits[0])
    raw = io.open(p, 'rb').read()
    t = raw.decode('utf-8')
    r = G.chk(p, quiet=True)
    heads = [l for l in t.split('\n') if l.startswith('## ')]
    shape = 'with-section-sign' if any(h.startswith(u'## \u00a7') for h in heads) else 'bare-number'
    if len(heads) != r['secs']:
        shape = 'MIXED-TITLES'
    dirs = DIRRE.findall(t.replace(chr(92), u'/'))
    d = None
    for cand in dirs:
        if os.path.isdir(os.path.join(PRE, cand)):
            d = cand
            break
    ok = bool(d)
    out.append('%s bytes=%d lines=%d secs=%d shape=%s rows=%d math=%d spec=%d problems=%s dir_ok=%s dir=%s' % (
        nid, len(raw), t.count('\n') + 1, r['secs'], shape, r['rows'], r['math'], t.count(SPEC),
        r['problems'], ok, (d or 'NONE')[:70]))
io.open(os.path.join('E:' + B + B, 'math', '_work', 'deep_queue.txt'), 'wb').write(('\n'.join(out) + '\n').encode('utf-8'))
print('queue entries=%d' % len(out))
