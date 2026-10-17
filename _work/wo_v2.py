# -*- coding: utf-8 -*-
"""wo_v2: verify every cat=ORDER author workorder against the current bytes on disk.

Read-only.  Extraction is anchored on the declaration line itself: the author writes
"<bad form> 应读作 <expected form>", so both halves are recovered as delimited spans
(inline code / curly quotes / math) around a marker word, then validated against disk.
"""
from __future__ import print_function
import io, os, re, sys, json, collections, traceback

HDR = ['id','note','sec_line','sec_head','no','label','cat','kind','fam',
       'stated','cur','verified','quote','fix','evidence','verify_note']
ARROW = u'\u2192'
NOTE_DIR = u'\u7814\u7a76\u7b14\u8bb0'
INFLIGHT = ('D80-', 'D94-', 'D66-', 'D080-', 'D094-', 'D066-')
BT = u'`'
DOL = u'$'
LQ, RQ = u'\u201c', u'\u201d'   # curly double quotes
LSQ, RSQ = u'\u2018', u'\u2019'

TARGET_MARK = [u'应读作', u'应改为', u'应改成', u'应写作', u'应写为', u'应记作', u'应记为',
               u'正确写法是', u'正确写法', u'正解是', u'应统一为', u'应订正为', u'宜改为',
               u'宜作', u'须改为', u'请改为', u'当改为', u'应作', u'应为', u'改为', u'改作',
               u'改成', u'替换为', u'更正为', u'纠正为', u'改写为', u'读作', u'该读作',
               u'应换成', u'换成', u'改回', u'应改', u'期望文本为', u'完整文本为']
CURRENT_MARK = [u'被替换成', u'现存文本', u'实际写成', u'误写成', u'误写为', u'写成了',
                u'打成了', u'落成了', u'变成了', u'被写成', u'错写成', u'错写为', u'写错成']
ALL_MARK = sorted(set(TARGET_MARK) | set(CURRENT_MARK), key=len, reverse=True)
MARK_RE = re.compile(u'(' + u'|'.join(re.escape(m) for m in ALL_MARK) + u')')

LINE_RE = [re.compile(u'第\\s*(\\d{1,4})\\s*行'), re.compile(r'[Ll](\d{1,4})\b'),
           re.compile(u'行号[为是]?\\s*(\\d{1,4})'), re.compile(u'位于第\\s*(\\d{1,4})')]

def spans_of(text):
    """Delimited verbatim spans: (start, end, inner, kind), outermost wins."""
    cand = []
    for m in re.finditer(u'``(.+?)``', text):
        cand.append((m.start(), m.end(), m.group(1), 'bt2'))
    for m in re.finditer(u'`([^`\\n]+?)`', text):
        cand.append((m.start(), m.end(), m.group(1), 'bt'))
    for m in re.finditer(u'(' + LQ + u'(.+?)' + RQ + u')', text):
        cand.append((m.start(2), m.end(2), m.group(2), 'quote'))
    for m in re.finditer(u'(' + LSQ + u'(.+?)' + RSQ + u')', text):
        cand.append((m.start(2), m.end(2), m.group(2), 'quote'))
    for m in re.finditer(u'("([^"\\n]{1,120}?"))', text):
        cand.append((m.start(2), m.end(2), m.group(2), 'quote'))
    for m in re.finditer(u'「(.+?)」', text):
        cand.append((m.start(1), m.end(1), m.group(1), 'quote'))
    for m in re.finditer(r'\$([^$\n]{1,140}?)\$', text):
        cand.append((m.start(1), m.end(1), m.group(1), 'math'))
    cand.sort(key=lambda t: (t[0], -(t[1] - t[0])))
    keep = []
    for c in cand:
        if any(k[0] <= c[0] and c[1] <= k[1] for k in keep):
            continue
        keep.append(c)
    return keep

def extract_pairs(window):
    """Yield (s1, s2, marker, direction) for marker-adjacent span pairs."""
    out = []
    sp = spans_of(window)
    for m in MARK_RE.finditer(window):
        mk = m.group(1)
        before = [s for s in sp if s[1] <= m.start() and m.start() - s[1] <= 40]
        after = [s for s in sp if s[0] >= m.end() and s[0] - m.end() <= 20]
        if not before or not after:
            continue
        b = max(before, key=lambda s: s[1])
        a = min(after, key=lambda s: s[0])
        if mk in CURRENT_MARK:
            out.append((a[2], b[2], mk, 'reverse'))   # after = expected, before = current bad
        else:
            out.append((b[2], a[2], mk, 'forward'))    # before = bad, after = expected
    return out

