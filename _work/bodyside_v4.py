# -*- coding: utf-8 -*-
# Shortlist v4 (validated-shape search), core function reused for a D374 self-test.
import io, os, re, glob, difflib
from collections import Counter

BASE = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
QP = [(u'\u201c', u'\u201d'), (u'\u300c', u'\u300d'), (u'"', u'"'),
      (u'\u300e', u'\u300f')]
CJK = re.compile(u'[\u4e00-\u9fff]')
# 第 N 行 / 第 N、M 行 / L209 / 现第 N 行
CITE_A = re.compile(u'\u7b2c\\s*([0-9]{1,5})\\s*(?:\\u884c|\\u3001|\\u81f3|\\u5230|\\uff0c|,)')
CITE_B = re.compile(u'[Ll]\\s?([0-9]{2,5})\\b')

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

def dmg_ops(q, d):
    """(replace_chars, indel_chars) between restatement q and candidate d."""
    sm = difflib.SequenceMatcher(None, q, d, autojunk=False)
    rep = indel = 0
    for tag, i1, i2, j1, j2 in sm.get_opcodes():
        if tag == 'replace':
            rep += max(i2 - i1, j2 - j1)
        elif tag in ('insert', 'delete'):
            indel += (j2 - j1) + (i2 - i1)
    return rep, indel

def detect(name, txt):
    lines = txt.split(u'\n')
    res = []
    for i, l in enumerate(lines):
        if not l:
            continue
        cited = set(int(x) for x in CITE_A.findall(l)) | set(int(x) for x in CITE_B.findall(l))
        if not cited:
            continue
        qs = quotes(l)
        if not qs:
            continue
        for q in qs:
            if len(q) < 8 or not CJK.search(q):
                continue
            verb = [j + 1 for j, x in enumerate(lines) if q in x]
            near_site = [v for v in verb if any(abs(v - c) <= 4 for c in cited)]
            cq = Counter(q)
            found = []
            for j, x in enumerate(lines):
                if not x:
                    continue
                if any(abs(j + 1 - d0) <= 2 for d0 in [i + 1]):
                    continue
                cl = Counter(x)
                if sum(min(cq[ch], cl[ch]) for ch in cq) < 0.7 * len(q):
                    continue
                best = None
                for w in range(max(6, len(q) - 8), min(len(x), len(q) + 8) + 1):
                    for k in range(0, len(x) - w + 1):
                        d = x[k:k + w]
                        if d == q:
                            continue
                        rep, indel = dmg_ops(q, d)
                        if rep == 0 and 1 <= indel <= 8:
                            r = difflib.SequenceMatcher(None, q, d, autojunk=False).ratio()
                            if best is None or r > best[0]:
                                best = (r, d, k)
                if best:
                    cnt = txt.count(best[1])
                    found.append((j + 1, best[0], best[1], cnt, best[2]))
            found = [f for f in found if f[2] not in q]
            res.append((i + 1, q, verb, near_site, cited, found))
    return lines, res

if __name__ == '__main__':
    out = []
    nsite = 0
    files = []
    for pat, tag in ((u'E:/math/_work/bodyside_selftest/*.md', u'SELFTEST'),):
        files += [(tag, p) for p in glob.glob(pat)]
    for p in sorted(glob.glob(os.path.join(BASE, 'D*.md'))):
        m = re.match(u'^D([0-9]+)', os.path.basename(p))
        if m and 1 <= int(m.group(1)) <= 399:
            files.append((u'D%03d' % int(m.group(1)), p))
    for tag, p in files:
        txt = io.open(p, 'rb').read().decode('utf-8')
        lines, res = detect(tag, txt)
        keep = []
        for dl, q, verb, near_site, cited, found in res:
            if verb:
                continue                      # restatement already on disk
            cand = [f for f in found if f[4] == 1 or True]
            if not cand:
                continue
            cand.sort(key=lambda f: -f[1])
            keep.append((dl, q, cited, cand[:3]))
        if keep:
            nsite += len(keep)
            out.append(u'###### %s %s hits=%d' % (tag, os.path.basename(p), len(keep)))
            for dl, q, cited, cand in keep:
                out.append(u'  DECL L%d cited=%s' % (dl, sorted(cited)))
                out.append(u'   Q(%d): %s' % (len(q), q[:180]))
                for ln, r, d, cnt, k in cand:
                    out.append(u'   CAND L%d r=%.3f cnt=%d off=%d : %s' % (ln, r, cnt, k, d[:180]))
            out.append(u'')
    io.open(u'E:/math/_work/bodyside_short4.txt', 'wb').write(u'\n'.join(out).encode('utf-8'))
    print('candidate_decls=%d' % nsite)
