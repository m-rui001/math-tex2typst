# -*- coding: utf-8 -*-
# Check a ledger draft against the gate's own banned-string constants, then append
# it only when every count is zero. Usage: python _work/draft_check.py <draft> [--apply]
import io, os, sys, re

B = chr(92)
sys.path.insert(0, os.path.join('E:' + B + B, 'math', '.tools'))
import gate as G

d = sys.argv[1]
t = io.open(d, encoding='utf-8').read()
raw = io.open(d, 'rb').read()
hits = {}
for name, val in (('emDash', t.count(G.EM)), ('ershi', t.count(G.ERSHI)), ('bc', t.count(G.BC)),
                  ('dunpai', t.count(G.DUNPAI)), ('comma2', t.count(G.COMMA2)),
                  ('contrast', len(G.CONTRA.findall(t))), ('bareHRule', len(re.findall(r'(?m)^---$', t)))):
    if val:
        hits[name] = val
for w in G.BAN:
    if t.count(w):
        hits['ban:' + w.encode('unicode_escape').decode()] = t.count(w)
if raw.count(b'\r'):
    hits['CR'] = raw.count(b'\r')
print('%s bytes=%d lines=%d' % (d, len(raw), t.count(chr(10)) + 1))
print('HITS: ' + (', '.join('%s=%d' % kv for kv in sorted(hits.items())) if hits else 'none'))
if hits or '--apply' not in sys.argv:
    sys.exit(1 if hits else 2)
os.execv(sys.executable, [sys.executable, os.path.join('E:' + B + B, 'math', '_work', 'ledger_append.py'), d])