def load_rows():
    raw = io.open('_work/workorders.tsv', 'rb').read()
    assert raw.count(b'\r') == 0
    lines = [l for l in raw.decode('utf-8').split('\n') if l]
    rows = [dict(zip(HDR, ln.split('\t'))) for ln in lines[1:]]
    return [r for r in rows if r['cat'] == 'ORDER']

_notes = {}
def load_note(note):
    if note not in _notes:
        path = os.path.join(NOTE_DIR, note)
        if not os.path.exists(path):
            _notes[note] = None
        else:
            b = io.open(path, 'rb').read()
            assert b.count(b'\r') == 0, note
            _notes[note] = b.decode('utf-8').split('\n')
    return _notes[note]

def head_level(l):
    if not l.startswith('#'):
        return 0
    i = 0
    while i < len(l) and l[i] == '#':
        i += 1
    return i if i <= 6 else 0

def section_bounds(lines, hdr_idx):
    lvl = head_level(lines[hdr_idx]) or 1
    j = hdr_idx + 1
    while j < len(lines):
        l2 = head_level(lines[j])
        if l2 and l2 <= lvl:
            break
        j += 1
    return hdr_idx, j

def fence_mask(lines):
    """True where the line sits inside a ``` fence (source quotation: never touch)."""
    mask = [False] * len(lines)
    open_ = False
    for i, l in enumerate(lines):
        if l.lstrip().startswith(BT * 3):
            mask[i] = True     # the fence line itself
            open_ = not open_
            continue
        mask[i] = open_
    return mask

def occ_lines(lines, needle, skip):
    res = []
    for i, l in enumerate(lines):
        if skip[i]:
            continue
        c = l.count(needle)
        if c:
            res.append((i + 1, c))
    return res

SIG_RE = re.compile(u'sig=' + BT + u'(.+?)' + BT + u' found at \\[([0-9, ]*)\\]')
UNDEF = set()
try:
    UNDEF = set(json.load(io.open('katexundef.json', 'rb')).get('undef', {}))
except Exception:
    pass
UNDEF |= {u'\\R', u'\\F', u'\\d', u'\\overline', u'\\mathbb'}
CS_RE = re.compile(r'\\[A-Za-z]+')

def macro_risk(text):
    toks = set(m.group(0) for m in CS_RE.finditer(text))
    hit = sorted(t for t in toks if t in UNDEF)
    return u','.join(h[1:] for h in hit) if hit else None

ELLIPSIS = (u'……', u'…', u'...')

def declared_lines(window):
    ns = []
    for rx in LINE_RE:
        for m in rx.finditer(window):
            ns.append(int(m.group(1)))
    return sorted(set(ns))

