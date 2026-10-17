# -*- coding: utf-8 -*-
"""Read-only triage probe for the "Can't use function '$' in math mode" family.

Step 1  build, for a note file, an EQUAL-LENGTH mask of the text plus a
        per-character provenance string:
            F  fenced-code material (delimiter lines and body lines)
            c  single-line inline code span  (what wrap_census.CODE / katex_census
               fenceMask blank)
            C  inline code span that crosses a newline (CommonMark legal, NOT
               blanked by the single-line CODE regex)
            E  the '$' of a backslash escape \$  (not honoured by the census
               delimiter grammar)
            P  plain prose / real math material
Step 2  replay katex_census.js's span grammar on the mask (same rules: '$$' display
        anywhere; '$' inline needing non-space after opener and needing the closer
        preceded by non-space and not followed by a digit).
Step 3  for every family row of the sites jsonl, locate the replayed span by
        (file, line, kind, body) and report provenance of each '$' inside body,
        plus the raw-character window around it.

Nothing is written to the notes; outputs go to _work only.
"""
import io, json, re, sys, collections
sys.stdout.reconfigure(encoding='utf-8')

D = chr(36)
BT = chr(96)
BSL = chr(92)
ROOT = 'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0' + '/'
DIG = set(u'0123456789')
FENCE = re.compile(u'^(?:`{3,}|~{3,})')
KEY = u"'" + D + u"' in math mode"


def build(text, exact_js=False):
    """Return (provenance string equal length, mask string equal length).

    exact_js=True degrades the mask to katex_census.js's口径: fences blanked,
    single-line code spans blanked, multi-line code spans and \$ escapes NOT
    honoured.  Used to sanity check the replication of the shipped gauge.
    """
    lines = text.split(u'\n')
    prov = []
    # --- fences -------------------------------------------------------------
    infence = False
    tok = None
    fence_of = []
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
        fence_of.append(infence or hit)
    # --- inline code spans, paragraph aware ----------------------------------
    # global char stream over non-fence lines only; a blank line or a fence line
    # terminates the paragraph (and therefore any open code span attempt).
    prov = [list(u'P' * len(l)) for l in lines]
    open_run = None   # (line, col, k)
    for li, l in enumerate(lines):
        if fence_of[li]:
            open_run = None
            continue
        n = len(l)
        j = 0
        while j < n:
            c = l[j]
            if c == BSL:
                if j + 1 < n:
                    prov[li][j + 1] = u'E'
                j += 2
                continue
            if c == BT:
                k = 0
                while j + k < n and l[j + k] == BT:
                    k += 1
                if open_run is None:
                    open_run = (li, j, k)
                    j += k
                    continue
                if k == open_run[2]:
                    (ol, oc, ok) = open_run
                    if ol == li:
                        cls = u'c'
                        for q in range(oc, j + k):
                            if prov[li][q] == u'P':
                                prov[li][q] = cls
                    else:
                        cls = u'C'
                        for q in range(oc, n):
                            if prov[li][q] == u'P':
                                prov[li][q] = cls
                        for sl in range(ol + 1, li):
                            prov[sl] = [u'C'] * len(lines[sl])
                        for q in range(0, j + k):
                            if prov[li][q] == u'P':
                                prov[li][q] = cls
                        for q in range(oc, oc + ok):
                            prov[ol][q] = cls
                    open_run = None
                    j += k
                    continue
                # unmatched length: keep looking with the new run as opener?
                # CommonMark: the earlier run stays open until a same-length run.
                j += k
                continue
            j += 1
        # end of line: an opener still open may close on the next line of the same
        # paragraph (CommonMark); a blank line resets it.
        if l.strip() == u'':
            open_run = None
    for li, l in enumerate(lines):
        if fence_of[li]:
            prov[li] = [u'F'] * len(l)
    provs = u'\n'.join([u''.join(p) for p in prov])
    mask = []
    for a, b in zip(text, provs):
        if b in (u'F', u'c', u'C'):
            mask.append(u' ')
        else:
            mask.append(a)
    if exact_js:
        # katex_census.js口径, applied with ITS OWN regex (not my scanner):
        # fences -> whitespace, single-line `code` spans -> whitespace,
        # multi-line code spans and \$ escapes are NOT honoured.
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
        return provs, u'\n'.join(out)
    return provs, u''.join(mask)


