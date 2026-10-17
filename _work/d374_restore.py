# -*- coding: utf-8 -*-
# D374 L209: restore the sentence the author says an anchor slip destroyed (their own
# restatement at L270 is the credential). Line-scoped so the declaration that QUOTES
# the damaged form stays untouched. Then census the corpus-wide "give it to the body
# side for restoration" family.
import io, os

B = chr(92)
ROOT = os.path.join('E:' + B + B, 'math', u'\u7814\u7a76\u7b14\u8bb0')
OLD = u'\u8fd9\u672c\u8eab\u662f\u8bba\u6587\u6700\u6df1\u7684\u7684\u8bbe\u8ba1\u58f0\u660e\u3002'
NEW = u'\u8fd9\u4e2a\u987a\u5e8f\u672c\u8eab\u662f\u8bba\u6587\u6700\u6df1\u7684\u8bbe\u8ba1\u58f0\u660e\u3002'
KEY = u'\u672c\u4f53\u4fa7'

fn = [f for f in os.listdir(ROOT) if f.startswith('D374-')][0]
p = os.path.join(ROOT, fn)
raw = io.open(p, 'rb').read()
assert raw.count(b'\r') == 0, 'CR present'
t = raw.decode('utf-8')
L = t.split('\n')
n0, sz0 = len(L), len(raw)
assert L[208].count(OLD) == 1, 'target sentence not unique on L209'
assert L[269].count(OLD) == 1, 'the declaration at L270 must quote the damaged form'
assert t.count(OLD) == 2
L[208] = L[208].replace(OLD, NEW)
out = '\n'.join(L).encode('utf-8')
assert len(out) == sz0 + (len(NEW.encode('utf-8')) - len(OLD.encode('utf-8'))), 'byte delta'
assert out.count(b'\r') == 0 and out.decode('utf-8').count('\n') == n0 - 1, 'line drift'
assert out.decode('utf-8').count(OLD) == 1, 'damaged form must survive only in L270'
io.open(p, 'wb').write(out)
print('D374 %d -> %d bytes, lines %d, OLD left=1 (L270)' % (sz0, len(out), n0))

# family census: notes that hand the body side a restated text to restore
hits = []
for f in sorted(os.listdir(ROOT)):
    if not (f.startswith('D') and f.endswith('.md')):
        continue
    s = io.open(os.path.join(ROOT, f), 'rb').read().decode('utf-8', 'replace')
    c = s.count(KEY)
    if c:
        hits.append((f.split('-')[0], c, f[:26]))
lines = ['D374 restore done: %d -> %d bytes' % (sz0, len(out)),
         'notes mentioning %s: %d, occurrences %d' % (KEY.encode('unicode_escape').decode(),
                                                      len(hits), sum(h[1] for h in hits))]
lines += ['%s n=%d %s' % h for h in hits]
io.open(os.path.join('E:' + B + B, 'math', '_work', 'body_side_family.txt'), 'wb').write(('\n'.join(lines) + '\n').encode('utf-8'))
print('family: notes=%d occ=%d' % (len(hits), sum(h[1] for h in hits)))
