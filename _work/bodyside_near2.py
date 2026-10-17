# -*- coding: utf-8 -*-
# Near-miss detector v2 for the D374 shape.
# Collect CJK quoted strings from declaration lines in D001-D399 notes; for
# each, report (a) lines where it occurs verbatim, (b) lines hosting a damaged
# relative (similarity 0.80..0.998). The site is a repair candidate when the
# verbatim occurrences live only inside the declaration and a damaged relative
# sits elsewhere.
import io, os, re, glob, difflib
from collections import Counter

BASE = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
PAIRS = [(u'\u201c', u'\u201d'), (u'\u300c', u'\u300d'),
         (u'\u300e', u'\u300f'), (u'"', u'"'),
         (u'\u300a', u'\u300b')]
ACC = [u'\u4e8b\u6545', u'\u951a\u70b9', u'\u88ab\u541e', u'\u635f\u574f',
       u'\u635f\u6bc1', u'\u622a\u65ad', u'\u541e\u6389', u'\u66ff\u6362',
       u'\u6062\u590d', u'\u91cd\u8ff0', u'\u539f\u53e5', u'\u539f\u6587',
       u'\u8bfb\u4f5c', u'\u6539\u56de', u'\u5199\u6cd5', u'\u7167\u6284',
       u'\u4e22\u5b57', u'\u843d\u5b57', u'\u884d\u5b57', u'\u8bef\u690d']
CJK = re.compile(u'[\u4e00-\u9fff]')

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

out = []
npairs = 0
nnotes = 0
for p in sorted(glob.glob(os.path.join(BASE, 'D*.md'))):
    n = idnum(os.path.basename(p))
    if n is None or n < 1 or n > 399:
        continue
    txt = io.open(p, 'rb').read().decode('utf-8')
    lines = txt.split(u'\n')
    decl = [i for i, l in enumerate(lines) if any(a in l for a in ACC)]
    if not decl:
        continue
    declset = set(decl)
    findings = []
    seen = set()
    for i in decl:
        for q in quotes(lines[i]):
            if len(q) < 10 or q in seen or not CJK.search(q):
                continue
            seen.add(q)
            verb = [j + 1 for j, l in enumerate(lines) if q in l]
            cq = Counter(q)
            hits = {}
            for j, l in enumerate(lines):
                if not l or abs(len(l) - len(q)) > 150:
                    continue
                cl = Counter(l)
                if sum(min(cq[ch], cl[ch]) for ch in cq) < 0.75 * len(q):
                    continue
                sm = difflib.SequenceMatcher(None, q, l, autojunk=False)
                bl, bi, bs = sm.find_longest_match(0, len(q), 0, len(l))
                if bs < max(4, int(0.4 * len(q))):
                    continue
                lo = max(0, bi - len(q) - 4)
                hi = min(len(l), bi + bs + len(q) + 4)
                for w in (len(q) - 2, len(q) - 1, len(q), len(q) + 1, len(q) + 2, len(q) + 3):
                    if w < 8:
                        continue
                    for k in range(lo, max(lo, hi - w) + 1):
                        sub = l[k:k + w]
                        if len(sub) < 8 or sub == q:
                            continue
                        cs = Counter(sub)
                        if sum(min(cq[ch], cs[ch]) for ch in cq) < 0.85 * len(q):
                            continue
                        r = difflib.SequenceMatcher(None, q, sub, autojunk=False).ratio()
                        if 0.80 <= r < 0.999:
                            key = (j + 1, sub)
                            if key not in hits or hits[key] < r:
                                hits[key] = r
            near = sorted(hits.items(), key=lambda x: -x[1])[:4]
            if not near:
                continue
            outside = [x for x in verb if x not in [dd + 1 for dd in decl]]
            findings.append((i + 1, q, verb, outside, near))
    if findings:
        nnotes += 1
        npairs += len(findings)
        out.append(u'###### D%03d %s pairs=%d' % (n, os.path.basename(p), len(findings)))
        for dl, q, verb, outside, near in findings:
            out.append(u' DECL_L%d  verbatim_lines=%s  verbatim_outside_decl=%s' % (dl, verb, outside))
            out.append(u'   Q(%d): %s' % (len(q), q[:220]))
            for (j, s), r in near:
                out.append(u'   NEAR r=%.3f L%d cnt=%d : %s' % (r, j, txt.count(s), s[:220]))
        out.append(u'')
io.open(u'E:/math/_work/bodyside_near2.txt', 'wb').write(u'\n'.join(out).encode('utf-8'))
print('pairs=%d notes=%d' % (npairs, nnotes))
