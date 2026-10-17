# -*- coding: utf-8 -*-
"""v10: handoff-zone restatement scan (D001-D399).

For every note line containing the 本体侧 handoff word, take the whole heading
section that holds it as the DECLARATION ZONE.  Collect quoted strings from the
zone.  A quoted string q qualifies as a *restatement* only if it occurs nowhere
in the note outside the zone.  Then look in the body (outside the zone) for the
damaged relative d of q: pure insertions/deletions only (rep == 0),
1 <= indel <= 8, ratio >= 0.72.  Reports how many times d occurs outside the zone.

usage: python bodyside_v10.py [ID ...]     (no args = whole range)
"""
import io, os, re, sys, difflib
from collections import Counter

sys.path.insert(0, u'E:\\math\\_work')
import bodyside_detect as B

NOTE = u'\u672c\u4f53\u4fa7'
SEC = re.compile(u'^##+\\s')
NUM = re.compile(u'(\\d{1,3})')
FENCE = re.compile(u'^\\s*' + chr(96) * 3)

BASE = u'E:\\math\\\u7814\u7a76\u7b14\u8bb0'


def id_of(fn):
    m = re.match(u'^D0*(\\d+)-', fn)
    if not m:
        return None
    v = int(m.group(1))
    return v if 1 <= v <= 399 else None


def sections(lines):
    heads = [i for i, l in enumerate(lines) if SEC.match(l)]
    if not heads:
        return [(0, len(lines) - 1)]
    segs = [(0, heads[0] - 1)]
    for k, h in enumerate(heads):
        e = heads[k + 1] - 1 if k + 1 < len(heads) else len(lines) - 1
        segs.append((h, e))
    return segs


only = set(int(x) for x in sys.argv[1:])
out = []
tot_notes = tot_hits = 0
for fn in sorted(os.listdir(BASE)):
    if not fn.endswith(u'.md'):
        continue
    tid = id_of(fn)
    if tid is None or (only and tid not in only):
        continue
    lines = B.load(os.path.join(BASE, fn))
    segs = sections(lines)
    hand = [i for i, l in enumerate(lines) if NOTE in l]
    if not hand:
        continue
    tot_notes += 1
    zones = []
    for i in hand:
        for (s, e) in segs:
            if s <= i <= e:
                zones.append((s, e))
                break
        else:
            zones.append((i, i))
    inf = set()
    open_f = False
    for i, l in enumerate(lines):
        if FENCE.match(l):
            open_f = not open_f
            inf.add(i)
            continue
        if open_f:
            inf.add(i)
    for (s, e) in sorted(set(zones)):
        zone = set(range(s, e + 1))
        for j in sorted(zone):
            if j in inf or not lines[j]:
                continue
            for q in B.quotes(lines[j]):
                if len(q) < 4 or not B.CJK.search(q):
                    continue
                outside = [k + 1 for k, x in enumerate(lines) if q in x and k not in zone]
                if outside:
                    continue
                cq = Counter(q)
                cands = []
                for k, x in enumerate(lines):
                    if k in zone or k in inf or not x:
                        continue
                    if abs(len(x) - len(q)) > 200:
                        continue
                    cl = Counter(x)
                    if sum(min(cq[c], cl[c]) for c in cq) < 0.62 * len(q):
                        continue
                    best = None
                    for w in range(max(3, len(q) - 8), min(len(x), len(q) + 8) + 1):
                        for t in range(0, len(x) - w + 1):
                            d = x[t:t + w]
                            if d == q:
                                continue
                            rep, indel = B.ops(q, d)
                            if rep == 0 and 1 <= indel <= 8:
                                r = difflib.SequenceMatcher(None, q, d, autojunk=False).ratio()
                                if r >= 0.72 and (best is None or r > best[0]):
                                    best = (r, d, t)
                    if best:
                        cnt = 0
                        for y, x2 in enumerate(lines):
                            if y not in zone:
                                cnt += x2.count(best[1])
                        sn = None
                        for (ss, ee) in segs:
                            if ss <= k <= ee:
                                mm = NUM.search(lines[ss][2:]) if SEC.match(lines[ss]) else None
                                sn = mm.group(1) if mm else u'pre'
                        cands.append((best[0], k + 1, best[1], cnt, sn))
                if cands:
                    cands.sort(key=lambda c: -c[0])
                    tot_hits += 1
                    out.append(u'## NOTE %s zone L%d-%d declL%d' % (fn, s + 1, e + 1, j + 1))
                    out.append(u'   Q(LEN%d): %s' % (len(q), q))
                    for (r, ln, d, cnt, sn) in cands[:5]:
                        out.append(u'   SITE L%d sec=%s cnt=%d ratio=%.3f d=%s' % (ln, sn, cnt, r, d))
                    out.append(u'')

with io.open(u'E:\\math\\_work\\bodyside_v10.txt', 'wb') as f:
    f.write(u'\n'.join(out).encode('utf-8'))
sys.stdout.write('notes=%d hits=%d lines=%d\n' % (tot_notes, tot_hits, len(out)))
