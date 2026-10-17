# -*- coding: utf-8 -*-
"""Triage of the "Can't use function '$' in math mode" family.

For every site of the shipped gauge (_work/katex_sites_now.jsonl, a fresh run of
_work/katex_census.js) this probe:

  1. replays the shipped delimiter grammar on a length-preserving version of the
     shipped mask, so the reported span can be located in the raw file;
  2. rebuilds the same region under the corrected口径 of
     _work/dollarmath_census2.js (fences + single-line AND multi-line inline code
     spans + \$ escapes all inert) and checks whether a '$'-bearing span survives
     there at all  ->  MECHANISM = tool cascade vs. real source defect;
  3. for surviving sites, attributes every interior '$' to one of:
        P     plain prose '$' (author literal or a stolen real delimiter)
        DIGIT a real delimiter whose closeness was vetoed by the "no digit right
              after the closer" rule of the shipped grammar
        CODE/FENCE/ESC material the corrected mask now inert  (should not occur)
  4. hunts a single-character fix (swap one '`' <-> one '$' on the host line, or
     drop one duplicated delimiter) that makes the corrected grammar produce no
     interior '$' anywhere on that line, and reports it with uniqueness, byte
     delta and delimiter-count deltas.

Read-only over 研究笔记; all writes go to _work.
"""
import io, json, os, re, sys, glob, collections
sys.stdout.reconfigure(encoding='utf-8')

D = chr(36)
BT = chr(96)
BSL = chr(92)
ROOT = 'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0' + '/'
DIG = set(u'0123456789')
WS = set(u' \t\n')
FENCE = re.compile(u'^(?:`{3,}|~{3,})')
CODE1 = re.compile(u'`+[^' + BT + u'\n]*`+')
KEY = D + chr(39) + u' in math mode'


# ---------------------------------------------------------------- shipped口径 ---
def shipped_mask(text):
    """katex_census.js fenceMask, but length preserving (fence lines -> spaces).
    Column/offset stable against the raw text; the '$' set is identical to the
    shipped gauge's, hence the span sequence is identical."""
    lines = text.split(u'\n')
    out = []
    infence = False
    tok = None
    for l in lines:
        s = l.strip()
        if FENCE.match(s):
            if not infence:
                infence = True
                tok = s[0] * 3
                out.append(u' ' * len(l))
                continue
            if tok and s.startswith(tok):
                infence = False
                tok = None
                out.append(u' ' * len(l))
                continue
        if infence:
            out.append(u' ' * len(l))
        else:
            out.append(CODE1.sub(lambda m: u' ' * len(m.group(0)), l))
    return u'\n'.join(out)


def prov_mask(text):
    """Corrected口径 provenance ribbon, equal length to text.
    returns (provs, mask) with provs chars in F c C E P."""
    lines = text.split(u'\n')
    n = len(lines)
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
                    cls = u'c' if ol == li else u'C'
                    for q in range(oc, min(j + k, m)):
                        if prov[li][q] == u'P':
                            prov[li][q] = cls
                    if ol != li:
                        for sl in range(ol + 1, li):
                            prov[sl] = [u'C'] * len(lines[sl])
                    open_run = None
                    j += k
                    continue
                j += k
                continue
            j += 1
        if l.strip() == u'':
            open_run = None
    # escapes
    for li, l in enumerate(lines):
        if fencey[li]:
            continue
        j = 0
        m = len(l)
        while j < m:
            if l[j] == BSL:
                if j + 1 < m:
                    if prov[li][j + 1] == u'P':
                        prov[li][j + 1] = u'E'
                j += 2
                continue
            j += 1
    provs = u'\n'.join(u''.join(p) for p in prov)
    mask = u''.join(u' ' if b in (u'F', u'c', u'C') else a
                    for a, b in zip(text, provs))
    return provs, mask


