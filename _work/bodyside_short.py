# -*- coding: utf-8 -*-
# Shortlist v3: D374-shape candidates.
# Requirements: declaration line cites an absolute line number; the restated
# quote q occurs verbatim only inside the declaration block; at the cited line
# (or +-4) sits a string d with cnt(d)==1 whose edit script vs q uses only
# insertions/deletions (no substitutions) and |len(q)-len(d)|<=10.
import io, os, re, glob, difflib
from collections import Counter

BASE = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
PAIRS = [(u'\u201c', u'\u201d'), (u'\u300c', u'\u300d'), (u'"', u'"')]
CJK = re.compile(u'[\u4e00-\u9fff]')
CITE = re.compile(u'(?:\\bL|\\u7b2c\\s*)([0-9]{1,5})(?:\\s*(?:\\u884c|\\u3001|,|\\uff0c|\\s))')
CN_LINE = re.compile(u'\u7b2c\\s*([0-9]{1,5})\\s*[\u3001,\uff0c]?[^0-9]{0,4}\u884c')
NUMTOK = re.compile('[0-9]{1,5}')

def idnum(name):
    m = re.match(u'^D([0-9]+)', name)
    return int(m.group(1)) if m else None

def quotes(line):
    res = []
    for o, c in PAIRS:
        i = 0
        while True:
            a = line.find(o, i)
            if a < 0:
                break
            b = line.find(c, a + 1)
            if b < 0:
                break
            s = line[a + 1:b].strip()
            if s:
                res.append(s)
            i = b + 1
    return res

def edits(q, d):
    """return (n_replace, n_ins, n_del) counting replaced char totals"""
    sm = difflib.SequenceMatcher(None, q, d, autojunk=False)
    rep = ins = dele = 0
    for tag, i1, i2, j1, j2 in sm.get_opcodes():
        if tag == 'replace':
            rep += max(i2 - i1, j2 - j1)
        elif tag == 'insert':
            ins += j2 - j1
        elif tag == 'delete':
            dele += i2 - i1
    return rep, ins, dele

out = []
nshort = 0
for p in sorted(glob.glob(os.path.join(BASE, 'D*.md'))):
    n = idnum(os.path.basename(p))
    if n is None or n < 1 or n > 399:
        continue
    txt = io.open(p, 'rb').read().decode('utf-8')
    lines = txt.split(u'\n')
    # declaration lines = lines that cite a line number and quote something
    cand_decl = []
    for i, l in enumerate(lines):
        if CN_LINE.search(l) and any(o in l for o, _ in PAIRS):
            cand_decl.append(i)
    if not cand_decl:
        continue
    hits = []
    for i in cand_decl:
        cited = set(int(x) for x in NUMTOK.findall(lines[i]))
        cited |= set(int(x) for x in CN_LINE.findall(lines[i]))
        for q in quotes(lines[i]):
            if len(q) < 8 or not CJK.search(q):
                continue
            verb = [j + 1 for j, l in enumerate(lines) if q in l]
            if any(abs(v - (i + 1)) > 30 for v in verb):
                continue          # q already present far from declaration
            cq = Counter(q)
            for j in range(1, len(lines)):
                if abs(j + 1 - i) <= 2:
                    continue
                ok = False
                for t in cited:
                    if abs(j + 1 - t) <= 4:
                        ok = True
                if not ok:
                    continue
                l = lines[j]
                if not l:
                    continue
                cl = Counter(l)
                if sum(min(cq[ch], cl[ch]) for ch in cq) < 0.75 * len(q):
                    continue
                best = None
                lo = max(0, len(l) - 0)
                for w in range(max(6, len(q) - 10), len(q) + 11):
                    if w > len(l):
                        break
                    for k in range(0, len(l) - w + 1):
                        d = l[k:k + w]
                        rep, ins, dele = edits(q, d)
                        if rep == 0 and (ins + dele) <= 8 and (ins + dele) >= 1:
                            r = difflib.SequenceMatcher(None, q, d, autojunk=False).ratio()
                            if best is None or r > best[0]:
                                best = (r, d, k, rep, ins, dele)
                if best:
                    r, d, k, rep, ins, dele = best
                    cnt = txt.count(d)
                    hits.append((i + 1, q, verb, j + 1, r, d, cnt, ins, dele))
    if hits:
        seen = set()
        keep = []
        for h in hits:
            key = (h[1], h[4])
            if key in seen:
                continue
            seen.add(key)
            keep.append(h)
        if keep:
            nshort += len(keep)
            out.append(u'###### D%03d %s hits=%d' % (n, os.path.basename(p), len(keep)))
            for dl, q, verb, sl, r, d, cnt, ins, dele in keep:
                out.append(u' DECL L%d cited_verbatim=%s' % (dl, verb))
                out.append(u'   Q(%d): %s' % (len(q), q[:200]))
                out.append(u'   SITE L%d r=%.3f ins=%d del=%d cnt=%d : %s' % (sl, r, ins, dele, cnt, d[:200]))
            out.append(u'')
io.open(u'E:/math/_work/bodyside_short.txt', 'wb').write(u'\n'.join(out).encode('utf-8'))
print('shortlist=%d' % nshort)