def analyze(r, verbose):
    ev = {'id': r['id'], 'note': r['note'], 'kind': r['kind'], 'fam': r['fam'],
          'sec_line': int(r['sec_line']), 'stated': r['stated'], 'cur': r['cur'],
          'verified': r['verified'], 'vnote': r['verify_note'], 'flags': [], 'cands': []}
    lines = load_note(r['note'])
    if lines is None:
        ev['verdict'] = 'STALE-COORD'
        ev['reason'] = 'note not on disk'
        return ev
    fence = fence_mask(lines)
    sl = ev['sec_line']
    in_flight = r['note'].startswith(INFLIGHT)
    ev['nlines'] = len(lines)
    ev['inflight'] = in_flight

    if 0 < sl <= len(lines):
        ev['secline_head_actual'] = lines[sl - 1].strip()
        ev['secline_head_ok'] = (lines[sl - 1].strip() == r['sec_head'].strip())
        if not head_level(lines[sl - 1]):
            ev['flags'].append('SEC-LINE-NOT-HEADER')
    else:
        ev['secline_head_ok'] = False
        ev['flags'].append('SEC-LINE-OUT-OF-RANGE')

    q = r['quote'].strip()
    hits = [i for i, l in enumerate(lines) if q in l]
    ev['quote_exact'] = bool(hits)
    if not hits:
        for n in (110, 100, 90, 80, 70, 60, 50, 40, 32, 24, 16, 12, 10):
            if n > len(q):
                continue
            hh = [i for i, l in enumerate(lines) if q[:n] in l]
            if hh:
                hits = hh
                ev['anchor_prefix'] = n
                ev['flags'].append('QUOTE-CROSSES-LINES')
                break
    if not hits:
        ev['verdict'] = 'STALE-COORD'
        ev['reason'] = 'declared quote not on disk, not even by a 10-char prefix'
        return ev
    ev['anchor_lines'] = [h + 1 for h in hits]

    hdr = sl - 1 if (0 < sl <= len(lines) and head_level(lines[sl - 1])) else None
    if hdr is None:
        k = hits[0]
        while k >= 0 and not head_level(lines[k]):
            k -= 1
        hdr = max(k, 0)
    ds, de = section_bounds(lines, hdr)
    ev['decl_range'] = (ds + 1, de)
    decl_idx = set(range(ds, de))
    # every erratum-like section in the file counts as declaration context
    err_sec = []
    for i, l in enumerate(lines):
        if head_level(l) and re.search(u'勘误|自检|申报|补记|收工|收稿|复核|更正|登记|札记|台账|越界|缺陷', l):
            s2, e2 = section_bounds(lines, i)
            err_sec.append((s2, e2))
    ev['n_err_sections'] = len(err_sec)

    def region(nline):
        i = nline - 1
        if i in decl_idx:
            return 'anchor-decl'
        for s2, e2 in err_sec:
            if s2 <= i < e2:
                return 'other-decl'
        if fence[i]:
            return 'fence'
        return 'body'

    window = lines[hits[0]]
    if len(hits) > 1:
        window = u'\n'.join(lines[h] for h in hits)
    ev['window_len'] = len(window)
    pairs = extract_pairs(window)
    ev['npairs'] = len(pairs)
    dl = declared_lines(window)
    ev['declared_lines'] = dl

    sig = SIG_RE.search(r['verify_note'])
    if sig:
        ev['sig'] = sig.group(1)
        ev['sig_lines'] = [int(x) for x in re.findall(r'\d+', sig.group(2))]
        ev['sig_regions'] = [region(n) for n in ev['sig_lines'] if 0 < n <= len(lines)]

    best = None
    for (bad, good, mk, d) in pairs:
        c = {'bad': bad, 'good': good, 'marker': mk, 'dir': d}
        if not bad or not good or bad == good:
            c['reject'] = 'empty-or-identical'
            ev['cands'].append(c)
            continue
        if any(e in good for e in ELLIPSIS) or any(e in bad for e in ELLIPSIS):
            c['reject'] = 'ellipsis-in-text'
            ev['cands'].append(c)
            continue
        if len(bad) < 3 or len(good) < 2:
            c['reject'] = 'too-short'
            ev['cands'].append(c)
            continue
        bo = occ_lines(lines, bad, [False] * len(lines))
        go = occ_lines(lines, good, [False] * len(lines))
        c['bad_all'] = bo
        c['good_all'] = go
        c['bad_body'] = [(n, k) for (n, k) in bo if region(n) == 'body']
        c['bad_otherdecl'] = [(n, k) for (n, k) in bo if region(n) == 'other-decl']
        c['bad_anchor'] = [(n, k) for (n, k) in bo if region(n) == 'anchor-decl']
        c['bad_fence'] = [(n, k) for (n, k) in bo if region(n) == 'fence']
        c['good_body'] = [(n, k) for (n, k) in go if region(n) == 'body']
        c['n_bad_body'] = sum(k for n, k in c['bad_body'])
        c['n_good_body'] = sum(k for n, k in c['good_body'])
        if d == 'forward' and c['n_bad_body'] == 0 and c['n_good_body'] > 0:
            c['flip_suspect'] = True
        ev['cands'].append(c)
        if c['n_bad_body'] and best is None:
            best = c
    if best is None:
        for c in ev['cands']:
            if c.get('n_good_body') and not c.get('bad_all'):
                best = dict(c, verdict_hint='ALREADY-DONE')
                break
    ev['best'] = {k: v for k, v in (best or {}).items()} if best else None

    # ---- verdict ------------------------------------------------------------
    if in_flight:
        ev['verdict'] = 'CONFLICT-RISK'
        ev['reason'] = 'D80/D94/D66 has a writer appending right now; registered, coordinates unverified'
        return ev
    if best is not None and best.get('n_bad_body'):
        bad, good = best['bad'], best['good']
        par = []
        for (n, k) in best['bad_body']:
            l = lines[n - 1]
            nl = l.replace(bad, good)
            why = []
            if (l.count(DOL) % 2) != (nl.count(DOL) % 2):
                why.append('dollar-parity')
            if (l.count(BT) % 2) != (nl.count(BT) % 2):
                why.append('btick-parity')
            if len(l.split('\n')) != len(nl.split('\n')):
                why.append('line-count')
            if why:
                par.append((n, why))
        if par and len(par) == len(best['bad_body']):
            ev['verdict'] = 'NEEDS-NEW-LINE'
            ev['reason'] = 'swap changes line-level delimiter parity at every site: %s' % par[0][1]
        else:
            ev['verdict'] = 'EXEC'
            ev['sites'] = [n for (n, k) in best['bad_body'] for _ in range(k)]
            ev['bad'] = bad
            ev['good'] = good
            ev['byte_delta_each'] = len(good.encode('utf-8')) - len(bad.encode('utf-8'))
            if par:
                ev['flags'].append('SOME-SITES-PARITY-BREAK')
        mr = macro_risk(bad + u' ' + good)
        if mr:
            ev['flags'].append('MACRO-IN-PAIR:' + mr)
        if len(best['bad_body']) > 6:
            ev['flags'].append('MANY-SITES(%d)' % len(best['bad_body']))
        dl = ev.get('declared_lines') or []
        if dl:
            inside = [n for n in ev.get('sites', []) if n in dl]
            ev['sites_on_declared_line'] = inside
            if not inside:
                near = min((abs(n - d) for n in ev.get('sites', []) for d in dl), default=9999)
                ev['nearest_declared_gap'] = near
                if near > 60:
                    ev['flags'].append('COORD-DRIFT-%d' % near)
    elif best is not None and best.get('n_good_body'):
        ev['verdict'] = 'ALREADY-DONE'
        ev['reason'] = 'expected form present in body (%d hits), declared bad form absent from body' % best['n_good_body']
        ev['bad'] = best['bad']
        ev['good'] = best['good']
    else:
        has_bad_decl = any(c.get('bad_all') for c in ev['cands'])
        no_pair = not any(c.get('bad_all') for c in ev['cands'])
        if no_pair and not ev.get('sig'):
            ev['verdict'] = 'NO-VERBATIM'
            ev['reason'] = 'no marker-adjacent verbatim span pair in the declaration line'
        elif has_bad_decl:
            ev['verdict'] = 'KEEP-DECLARATION'
            ev['reason'] = 'bad form only inside declaration sections that quote it'
            for c in ev['cands']:
                if c.get('bad_all'):
                    ev['bad'] = c['bad']
                    ev['good'] = c['good']
                    break
        else:
            ev['verdict'] = 'STALE-COORD'
            ev['reason'] = 'declared bad form not present anywhere on disk'
    return ev

