# -*- coding: utf-8 -*-
"""Char-level port of _work/dollarmath_census2.js spans() for cross-checking the
fast delimiter-array model in dm_model.py."""
import io, sys, os, json, collections
sys.path.insert(0, 'E:/math/_work')
sys.stdout.reconfigure(encoding='utf-8')
import dm_model as M

D = chr(36)
BT = chr(96)
BSL = chr(92)
DIG = set(u'0123456789')
WS = set(u' \t\n')


def char_spans(mk, delim):
    res = []
    n = len(mk)
    i = 0
    while i < n:
        if not delim[i]:
            i += 1
            continue
        if i + 1 < n and delim[i + 1]:
            j = i + 2
            while j < n and not (delim[j] and delim[j + 1]):
                j += 1
            if j >= n:
                res.append({u'kind': u'DUNCLOSED', u'a': i, u'interior': 0})
                break
            res.append({u'kind': u'DISPLAY', u'a': i, u'b': j,
                        u'interior': sum(1 for q in range(i + 2, j) if delim[q])})
            i = j + 2
            continue
        if i + 1 >= n or mk[i + 1] in WS:
            i += 1
            continue
        j = i + 1
        closer = -1
        while j < n:
            nxt = mk[j + 1] if j + 1 < n else u''
            if delim[j] and mk[j - 1] not in WS and nxt not in DIG:
                closer = j
                break
            j += 1
        if closer < 0:
            res.append({u'kind': u'IUNCLOSED', u'a': i, u'interior': 0})
            break
        res.append({u'kind': u'INLINE', u'a': i, u'b': closer,
                    u'interior': sum(1 for q in range(i + 1, closer) if delim[q])})
        i = closer + 1
    return res


def delim_of(text):
    """mirror census2: '$' that is neither fence nor code material nor escaped."""
    pr = M.prov_of(text)
    mk = M.blanked(text, pr)
    dl = [1 if (mk[p] == D and pr[p] != u'E') else 0 for p in range(len(mk))]
    return mk, dl


if __name__ == u'__main__':
    fam = json.load(io.open(u'E:/math/_work/dm_family.json', encoding=u'utf-8'))
    tot_node = collections.Counter()
    for r in fam:
        tot_node[r[u'file']] += 1
    bad = []
    for f in sorted(tot_node):
        text = io.open(M.ROOT + f, encoding=u'utf-8').read()
        mk, dl = delim_of(text)
        cs = [s for s in char_spans(mk, dl) if s[u'interior'] > 0]
        if len(cs) != tot_node[f]:
            bad.append((f[:12], tot_node[f], len(cs)))
        else:
            st = M.mkstate(M.ROOT + f)
            ms = M.sites(st)
            if len(ms) != len(cs):
                bad.append((f[:12], len(cs), len(ms)))
            else:
                for x, y in zip(cs, ms):
                    if x[u'interior'] != y[u'interior']:
                        bad.append((f[:12], x[u'a'], y[u'i']))
                        break
    print(u'files=%d mismatch=%d' % (len(tot_node), len(bad)))
    for b in bad[:20]:
        print(u'  ', b)
