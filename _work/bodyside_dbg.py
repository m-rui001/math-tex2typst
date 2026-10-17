# -*- coding: utf-8 -*-
import io, os, re, sys, difflib
from collections import Counter
sys.path.insert(0, u'E:\\math\\_work')
import bodyside_detect as B

BASE = u'E:\\math\\\u7814\u7a76\u7b14\u8bb0'
NOTE = u'\u672c\u4f53\u4fa7'
SEC = re.compile(u'^##+\\s')
FENCE = re.compile(u'^\\s*' + chr(96) * 3)
fn = u'D08-Mezard-Parisi\u516c\u5f0f.md'
lines = B.load(os.path.join(BASE, fn))
heads = [i for i, l in enumerate(lines) if SEC.match(l)]
segs = [(0, heads[0] - 1)]
for k, h in enumerate(heads):
    e = heads[k + 1] - 1 if k + 1 < len(heads) else len(lines) - 1
    segs.append((h, e))
hand = [i for i, l in enumerate(lines) if NOTE in l]
inf = set()
open_f = False
for i, l in enumerate(lines):
    if FENCE.match(l):
        open_f = not open_f
        inf.add(i)
        continue
    if open_f:
        inf.add(i)
out = []
out.append(u'hand lines (1-based): %s' % [i + 1 for i in hand])
for i in hand:
    zz = [(s + 1, e + 1) for (s, e) in segs if s <= i <= e]
    out.append(u'  L%d zone=%s inf=%s' % (i + 1, zz, i in inf))
    if not zz:
        continue
    s, e = zz[0]
    zone = set(range(s - 1, e))
    for j in range(s - 1, e):
        if j in inf or not lines[j]:
            continue
        for q in B.quotes(lines[j]):
            outside = [k + 1 for k, x in enumerate(lines) if q in x and k not in zone]
            out.append(u'    declL%d Q(LEN%d)=%s  outside=%s  cjk=%s' %
                       (j + 1, len(q), q, outside, bool(B.CJK.search(q))))
    # explicit test for the target phrase
    q = u'\u8bba\u6587\u6ca1\u8ba8\u8bba'
    d = u'\u8bba\u6ca1\u8ba8\u8bba'
    rep, indel = B.ops(q, d)
    r = difflib.SequenceMatcher(None, q, d, autojunk=False).ratio()
    out.append(u'  TARGET q=%s d=%s rep=%d indel=%d ratio=%.3f' % (q, d, rep, indel, r))
    out.append(u'  d lines=%s' % [k + 1 for k, x in enumerate(lines) if d in x])
    # prefilter check on that line
    cl = Counter(lines[1057]); cq = Counter(q)
    out.append(u'  prefilter score=%s need=%.2f' %
               (sum(min(cq[c], cl[c]) for c in cq), 0.62 * len(q)))
with io.open(u'E:\\math\\_work\\bodyside_dbg.txt', 'wb') as f:
    f.write(u'\n'.join(out).encode('utf-8'))
sys.stdout.write('ok %d\n' % len(out))