def spans(mask, delims=None):
    """The shipped delimiter grammar; delims==None means every '$' in mask is a
    candidate delimiter (shipped口径)."""
    res = []
    n = len(mask)
    i = 0
    ok = (lambda p: mask[p] == D) if delims is None else (lambda p: delims[p])
    while i < n:
        if not ok(i):
            i += 1
            continue
        if i + 1 < n and ok(i + 1):
            j = i + 2
            while j < n and not (ok(j) and ok(j + 1)):
                j += 1
            if j >= n:
                res.append({u'kind': u'DUNCLOSED', u'a': i})
                break
            res.append({u'kind': u'DISPLAY', u'body': mask[i + 2:j], u'a': i, u'b': j})
            i = j + 2
            continue
        if i + 1 >= n or mask[i + 1] in WS:
            i += 1
            continue
        j = i + 1
        closer = -1
        while j < n:
            nxt = mask[j + 1] if j + 1 < n else u''
            key = u'' if nxt == D else nxt
            if ok(j) and mask[j - 1] not in WS and key not in DIG:
                closer = j
                break
            j += 1
        if closer < 0:
            res.append({u'kind': u'IUNCLOSED', u'a': i})
            break
        res.append({u'kind': u'INLINE', u'body': mask[i + 1:closer], u'a': i, u'b': closer})
        i = closer + 1
    return res


def line_of(text, off):
    return text.count(u'\n', 0, off) + 1


def col_of(text, off):
    return off - (text.rfind(u'\n', 0, off) + 1)


# ------------------------------------------------------------------ triage ----
def file_of(prefix):
    g = sorted(glob.glob(os.path.join(ROOT, prefix + u'-*.md')))
    return g


def main(sites_path):
    rows = [json.loads(l) for l in io.open(sites_path, encoding=u'utf-8') if l.strip()]
    fam = [r for r in rows if KEY in (r.get(u'errClass') or u'').strip()]
    fam.sort(key=lambda r: (r[u'file'], r[u'line']))
    cache = {}
    out = []
    for idx, r in enumerate(fam):
        f = r[u'file']
        if f not in cache:
            t = io.open(ROOT + f, encoding=u'utf-8').read()
            sm = shipped_mask(t)
            pr, pm = prov_mask(t)
            dl = [1 if (pm[p] == D and pr[p] != u'E') else 0 for p in range(len(pm))]
            cache[f] = (t, sm, pr, pm, spans(sm), spans(pm, dl))
        t, sm, pr, pm, jsps, psps = cache[f]
        rec = {u'i': idx, u'file': f, u'line': r[u'line'], u'kind': r[u'kind'],
               u'body': r[u'body'], u'errClass': r[u'errClass'], u'hit': None}
        cand = [s for s in jsps
                if s.get(u'body') == r[u'body'] and line_of(t, s[u'a']) == r[u'line']]
        if not cand:
            rec[u'hit'] = u'NOT-REPLAYED'
            out.append(rec)
            continue
        s = cand[0]
        a, b = s[u'a'], s[u'b']
        rec[u'span'] = {u'a': a, u'b': b, u'lines': [line_of(t, a), line_of(t, b)]}
        # does the corrected grammar still put an interior '$' in a span here?
        interior = [(p, pr[p]) for p in range(a + 1, b) if sm[p] == D]
        rec[u'interior'] = [{u'off': p - a, u'raw': p, u'prov': pv,
                             u'ctx': t[max(0, p - 80):p + 80]}
                            for p, pv in interior]
        near = [x for x in psps if abs(line_of(t, x[u'a']) - r[u'line']) <= 1]
        rec[u'still'] = [{u'kind': x[u'kind'], u'a': x[u'a'], u'b': x.get(u'b'),
                          u'line': line_of(t, x[u'a']),
                          u'dollar': x.get(u'body', u'').count(D),
                          u'body': x.get(u'body', u'')} for x in near]
        out.append(rec)
    io.open(u'E:/math/_work/dm_triage.json', u'w', encoding=u'utf-8').write(
        json.dumps(out, ensure_ascii=False, indent=1))
    c = collections.Counter()
    for rec in out:
        if rec[u'hit'] == u'NOT-REPLAYED':
            c[u'not-replayed'] += 1
            continue
        ps = collections.Counter(d[u'prov'] for d in rec[u'interior'])
        survives = any(x[u'dollar'] > 0 for x in rec[u'still'])
        c[(u'survives' if survives else u'killed', tuple(sorted(ps.items())))] += 1
    for k, v in c.most_common():
        print(v, k)
    print(u'rows=%d' % len(out))


if __name__ == u'__main__':
    main(sys.argv[1])
