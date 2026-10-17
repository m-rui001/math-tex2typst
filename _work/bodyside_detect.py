# -*- coding: utf-8 -*-
"""D374-shape detector (module).

Declaration line must (a) cite an absolute line number and (b) carry a quoted
restatement q of length >= 10 that is NOT present verbatim anywhere else in the
note.  Then, within +-5 lines of every cited number, look for the damaged
relative d of q: same chars as q up to pure insertions/deletions (no char
substitutions), 1 <= indel <= 8, ratio >= 0.72.
"""
import io, os, re, difflib
from collections import Counter

QP = [(u'\u201c', u'\u201d'), (u'\u300c', u'\u300d'), (u'"', u'"'),
      (u'\u300e', u'\u300f')]
CJK = re.compile(u'[\u4e00-\u9fff]')
CITE = re.compile(u'(?:\u7b2c\\s*|L\\s?)([0-9]{1,5})(?:\\s*(?:\u884c|\u3001|\u5230|\u81f3|\u4e0e|\uff0c|,|\\s|\\b))')


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


def load(path):
    return io.open(path, 'rb').read().decode('utf-8').split(u'\n')


def scan_lines(lines, radius=5):
    """return list of dicts, one per (declaration line, restatement) pair."""
    hits = []
    for i, l in enumerate(lines):
        if not l:
            continue
        cited = sorted(set(int(x) for x in CITE.findall(l)))
        if not cited:
            continue
        for q in quotes(l):
            if len(q) < 10 or not CJK.search(q):
                continue
            cq = Counter(q)
            verb = [j + 1 for j, x in enumerate(lines) if q in x and j != i]
            cands = []
            for t in cited:
                lo = max(0, t - 1 - radius)
                hi = min(len(lines), t + radius)
                for j in range(lo, hi):
                    if j == i or not lines[j]:
                        continue
                    x = lines[j]
                    if abs(len(x) - len(q)) > 200:
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
                            rep, indel = ops(q, d)
                            if rep == 0 and 1 <= indel <= 8:
                                r = difflib.SequenceMatcher(None, q, d, autojunk=False).ratio()
                                if r >= 0.72 and (best is None or r > best[0]):
                                    best = (r, d, k)
                    if best:
                        cands.append((j + 1, t, best[0], best[1], best[2]))
            if cands:
                cands.sort(key=lambda c: -c[2])
                hits.append({'decl': i + 1, 'q': q, 'verbatim': verb, 'cands': cands[:4],
                             'cited': cited})
    return hits