def spans(mask):
    """katex_census.js spans() verbatim logic on the equal-length mask."""
    res = []
    n = len(mask)
    i = 0
    while i < n:
        if mask[i] != D:
            i += 1
            continue
        if i + 1 < n and mask[i + 1] == D:
            j = i + 2
            while j < n and not (mask[j] == D and mask[j + 1] == D):
                j += 1
            if j >= n:
                res.append({u'kind': u'DUNCLOSED', u'a': i})
                break
            res.append({u'kind': u'DISPLAY', u'body': mask[i + 2:j], u'a': i, u'b': j})
            i = j + 2
            continue
        if i + 1 >= n or mask[i + 1] in u' \t\n':
            i += 1
            continue
        j = i + 1
        closer = -1
        while j < n:
            nxt = mask[j + 1] if j + 1 < n else u''
            key = u'' if nxt == D else nxt
            if mask[j] == D and mask[j - 1] not in u' \t\n' and key not in DIG:
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


def main(sites_path):
    rows = [json.loads(l) for l in io.open(sites_path, encoding=u'utf-8') if l.strip()]
    fam = [r for r in rows
           if (r.get(u'errClass') or u'').find(KEY) >= 0 and (r.get(u'errClass') or u'').find(u'Can') >= 0]
    core = [r for r in fam if len(r[u'errClass'].strip()) == 54]
    print(u'rows=%d family=%d core105=%d' % (len(rows), len(fam), len(core)))
    cache = {}
    out = []
    for idx, r in enumerate(fam):
        f = r[u'file']
        if f not in cache:
            t = io.open(ROOT + f, encoding=u'utf-8').read()
            pr, mk = build(t, exact_js=False)
            jsmk = build(t, exact_js=True)[1]
            cache[f] = (t, pr, mk, spans(jsmk), spans(mk))
        t, pr, mk, jsps, psps = cache[f]
        cands = [s for s in jsps
                 if s.get(u'body') == r[u'body'] and line_of(t, s[u'a']) == r[u'line']]
        mode = u'JS'
        if not cands:
            cands = [s for s in psps
                     if s.get(u'body') == r[u'body'] and line_of(t, s[u'a']) == r[u'line']]
            mode = u'FIX'
        rec = {u'i': idx, u'file': f, u'line': r[u'line'], u'kind': r[u'kind'],
               u'errClass': r[u'errClass'], u'body': r[u'body'],
               u'lineText': r[u'lineText'], u'repro': len(cands), u'mode': mode,
               u'raw': None, u'prov': None, u'dollars': [], u'ctx': None}
        if cands:
            s = cands[0]
            a, b = s[u'a'], s.get(u'b')
            raw = t[a:b + 1]
            rec[u'raw'] = raw
            rec[u'prov'] = pr[a:b + 1]
            for k, ch in enumerate(raw):
                if ch == D:
                    rec[u'dollars'].append({u'off': k, u'p': pr[a + k],
                                            u'before': raw[max(0, k - 30):k],
                                            u'after': raw[k + 1:k + 31]})
            ln = line_of(t, a)
            ls = t.rfind(u'\n', 0, a) + 1
            le = t.find(u'\n', a)
            if le < 0:
                le = len(t)
            rec[u'ctx'] = t[ls:le]
            rec[u'startcol'] = a - ls
            rec[u'endline'] = line_of(t, b)
        out.append(rec)
    io.open(u'E:/math/_work/dm_rows.json', u'w', encoding=u'utf-8').write(
        json.dumps(out, ensure_ascii=False, indent=1))
    # summary of provenance of the '$' inside bodies
    cnt = collections.Counter()
    for rec in out:
        ps = u''.join(sorted(set(d[u'p'] for d in rec[u'dollars']))) or u'-'
        cnt[ps] += 1
        if rec[u'repro'] != 1:
            print(u'REPRO!=1', rec[u'i'], rec[u'file'][:14], rec[u'line'], rec[u'repro'])
    print(u'provenance-of-body-$ histogram:')
    for k, v in cnt.most_common():
        print(u'  %3d  %s' % (v, k))
    print(u'replayed-not-found=%d' % sum(1 for rec in out if rec[u'repro'] == 0))


if __name__ == u'__main__':
    main(sys.argv[1])