def main():
    verbose = '-v' in sys.argv
    order = load_rows()
    res = [analyze(r, verbose) for r in order]
    io.open('_work/wo_v2_evidence.json', 'wb').write(
        json.dumps(res, ensure_ascii=False, indent=1).encode('utf-8'))
    cnt = collections.Counter(x['verdict'] for x in res)
    print('rows', len(res), 'notes', len(_notes))
    for k in ('EXEC', 'ALREADY-DONE', 'NEEDS-NEW-LINE', 'NO-VERBATIM',
              'KEEP-DECLARATION', 'CONFLICT-RISK', 'STALE-COORD'):
        print('%-18s %d' % (k, cnt.get(k, 0)))
    print('other', {k: v for k, v in cnt.items() if k not in (
        'EXEC', 'ALREADY-DONE', 'NEEDS-NEW-LINE', 'NO-VERBATIM',
        'KEEP-DECLARATION', 'CONFLICT-RISK', 'STALE-COORD')})
    print('quote-exact', sum(1 for x in res if x.get('quote_exact')))
    print('secline-head-ok', sum(1 for x in res if x.get('secline_head_ok')))
    print('sites_total', sum(len(x.get('sites', [])) for x in res))
    print('exec_rows', sum(1 for x in res if x['verdict'] == 'EXEC'))
    print('pairs-found-rows', sum(1 for x in res if x.get('npairs')))
    print('sig-rows', sum(1 for x in res if x.get('sig')))

if __name__ == '__main__':
    try:
        main()
    except Exception:
        io.open('_work/wo_v2_error.txt', 'wb').write(
            traceback.format_exc().encode('utf-8', 'replace'))
        print('ERROR see _work/wo_v2_error.txt')
