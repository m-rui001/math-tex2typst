# -*- coding: utf-8 -*-
"""Fast delimiter-array model of the corrected grammar + single-character fix hunter.

A file is reduced to the ordered list of DELIMITER-ELIGIBLE '$' (not fence material,
not inline-code material -- single-line OR multi-line -- and not the '$' of a \$
escape), read off the corrected blanked string, plus the blanked character on each
side. The shipped span grammar is then replayed over that list. A span is a
"dollar-family site" iff at least one delimiter lies strictly between opener and
closer -- which is exactly the condition that makes KaTeX answer
"Can't use function '$' in math mode".

Validated site by site against _work/dollarmath_census2.js (node + KaTeX).
"""
import io, os, re, sys, glob
sys.stdout.reconfigure(encoding='utf-8')

D = chr(36)
BT = chr(96)
BSL = chr(92)
ROOT = 'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0' + '/'
WS = set(u' \t\n')
DIG = set(u'0123456789')
FENCE = re.compile(u'^(?:`{3,}|~{3,})')
INERT = (u'F', u'c', u'C')


def prov_of(text):
    """Corrected-口径 provenance ribbon, equal length to text.
    F fenced material, c single-line inline code, C inline code crossing a newline,
    E the escaped character of a \$-type escape, P plain."""
    lines = text.split(u'\n')
    prov = [list(u'P' * len(l)) for l in lines]
    infence = False
    tok = None
    fencey = []
    for l in lines:
        s = l.strip()
        hit = False
        if FENCE.match(s):
            if not infence:
                infence = True
                tok = s[0] * 3
                hit = True
            elif tok and s.startswith(tok):
                infence = False
                tok = None
                hit = True
        fencey.append(infence or hit)
    for li, l in enumerate(lines):
        if fencey[li]:
            prov[li] = [u'F'] * len(l)
    open_run = None
    for li, l in enumerate(lines):
        if fencey[li]:
            open_run = None
            continue
        j = 0
        m = len(l)
        while j < m:
            c = l[j]
            if c == BSL:
                j += 2
                continue
            if c == BT:
                k = 0
                while j + k < m and l[j + k] == BT:
                    k += 1
                if open_run is None:
                    open_run = (li, j, k)
                    j += k
                    continue
                if k == open_run[2]:
                    ol, oc, ok = open_run
                    if ol == li:
                        for q in range(oc, min(j + k, m)):
                            if prov[li][q] == u'P':
                                prov[li][q] = u'c'
                    else:
                        for q in range(oc, m):
                            if prov[li][q] == u'P':
                                prov[li][q] = u'C'
                        for sl in range(ol + 1, li):
                            prov[sl] = [u'C'] * len(lines[sl])
                        for q in range(0, j + k):
                            if prov[li][q] == u'P':
                                prov[li][q] = u'C'
                    open_run = None
                    j += k
                    continue
                j += k
                continue
            j += 1
        if l.strip() == u'':
            open_run = None
    for li, l in enumerate(lines):
        if fencey[li]:
            continue
        j = 0
        m = len(l)
        while j < m:
            if l[j] == BSL and j + 1 < m:
                if prov[li][j + 1] == u'P':
                    prov[li][j + 1] = u'E'
                j += 2
                continue
            j += 1
    return u''.join(u''.join(p) for p in prov)


def blanked(text, pr):
    return u''.join(u' ' if b in INERT else a for a, b in zip(text, pr))


def state(text):
    pr = prov_of(text)
    mk = blanked(text, pr)
    # an escaped \$ keeps its '$' in the blanked string but is NOT a delimiter
    dels = [p for p in range(len(mk)) if mk[p] == D and pr[p] != u'E']
    prev = [mk[p - 1] if p else u'' for p in dels]
    nxt = [mk[p + 1] if p + 1 < len(mk) else u'' for p in dels]
    return pr, mk, dels, prev, nxt


def pair(mk, dels, prev, nxt):
    res = []
    k = 0
    m = len(dels)
    n = len(mk)
    while k < m:
        a = dels[k]
        if k + 1 < m and dels[k + 1] == a + 1:
            found = -1
            j = k + 2
            while j + 1 < m:
                if dels[j + 1] == dels[j] + 1:
                    found = j
                    break
                j += 1
            if found < 0:
                res.append({u'kind': u'DUNCLOSED', u'i': k, u'j': None, u'interior': 0})
                break
            res.append({u'kind': u'DISPLAY', u'i': k, u'j': found,
                        u'interior': found - k - 1})
            k = found + 2
            continue
        if a + 1 >= n or nxt[k] in WS:
            k += 1
            continue
        found = -1
        j = k + 1
        while j < m:
            if prev[j] not in WS and nxt[j] not in DIG:
                found = j
                break
            j += 1
        if found < 0:
            res.append({u'kind': u'IUNCLOSED', u'i': k, u'j': None, u'interior': 0})
            break
        res.append({u'kind': u'INLINE', u'i': k, u'j': found,
                    u'interior': found - k - 1})
        k = found + 1
    return res


def sites(st):
    return [s for s in pair(st[u'mk'], st[u'dels'], st[u'prev'], st[u'nxt'])
            if s[u'interior'] > 0]


def unclosed(st):
    return [s for s in pair(st[u'mk'], st[u'dels'], st[u'prev'], st[u'nxt'])
            if s[u'kind'] in (u'IUNCLOSED', u'DUNCLOSED')]


def mkstate(path):
    text = io.open(path, encoding=u'utf-8').read()
    pr, mk, dels, prev, nxt = state(text)
    return {u'path': path, u'text': text, u'prov': pr, u'mk': mk,
            u'dels': dels, u'prev': prev, u'nxt': nxt, u'ends': None}


def edit(st, p, old, new):
    t = st[u'text']
    assert t[p] == old, (p, t[p], old)
    nt = t[:p] + new + t[p + 1:]
    pr, mk, dels, prev, nxt = state(nt)
    return {u'path': st[u'path'], u'text': nt, u'prov': pr, u'mk': mk,
            u'dels': dels, u'prev': prev, u'nxt': nxt, u'ends': None}


def line_of(st, off):
    return st[u'text'].count(u'\n', 0, off) + 1


def find(prefix):
    g = sorted(glob.glob(os.path.join(ROOT, prefix + u'-*.md')))
    if len(g) != 1:
        raise SystemExit(u'AMBIG %s n=%d' % (prefix, len(g)))
    return g[0]
