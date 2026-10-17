# -*- coding: utf-8 -*-
"""v12: handoff-zone restatement census + exact damaged-relative search (D001-D399).

Zone  = heading section holding a line that mentions the 本体侧 channel.
Restatement q = quoted string inside a zone, len>=4, CJK, occurring nowhere
                outside the zone (i.e. the body does not already carry it).
Damaged relative d = a body-line substring whose difflib profile vs q is pure
                insertion/deletion, 1<=indel<=8, ratio>=0.72.

Search strategy (bounded cost):
  len(q) <= 8  -> enumerate deletion variants of q (remove 1..4 chars) and look
                   for each as a literal substring; insertion damage is caught by
                   the q-verbatim anchor below (q appears inside a longer span).
  len(q) >= 9  -> anchor on every occurrence of a bigram of q inside a line, then
                   scan all windows of length [len(q)-8, len(q)+8] containing it.

usage: python bodyside_v12.py [ID ...]
"""
import io, os, re, sys, difflib
from itertools import combinations

sys.path.insert(0, u'E:\\math\\_work')
import bodyside_detect as B

BASE = u'E:\\math\\\u7814\u7a76\u7b14\u8bb0'
NOTE = u'\u672c\u4f53\u4fa7'
SEC = re.compile(u'^##+\\s')
NUM = re.compile(u'(\\d{1,3})')
FENCE = re.compile(u'^\\s*' + chr(96) * 3)
MAXI = 8


def id_of(fn):
    m = re.match(u'^D0*(\\d+)-', fn)
    if not m:
        return None
    v = int(m.group(1))
    return v if 1 <= v <= 399 else None


def segs_of(lines):
    heads = [i for i in range(len(lines)) if SEC.match(lines[i])]
    if not heads:
        return [(0, len(lines) - 1)]
    segs = [(0, heads[0] - 1)]
    for k, h in enumerate(heads):
        e = heads[k + 1] - 1 if k + 1 < len(heads) else len(lines) - 1
        segs.append((h, e))
    return segs


def del_variants(q):
    v = set()
    hi = min(4, len(q) - 2)
    for k in range(1, hi + 1):
        for pos in combinations(range(len(q)), k):
            ps = set(pos)
            s = u''.join(c for i, c in enumerate(q) if i not in ps)
            if len(s) >= 2:
                v.add(s)
    return v


def check(q, d):
    if not d or d == q:
        return None
    if len(d) < len(q) - MAXI or len(d) > len(q) + MAXI:
        return None
    rep, indel = B.ops(q, d)
    if rep == 0 and 1 <= indel <= MAXI:
        r = difflib.SequenceMatcher(None, q, d, autojunk=False).ratio()
        if r >= 0.72:
            return r
    return None


def find_relatives(q, lines, zset, inf, segs):
    hits = []
    L = len(q)
    if L <= 8:
        variants = sorted(del_variants(q))
        for v in variants:
            r = check(q, v)
            if r is None:
                continue
            for k in range(len(lines)):
                if k in zset or k in inf or not lines[k]:
                    continue
                if v in lines[k]:
                    cnt = sum(lines[y].count(v) for y in range(len(lines)) if y not in zset)
                    hits.append((r, k + 1, v, cnt))
    # anchor pass: verbatim q (insertion damage) and bigram windows
    anchors = []
    if L >= 9:
        for i in range(L - 1):
            anchors.append(q[i:i + 2])
    else:
        anchors = [q]
    for a in sorted(set(anchors)):
        for k in range(len(lines)):
            if k in zset or k in inf or not lines[k]:
                continue
            x = lines[k]
            start = 0
            while True:
                p = x.find(a, start)
                if p < 0:
                    break
                start = p + 1
                if L < 9:
                    for w in range(max(2, L - MAXI), min(len(x), L + MAXI) + 1):
                        for t in range(max(0, p - MAXI), min(len(x) - w + 1, p + 1)):
                            d = x[t:t + w]
                            r = check(q, d)
                            if r is not None:
                                cnt = sum(y.count(d) for j, y in enumerate(lines) if j not in zset)
                                hits.append((r, k + 1, d, cnt))
                else:
                    for t in range(max(0, p - MAXI), p + 1):
                        for w in range(max(2, L - MAXI), min(len(x) - t, L + MAXI) + 1):
                            d = x[t:t + w]
                            r = check(q, d)
                            if r is not None:
                                cnt = sum(y.count(d) for j, y in enumerate(lines) if j not in zset)
                                hits.append((r, k + 1, d, cnt))
    best = {}
    for (r, ln, d, cnt) in hits:
        key = (ln, d)
        if key not in best or r > best[key][0]:
            best[key] = (r, cnt)
    return [(v[0], ln, d, v[1]) for ((ln, d), v) in best.items()]


def sec_of(ln, lines, segs):
    for (ss, ee) in segs:
        if ss <= ln - 1 <= ee:
            if SEC.match(lines[ss]):
                mm = NUM.search(lines[ss][2:])
                return mm.group(1) if mm else u'?'
            return u'pre'
    return u'?'


only = set(int(x) for x in sys.argv[1:])
out = []
nq = nrel = 0
for fn in sorted(os.listdir(BASE)):
    if not fn.endswith(u'.md'):
        continue
    tid = id_of(fn)
    if tid is None or (only and tid not in only):
        continue
    lines = B.load(os.path.join(BASE, fn))
    segs = segs_of(lines)
    hand = [i for i, l in enumerate(lines) if NOTE in l]
    if not hand:
        continue
    zones = []
    for i in hand:
        for (s, e) in segs:
            if s <= i <= e:
                zones.append((s, e))
                break
        else:
            zones.append((i, i))
    zones = sorted(set(zones))
    zset = set()
    for (s, e) in zones:
        zset.update(range(s, e + 1))
    inf = set()
    open_f = False
    for i in range(len(lines)):
        if FENCE.match(lines[i]):
            open_f = not open_f
            inf.add(i)
            continue
        if open_f:
            inf.add(i)
    qs = []
    for j in sorted(zset):
        if j in inf or not lines[j]:
            continue
        for q in B.quotes(lines[j]):
            if len(q) < 4 or not B.CJK.search(q) or q in qs:
                continue
            if any(q in lines[k] for k in range(len(lines)) if k not in zset):
                continue
            qs.append(q)
    for q in qs:
        nq += 1
        hits = find_relatives(q, lines, zset, inf, segs)
        if hits:
            nrel += 1
            hits.sort(key=lambda h: (-h[0], h[1]))
            out.append(u'## %s zoneL%s Q(LEN%d)=%s' % (
                fn, u','.join(u'%d-%d' % (s + 1, e + 1) for (s, e) in zones), len(q), q))
            for (r, ln, d, cnt) in hits[:6]:
                out.append(u'   REL L%d sec=§%s filecnt=%d ratio=%.3f d=%s' % (ln, sec_of(ln, lines, segs), cnt, r, d))
                out.append(u'       raw: %s' % lines[ln - 1][:200])
            out.append(u'')
        else:
            out.append(u'-- %s noREL Q(LEN%d)=%s' % (fn, len(q), q))

with io.open(u'E:\\math\\_work\\bodyside_v12.txt', 'wb') as f:
    f.write(u'\n'.join(out).encode('utf-8'))
sys.stdout.write('restatements=%d with_relative=%d\n' % (nq, nrel))
