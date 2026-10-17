# -*- coding: utf-8 -*-
# v5 shortlist: D374-shape detection, validated against a synthetic pre-repair
# copy of D374 in _work/bodyside_selftest.
import io, os, re, glob, difflib
from collections import Counter

BASE = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
QP = [(u'\u201c', u'\u201d'), (u'\u300c', u'\u300d'), (u'"', u'"'),
      (u'\u300e', u'\u300f')]
CJK = re.compile(u'[\u4e00-\u9fff]')
CITE = re.compile(u'(?:\u7b2c\\s*|L|L\\s)([0-9]{1,5})(?:\\s*\u884c|\\s*\\u3001|\\s*\\u5230|\\s*\\u81f3|\\b)')

def quotes(line):
    res = []
    for o, c in QP:
        i = 0
        while True:
            a = line.find(o, i)
            if a < 0:
                break
            b = line.find(c, a + 1)
            if b < 0:
                break
            s = line[a + 1:b].strip(u' \u3000')
            if s:
                res.append(s)
            i = b + 1
    return res

def ops(q, d):
    sm = difflib.SequenceMatcher(None, q, d, autojunk=False)
    rep = indel = 0
    for tag, i1, i2, j1, j2 in sm.get_opcodes():
        if tag == 'replace':
            rep += max(i2 - i1, j2 - j1)
        elif tag in ('insert', 'delete'):
            indel += (j2 - j1) + (i2 - i1)
    return rep, indel

def scan(path, tag):
    txt = io.open(path, 'rb').read().decode('utf-8')
    lines = txt.split(u'\n')
    hits = []
    for i, l in enumerate(lines):
        if not l:
            continue
        cited = set(int(x) for x in CITE.findall(l))
        if not cited:
            continue
        qs = quotes(l)
        if not qs:
            continue
        for q in qs:
            if len(q) < 10 or not CJK.search(q):
                continue
            ql = len(q)
            cq = Counter(q)
            verb = [j + 1 for j, x in enumerate(lines) if q in x and abs(j - i) > 1]
            best = []
            for t in cited:
                lo = max(0, t - 6)
                hi = min(len(lines), t + 5)
                for j in range(lo, hi):
                    if abs(j - i) <= 1:
                        continue
                    x = lines[j]
                    if not x or abs(len(x) - ql) > 150:
                        continue
                    cl = Counter(x)
                    if sum(min(cq[ch], cl[ch]) for ch in cq) < 0.7 * ql:
                        continue
                    loc = None
                    for w in range(max(6, ql - 8), min(len(x), ql + 8) + 1):
                        for k in range(0, len(x) - w + 1):
                            d = x[k:k + w]
                            rep, indel = ops(q, d)
                            if rep == 0 and 1 <= indel <= 8:
                                r = difflib.SequenceMatcher(None, q, d, autojunk=False).ratio()
                                if loc is None or r > loc[0]:
                                    loc = (r, d, k, indel)
                    if loc:
                        best.append((j + 1, loc[0], loc[1], loc[2], loc[3], t))
            if best:
                best.sort(key=lambda b: -b[1])
                hits.append((i + 1, q, verb, best[:3]))
    return hits

def dump(paths, outfile, label):
    out = []
    tot = 0
    for tag, p in paths:
        for dl, q, verb, best in scan(p, tag):
            tot += 1
            out.append(u'#### %s DECL L%d verbatim_other_lines=%s' % (tag, dl, verb))
            out.append(u'  Q(%d): %s' % (len(q), q[:200]))
            for ln, r, d, k, indel, t in best:
                out.append(u'  SITE L%d cited=%d r=%.3f indel=%d off=%d cnt_file=%d : %s'
                           % (ln, t, r, indel, k, 0, d[:200]))
    io.open(outfile, 'wb').write((u'\n'.join(out) or u'none').encode('utf-8'))
    print('%s shortlist=%d' % (label, tot))

if __name__ == '__main__':
    st = [(u'SELF', p) for p in glob.glob(u'E:/math/_work/bodyside_selftest/D374-*.md')]
    dump(st, u'E:/math/_work/bodyside_self_hits.txt', 'selftest')
    corp = []
    for p in sorted(glob.glob(os.path.join(BASE, 'D*.md'))):
        m = re.match(u'^D([0-9]+)', os.path.basename(p))
        if m and 1 <= int(m.group(1)) <= 399:
            corp.append((u'D%03d' % int(m.group(1)), p))
    dump(corp, u'E:/math/_work/bodyside_short5.txt', 'corpus')
