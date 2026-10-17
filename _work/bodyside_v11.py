# -*- coding: utf-8 -*-
"""v11: handoff-zone restatement census + gap-tolerant damaged-relative search.

Zone = the heading section containing a line that mentions the 本体侧 channel.
Restatement q = quoted string in the zone, len>=4, contains CJK, and occurs
NOWHERE in the note outside the zone.
Damaged relative d = span of a body line that matches q's characters in order
with <=8 chars skipped between neighbours, and whose difflib opcode profile vs q
is pure insertion/deletion (rep==0, 1<=indel<=8, ratio>=0.72), unique in file.

usage: python bodyside_v11.py [ID ...]
"""
import io, os, re, sys, difflib
from collections import Counter

sys.path.insert(0, u'E:\\math\\_work')
import bodyside_detect as B

BASE = u'E:\\math\\\u7814\u7a76\u7b14\u8bb0'
NOTE = u'\u672c\u4f53\u4fa7'
SEC = re.compile(u'^##+\\s')
NUM = re.compile(u'(\\d{1,3})')
FENCE = re.compile(u'^\\s*' + chr(96) * 3)
MAXGAP = 8


def id_of(fn):
    m = re.match(u'^D0*(\\d+)-', fn)
    if not m:
        return None
    v = int(m.group(1))
    return v if 1 <= v <= 399 else None


def segs_of(lines):
    heads = [i for i, l in enumerate(lines) if SEC.match(lines[i])]
    if not heads:
        return [(0, len(lines) - 1)]
    segs = [(0, heads[0] - 1)]
    for k, h in enumerate(heads):
        e = heads[k + 1] - 1 if k + 1 < len(heads) else len(lines) - 1
        segs.append((h, e))
    return segs


def gapre(q):
    parts = [re.escape(q[0])]
    for ch in q[1:]:
        parts.append(u'.{0,%d}' % MAXGAP)
        parts.append(re.escape(ch))
    return re.compile(u''.join(parts))


def relatives(q, x, rx):
    """candidate damaged relatives of q inside line x"""
    res = []
    for m in rx.finditer(x):
        spans = [x[m.start():m.end()]]
        # also trimmed ends and one-char-shorter variants
        for cut in range(1, 4):
            if m.end() - m.start() > cut + 2:
                spans.append(x[m.start():m.end() - cut])
                spans.append(x[m.start() + cut:m.end()])
        for extra in range(1, MAXGAP + 1):
            a = max(0, m.start() - extra)
            b = min(len(x), m.end() + extra)
            spans.append(x[a:m.end()])
            spans.append(x[m.start():b])
        for d in set(spans):
            if not d or d == q or len(d) < len(q) - MAXGAP or len(d) > len(q) + MAXGAP:
                continue
            rep, indel = B.ops(q, d)
            if rep == 0 and 1 <= indel <= MAXGAP:
                r = difflib.SequenceMatcher(None, q, d, autojunk=False).ratio()
                if r >= 0.72:
                    res.append((r, d))
    return res


only = set(int(x) for x in sys.argv[1:])
out = []
nq = nrel = 0
for fn in sorted(os.listdir(BASE)):
    if not fn.endswith(u'.md'):
        continue
    tid = id_of(fn)
    if tid is None or (only and tid not in only):
        continue
    path = os.path.join(BASE, fn)
    lines = B.load(path)
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
    for i, l in enumerate(lines):
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
            if len(q) < 4 or not B.CJK.search(q):
                continue
            if any(q in lines[k] for k in range(len(lines)) if k not in zset):
                continue
            if q in qs:
                continue
            qs.append(q)
    if not qs:
        continue
    body = [(k, lines[k]) for k in range(len(lines)) if k not in zset and k not in inf and lines[k]]
    for q in qs:
        nq += 1
        rx = gapre(q)
        hits = []
        for (k, x) in body:
            for (r, d) in relatives(q, x, rx):
                cnt = sum(lines[y].count(d) for y in range(len(lines)) if y not in zset)
                hits.append((r, k + 1, d, cnt))
        head = u'## %s restatement Q(LEN%d)=%s' % (fn, len(q), q)
        if hits:
            nrel += 1
            hits.sort(key=lambda h: (-h[0], h[1]))
            out.append(head)
            for (r, ln, d, cnt) in hits[:6]:
                sn = None
                for (ss, ee) in segs:
                    if ss <= ln - 1 <= ee:
                        mm = NUM.search(lines[ss][2:]) if SEC.match(lines[ss]) else None
                        sn = mm.group(1) if mm else u'pre'
                out.append(u'   REL L%d sec=§%s cnt=%d ratio=%.3f d=%s' % (ln, sn, cnt, r, d))
                out.append(u'       raw: %s' % lines[ln - 1][:200])
            out.append(u'')
        else:
            out.append(u'-- %s  (no relative) Q=%s' % (fn, q))

with io.open(u'E:\\math\\_work\\bodyside_v11.txt', 'wb') as f:
    f.write(u'\n'.join(out).encode('utf-8'))
sys.stdout.write('restatements=%d with_relative=%d out_lines=%d\n' % (nq, nrel, len(out)))
