# -*- coding: utf-8 -*-
# v8: accident-driven shortlist with whole-file damaged-relative search.
import io, os, re, glob, difflib, sys
from collections import Counter
sys.path.insert(0, u'E:/math/_work')
import bodyside_detect as bd

BASE = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
MARK = [u'\u951a\u70b9', u'\u4e8b\u6545', u'\u88ab\u541e', u'\u541e\u6389',
        u'\u635f\u574f', u'\u66ff\u6362\u4e32', u'\u622a\u65ad', u'\u8986\u76d6\u6389']
CJK = bd.CJK


def relatives(q, lines, txt, maxind=10, minr=0.72):
    cq = Counter(q)
    found = []
    for j, x in enumerate(lines):
        if not x or abs(len(x) - len(q)) > 240:
            continue
        cl = Counter(x)
        if sum(min(cq[ch], cl[ch]) for ch in cq) < 0.7 * len(q):
            continue
        best = None
        for w in range(max(6, len(q) - maxind), min(len(x), len(q) + maxind) + 1):
            for k in range(0, len(x) - w + 1):
                d = x[k:k + w]
                if d == q:
                    continue
                rep, indel = bd.ops(q, d)
                if rep == 0 and 1 <= indel <= maxind:
                    r = difflib.SequenceMatcher(None, q, d, autojunk=False).ratio()
                    if r >= minr and (best is None or r > best[0]):
                        best = (r, d, k)
        if best:
            found.append((j + 1, best[0], best[1], best[2]))
    found.sort(key=lambda f: -f[1])
    return found


def scan(path):
    lines = bd.load(path)
    txt = u'\n'.join(lines)
    res = []
    for i, l in enumerate(lines):
        if not l or not any(m in l for m in MARK):
            continue
        for q in bd.quotes(l):
            if len(q) < 10 or not CJK.search(q):
                continue
            if q in txt:
                continue
            f = relatives(q, lines, txt)
            if f:
                res.append((i + 1, q, f, l))
    return res


if __name__ == '__main__':
    out = []
    tot = 0
    nset = set()
    for p in sorted(glob.glob(os.path.join(BASE, 'D*.md'))):
        m = re.match(u'^D([0-9]+)', os.path.basename(p))
        if not m or not (1 <= int(m.group(1)) <= 399):
            continue
        tag = u'D%03d' % int(m.group(1))
        if tag == u'D374':
            continue
        for dl, q, f, decl in scan(p):
            tot += 1
            nset.add(tag)
            out.append(u'#### %s DECL L%d' % (tag, dl))
            out.append(u'  Q(%d): %s' % (len(q), q))
            lines = bd.load(p)
            txt = u'\n'.join(lines)
            for ln, r, d, off in f[:3]:
                out.append(u'  SITE L%d r=%.3f cnt=%d off=%d dlen=%d qlen=%d : %s' % (
                    ln, r, txt.count(d), off, len(d), len(q), d))
    io.open(u'E:/math/_work/bodyside_short8.txt', 'wb').write(
        (u'\n'.join(out) or u'none').encode('utf-8'))
    print('pairs=%d notes=%d' % (tot, len(nset)))
