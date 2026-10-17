# -*- coding: utf-8 -*-
# Near-miss detector for the D374 shape.
# For each note D001-D399: collect CJK quoted strings from declaration lines
# (lines mentioning accident/anchor/restore tells). A quoted string that does
# NOT occur verbatim in the file is a candidate restatement; search the file
# for its damaged relatives (similarity 0.75..0.99) and report them.
import io, os, re, glob, difflib
from collections import Counter

BASE = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
OPEN1, CLOSE1 = u'\u201c', u'\u201d'          # curly double quotes
OPEN2, CLOSE2 = u'\u300c', u'\u300d'          # corner brackets
ACC = [u'\u4e8b\u6545', u'\u951a\u70b9', u'\u88ab\u541e', u'\u635f\u574f',
       u'\u635f\u6bc1', u'\u622a\u65ad', u'\u5403\u6389', u'\u66ff\u6362\u4e32',
       u'\u6062\u590d', u'\u91cd\u8ff0', u'\u539f\u53e5', u'\u539f\u6587',
       u'\u8bfb\u4f5c', u'\u6539\u56de', u'\u5199\u6cd5', u'\u7167\u6284']
CJK = re.compile(u'[\u4e00-\u9fff]')

def idnum(name):
    m = re.match(u'^D([0-9]+)', name)
    return int(m.group(1)) if m else None

def quotes(line):
    res = []
    for o, c in ((OPEN1, CLOSE1), (OPEN2, CLOSE2)):
        i = 0
        while True:
            a = line.find(o, i)
            if a < 0:
                break
            b = line.find(c, a + 1)
            if b < 0:
                break
            res.append(line[a + 1:b])
            i = b + 1
    return res

out = []
npairs = 0
nnotes = 0
for p in sorted(glob.glob(os.path.join(BASE, 'D*.md'))):
    n = idnum(os.path.basename(p))
    if n is None or n < 1 or n > 399:
        continue
    txt = io.open(p, 'rb').read().decode('utf-8')
    lines = txt.split(u'\n')
    decl = []
    for i, l in enumerate(lines):
        if any(a in l for a in ACC):
            decl.append(i)
    if not decl:
        continue
    seen = set()
    findings = []
    for i in decl:
        for q in quotes(lines[i]):
            if len(q) < 10 or q in seen:
                continue
            seen.add(q)
            if not CJK.search(q):
                continue
            cnt = txt.count(q)
            if cnt:            # restatement already present verbatim
                continue
            cq = Counter(q)
            best = []
            for j, l in enumerate(lines):
                if not l or abs(len(l) - len(q)) > 120:
                    continue
                # cheap char-overlap prefilter
                cl = Counter(l)
                ov = sum(min(cq[ch], cl[ch]) for ch in cq)
                if ov < 0.7 * len(q):
                    continue
                # anchor on the longest common block between q and the line
                m = difflib.SequenceMatcher(None, q, l, autojunk=False)
                bl, bi, bs = m.find_longest_match(0, len(q), 0, len(l))
                if bs < max(4, int(0.35 * len(q))):
                    continue
                lo = max(0, bi - len(q) - 6)
                hi = min(len(l), bi + bs + len(q) + 6)
                for w in (len(q) - 2, len(q) - 1, len(q), len(q) + 1, len(q) + 2, len(q) + 4):
                    if w < 8:
                        continue
                    for k in range(lo, max(lo, hi - w) + 1):
                        sub = l[k:k + w]
                        if len(sub) < 8:
                            continue
                        if sum(min(cq[ch], Counter(sub)[ch]) for ch in cq) < 0.8 * len(q):
                            continue
                        r = difflib.SequenceMatcher(None, q, sub, autojunk=False).ratio()
                        if 0.80 <= r < 0.999:
                            best.append((r, j + 1, sub))
            best.sort(key=lambda x: -x[0])
            uniq = []
            for r, j, s in best:
                if any(s == u[2] and u[0] > r for u in uniq):
                    continue
                if not any(difflib.SequenceMatcher(None, s, u[2]).ratio() > 0.93 for u in uniq):
                    uniq.append((r, j, s))
                if len(uniq) >= 3:
                    break
            if uniq:
                qc = txt.count(uniq[0][2])
                findings.append((i + 1, q, uniq, qc))
    if findings:
        npairs += len(findings)
        nnotes += 1
        out.append(u'###### D%03d %s  pairs=%d' % (n, os.path.basename(p), len(findings)))
        for dl, q, uniq, qc in findings:
            out.append(u'  DECL_L%d' % dl)
            out.append(u'   Q(%d): %s' % (len(q), q[:200]))
            for r, j, s in uniq:
                out.append(u'   NEAR r=%.3f L%d cnt_in_file=%d : %s' % (r, j, qc, s[:200]))
        out.append(u'')
io.open(u'E:/math/_work/bodyside_near.txt', 'wb').write(u'\n'.join(out).encode('utf-8'))
print('nearmiss_pairs=%d notes=%d' % (npairs, nnotes))
