# -*- coding: utf-8 -*-
"""wo_v3: executability verification of the 517 cat=ORDER author workorders.

Semantics recovered from _work/workorder_census.py (the harvester):
  * quote = whitespace-collapsed first 120 chars of the declaration item
  * fix   = "<verb+phrase>-><phrase after the repair verb>", both halves start at the
            verb, so the LEFT half is not the bad form (zero information)
  * sig in verify_note = longest item token the harvester found on a NON-declaration line
So bad/good are re-derived here from the declaration text on disk: the delimited span
before a repair verb = bad form, the delimited span after it = expected form, both then
validated against the current bytes.  Read-only, nothing is written into 研究笔记/.
"""
from __future__ import print_function
import io, os, re, sys, json, collections, traceback

HDR = ['id','note','sec_line','sec_head','no','label','cat','kind','fam',
       'stated','cur','verified','quote','fix','evidence','verify_note']
NOTE_DIR = u'\u7814\u7a76\u7b14\u8bb0'
INFLIGHT = ('D80-', 'D94-', 'D66-', 'D080-', 'D094-', 'D066-')
BT, DOL = u'`', u'$'
LQ, RQ = u'\u201c', u'\u201d'
LSQ, RSQ = u'\u2018', u'\u2019'

TARGET_MARK = [u'应读作', u'应改为', u'应改成', u'应写作', u'应写为', u'应记作', u'应记为',
               u'正确的写法是', u'正确写法是', u'对应写法是', u'写法是', u'正名是', u'正解是',
               u'应统一为', u'统一成', u'统一为', u'应订正为', u'宜改为', u'宜作', u'须改为',
               u'请改为', u'当改为', u'该写', u'该作', u'应作', u'应为', u'改为', u'改作',
               u'改成', u'改回', u'换回', u'换成', u'应换成', u'替换为', u'更正为', u'纠正为',
               u'改写为', u'恢复为', u'置为', u'读作', u'恒等于', u'写为', u'记作', u'期望文本为',
               u'完整文本为', u'原句', u'应改']
CURRENT_MARK = [u'被替换成', u'现存文本', u'实际写成', u'误写成', u'误写为', u'写成了',
                u'打成了', u'落成了', u'变成了', u'被写成', u'错写成', u'错写为', u'写错成']
MOVE_MARK = [u'移到', u'移至', u'搬到', u'搬至', u'归位到', u'插入', u'新增', u'另起', u'拆行']
DELETE_MARK = [u'删掉', u'删除', u'删去', u'去掉', u'置空']
ALL_MARK = sorted(set(TARGET_MARK) | set(CURRENT_MARK) | set(MOVE_MARK) | set(DELETE_MARK),
                  key=len, reverse=True)
MARK_RE = re.compile(u'(' + u'|'.join(re.escape(m) for m in ALL_MARK) + u')')
BAD_MARK_RE = re.compile(u'(' + u'|'.join(re.escape(m) for m in
                      sorted(set(TARGET_MARK) | set(CURRENT_MARK), key=len, reverse=True)) + u')')
LINE_RE = [re.compile(u'第\\s*(\\d{1,4})\\s*行'), re.compile(r'[Ll](\d{1,4})\b'),
           re.compile(u'行号[为是]?\\s*(\\d{1,4})')]
WS_RE = re.compile(u'\\s+')
SIG_RE = re.compile(u'sig=' + BT + u'(.+?)' + BT + u' found at \\[([0-9, ]*)\\]')
ELL = (u'……', u'…', u'...')
ITEM_START = re.compile(u'^(?:\\d{1,3}[\\.、]|\\(\\d+\\)|[' + u'\u4e00\u4e8c\u4e09\u56db\u4e94\u516d\u4e03\u516b\u4e5d\u5341'
                        + u'\u5176\u7532\u4e59\u4e19\u4e01]+[\\.、\\)\\uFF0C\\uFF1A:])')

def spans_of(text):
    cand = []
    for m in re.finditer(u'``(.+?)``', text):
        cand.append((m.start(), m.end(), m.group(1), 'bt2'))
    for m in re.finditer(u'`([^`\\n]+?)`', text):
        cand.append((m.start(), m.end(), m.group(1), 'bt'))
    for m in re.finditer(u'\u201c(.+?)\u201d', text):
        cand.append((m.start(0) + 1, m.end(0) - 1, m.group(1), 'quote'))
    for m in re.finditer(u'\u2018(.+?)\u2019', text):
        cand.append((m.start(0) + 1, m.end(0) - 1, m.group(1), 'quote'))
    for m in re.finditer(u'"([^"\\n]{1,120}?)"', text):
        cand.append((m.start(0) + 1, m.end(0) - 1, m.group(1), 'quote'))
    for m in re.finditer(u'\u300c(.+?)\u300d', text):
        cand.append((m.start(0) + 1, m.end(0) - 1, m.group(1), 'quote'))
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
    seen = set()
    out = []
    sp = spans_of(window)
    for m in MARK_RE.finditer(window):
        mk = m.group(1)
        before = [s for s in sp if s[1] <= m.start() and m.start() - s[1] <= 45]
        after = [s for s in sp if s[0] >= m.end() and s[0] - m.end() <= 22]
        if not before or not after:
            continue
        b = max(before, key=lambda s: s[1])
        a = min(after, key=lambda s: s[0])
        if mk in CURRENT_MARK:
            bad, good = a[2], b[2]
        else:
            bad, good = b[2], a[2]
        key = (bad, good)
        if key in seen:
            continue
        seen.add(key)
        out.append({'bad': bad, 'good': good, 'marker': mk, 'kind': 'span'})
    return out

def lcs(a, b):
    if not a or not b:
        return u''
    prev = [0] * (len(b) + 1)
    best, bi = 0, 0
    for i in range(1, len(a) + 1):
        cur = [0] * (len(b) + 1)
        for j in range(1, len(b) + 1):
            if a[i - 1] == b[j - 1]:
                cur[j] = prev[j - 1] + 1
                if cur[j] > best:
                    best, bi = cur[j], i - cur[j]
        prev = cur
    return a[bi:bi + best]

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
        if os.path.exists(path):
            b = io.open(path, 'rb').read()
            assert b.count(b'\r') == 0, note
            _notes[note] = b.decode('utf-8').split('\n')
        else:
            _notes[note] = None
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
    mask = [False] * len(lines)
    open_ = False
    for i, l in enumerate(lines):
        if l.lstrip().startswith(BT * 3):
            mask[i] = True
            open_ = not open_
            continue
        mask[i] = open_
    return mask

UNDEF = set()
try:
    UNDEF = set(json.load(io.open('katexundef.json', 'rb')).get('undef', {}))
except Exception:
    pass
UNDEF |= {u'\\R', u'\\F', u'\\d', u'\\overline', u'\\mathbb'}
CS_RE = re.compile(r'\\[A-Za-z]+')

def macro_hits(text):
    toks = set(m.group(0) for m in CS_RE.finditer(text))
    return sorted(t[1:] for t in toks if t in UNDEF)

def analyze(r):
    ev = {'id': r['id'], 'note': r['note'], 'kind': r['kind'], 'fam': r['fam'],
          'sec_line': int(r['sec_line']), 'stated': r['stated'], 'cur': r['cur'],
          'verified': r['verified'], 'vnote': r['verify_note'], 'fix': r['fix'],
          'flags': [], 'cands': [], 'sites': []}
    lines = load_note(r['note'])
    if lines is None:
        ev['verdict'] = 'STALE-COORD'
        ev['reason'] = 'note not on disk'
        return ev
    fence = fence_mask(lines)
    sl = ev['sec_line']
    ev['nlines'] = len(lines)
    ev['inflight'] = r['note'].startswith(INFLIGHT)

    if 0 < sl <= len(lines):
        ev['secline_head_actual'] = lines[sl - 1].strip()
        ev['secline_head_ok'] = (lines[sl - 1].strip() == r['sec_head'].strip())
        if not head_level(lines[sl - 1]):
            ev['flags'].append('SEC-LINE-NOT-HEADER')
    else:
        ev['secline_head_ok'] = False
        ev['flags'].append('SEC-LINE-OUT-OF-RANGE')

    # ---------- anchor (whitespace-normalised, the harvester collapsed \s+) ----------
    q = r['quote'].strip()
    nlines = [WS_RE.sub(u' ', l) for l in lines]
    hits = [i for i, l in enumerate(nlines) if q in l]
    ev['quote_exact'] = bool(hits)
    how = 'raw'
    if not hits:
        hits = [i for i, l in enumerate(lines) if q in l]
        if hits:
            how = 'rawline'
            ev['quote_exact'] = True
    if not hits:
        for n in (115, 110, 100, 90, 80, 70, 60, 50, 40, 32, 24, 16, 12, 10):
            if n > len(q):
                continue
            hh = [i for i, l in enumerate(nlines) if q[:n] in l]
            if hh:
                hits, how = hh, 'prefix%d' % n
                ev['flags'].append('QUOTE-CROSSES-LINES(%d)' % n)
                break
    ev['anchor_method'] = how
    ev['anchor_lines'] = [h + 1 for h in hits]
    if not hits:
        ev['verdict'] = 'STALE-COORD'
        ev['reason'] = 'declared quote absent from disk, not even as a 10-char normalised prefix'
        return ev

    hdr = sl - 1 if (0 < sl <= len(lines) and head_level(lines[sl - 1])) else None
    if hdr is None:
        k = hits[0]
        while k >= 0 and not head_level(lines[k]):
            k -= 1
        hdr = max(k, 0)
    ds, de = section_bounds(lines, hdr)
    ev['decl_range'] = (ds + 1, de)

    # ---------- window = the whole declaration item on disk ----------
    a = hits[0]
    end = a + 1
    cnt = 0
    while end < len(lines) and cnt < 12:
        l2 = lines[end]
        if not l2.strip() or head_level(l2):
            break
        end += 1
        cnt += 1
    window = u' '.join(l.strip() for l in lines[a:end])
    ev['window_len'] = len(window)
    ev['window'] = window[:400]

    def region(nline):
        i = nline - 1
        if ds <= i < de:
            return 'anchor-decl'
        if fence[i]:
            return 'fence'
        return 'body'

    sig = SIG_RE.search(r['verify_note'])
    if sig:
        ev['sig'] = sig.group(1)
        ev['sig_lines'] = [int(x) for x in re.findall(r'\d+', sig.group(2))]
        ev['sig_regions'] = [region(n) for n in ev['sig_lines'] if 0 < n <= len(lines)]
    dl = []
    for rx in LINE_RE:
        dl += [int(x) for x in rx.findall(window)]
    ev['declared_lines'] = sorted(set(dl))

    # ---------- pairs ----------
    pairs = extract_pairs(window)
    ev['npairs'] = len(pairs)
    for p in pairs:
        bad, good, mk = p['bad'], p['good'], p['marker']
        c = dict(p)
        c['flags'] = []
        if not bad or not good or bad == good:
            c['reject'] = 'empty-or-identical'
            ev['cands'].append(c)
            continue
        if any(e in good for e in ELL):
            c['reject'] = 'ellipsis-in-target'
            ev['cands'].append(c)
            continue
        if len(bad) < 3 or len(good) < 1:
            c['reject'] = 'too-short'
            ev['cands'].append(c)
            continue
        bo = [(i + 1, lines[i].count(bad)) for i in range(len(lines)) if bad in lines[i]]
        go = [(i + 1, lines[i].count(good)) for i in range(len(lines)) if good in lines[i]]
        c['bad_all'] = bo
        c['good_all'] = go
        c['bad_body'] = [(n, k) for (n, k) in bo if region(n) == 'body']
        c['bad_decl'] = [(n, k) for (n, k) in bo if region(n) == 'anchor-decl']
        c['bad_fence'] = [(n, k) for (n, k) in bo if region(n) == 'fence']
        c['good_body'] = [(n, k) for (n, k) in go if region(n) == 'body']
        c['nb'] = sum(k for n, k in c['bad_body'])
        c['ng'] = sum(k for n, k in c['good_body'])
        core = lcs(bad, good)
        c['core'] = core
        if not bo and len(core) >= 6:
            ch = [(i + 1, 'core') for i in range(len(lines))
                  if core in lines[i] and region(i + 1) == 'body' and good not in lines[i]]
            if ch:
                c['core_body_hits'] = ch[:6]
                c['flags'].append('CORE-HITS-BUT-BAD-SHAPE-MISSING')
        ev['cands'].append(c)
        if mk in MOVE_MARK:
            c['flags'].append('MOVE-VERB')
        if c['nb'] > 6:
            c['flags'].append('MANY-SITES(%d)' % c['nb'])

    usable = [c for c in ev['cands'] if c.get('nb')]
    # prefer span-anchored, then the one whose site sits on a declared line
    def rank(c):
        d = 0
        if ev['declared_lines']:
            near = min([min(abs(n - x) for x in ev['declared_lines']) for n, k in c['bad_body']])
            d = near
        return (0 if c['marker'] not in MOVE_MARK else 1, d, -len(c['bad']))
    usable.sort(key=rank)

    # ---------- verdict ----------
    if ev['inflight']:
        ev['verdict'] = 'CONFLICT-RISK'
        ev['reason'] = 'writer is appending to this note now; registered only, coordinates unverified'
        ev['sites'] = [{'line': n, 'bad': c['bad'], 'good': c['good']}
                       for c in usable[:1] for (n, k) in c['bad_body']]
        return ev
    if usable:
        exec_sites = []
        needs = []
        for c in usable:
            if c['marker'] in MOVE_MARK:
                needs.append((c, 'move-verb'))
                continue
            keep = []
            for (n, k) in c['bad_body']:
                l = lines[n - 1]
                nl = l.replace(c['bad'], c['good'])
                why = []
                if (l.count(DOL) % 2) != (nl.count(DOL) % 2):
                    why.append('dollar-parity')
                if (l.count(BT) % 2) != (nl.count(BT) % 2):
                    why.append('btick-parity')
                if len(l) != len(nl) and c['good'] == u'':
                    why.append('pure-delete')
                if not why:
                    keep.append((n, k))
                else:
                    needs.append((c, ','.join(why), n))
            if not keep and c['bad_body']:
                continue
            for (n, k) in keep:
                mr = macro_hits(c['bad'] + u' ' + c['good'] + u' ' + lines[n - 1])
                exec_sites.append({'line': n, 'count': k, 'bad': c['bad'], 'good': c['good'],
                                   'marker': c['marker'],
                                   'delta': len(c['good'].encode('utf-8')) - len(c['bad'].encode('utf-8')),
                                   'macro': mr})
        if exec_sites:
            ev['verdict'] = 'EXEC'
            ev['sites'] = exec_sites
            if any(s['macro'] for s in exec_sites):
                ev['flags'].append('MACRO-ON-SITE')
            if needs:
                ev['flags'].append('SOME-SITES-UNSAFE')
            ev['reason'] = '%d verbatim site(s) on disk, same-line swap, parity preserved' % len(exec_sites)
        else:
            ev['verdict'] = 'NEEDS-NEW-LINE'
            ev['reason'] = 'sites found but the swap is not same-line-parity-safe: %s' % (needs[0][1],)
            ev['needs'] = needs[:4]
        if not ev.get('reason'):
            ev['verdict'] = 'NEEDS-NEW-LINE'
            ev['reason'] = 'declared fix needs a line move/insert'
    else:
        done = [c for c in ev['cands'] if c.get('ng') and not c.get('nb')]
        decl = [c for c in ev['cands'] if c.get('bad_decl') and not c.get('nb')]
        if done:
            ev['verdict'] = 'ALREADY-DONE'
            ev['bad'], ev['good'] = done[0]['bad'], done[0]['good']
            ev['reason'] = 'expected form present on %d body line(s), declared bad form absent' % done[0]['ng']
        elif decl:
            ev['verdict'] = 'KEEP-DECLARATION'
            ev['bad'], ev['good'] = decl[0]['bad'], decl[0]['good']
            ev['reason'] = 'bad form only where the declaration itself quotes it (line %d)' % decl[0]['bad_decl'][0][0]
        elif any(c.get('core_body_hits') for c in ev['cands']):
            ev['verdict'] = 'STALE-COORD'
            c = [x for x in ev['cands'] if x.get('core_body_hits')][0]
            ev['reason'] = 'bad shape not on disk; common core of the pair hits body line %s' % c['core_body_hits'][0][0]
            ev['flags'].append('SHAPE-DRIFT')
        elif ev['cands']:
            ev['verdict'] = 'NO-VERBATIM'
            ev['reason'] = 'pair extracted from the declaration but neither form is on disk'
        elif not pairs:
            ev['verdict'] = 'NO-VERBATIM'
            ev['reason'] = 'declaration gives no marker-adjacent verbatim span pair'
        else:
            ev['verdict'] = 'STALE-COORD'
            ev['reason'] = 'no verbatim form of this order present on disk'
    return ev

def main():
    order = load_rows()
    res = [analyze(r) for r in order]
    io.open('_work/wo_v3_evidence.json', 'wb').write(
        json.dumps(res, ensure_ascii=False, indent=1).encode('utf-8'))
    cnt = collections.Counter(x['verdict'] for x in res)
    print('rows', len(res), 'notes', len(_notes))
    for k in ('EXEC', 'ALREADY-DONE', 'NEEDS-NEW-LINE', 'NO-VERBATIM', 'KEEP-DECLARATION',
              'CONFLICT-RISK', 'STALE-COORD'):
        print('%-18s %d' % (k, cnt.get(k, 0)))
    print('sites', sum(len(x.get('sites', [])) for x in res))
    print('pairs-rows', sum(1 for x in res if x.get('npairs')))
    print('anchor raw', sum(1 for x in res if x.get('anchor_method') == 'raw'),
          'rawline', sum(1 for x in res if x.get('anchor_method') == 'rawline'),
          'prefix', sum(1 for x in res if str(x.get('anchor_method', '')).startswith('prefix')),
          'none', sum(1 for x in res if not x.get('anchor_method')))
    print('secline-head-ok', sum(1 for x in res if x.get('secline_head_ok')))
    print('macro-flagged', sum(1 for x in res if 'MACRO-ON-SITE' in x.get('flags', [])))

if __name__ == '__main__':
    try:
        main()
    except Exception:
        io.open('_work/wo_v3_error.txt', 'wb').write(
            traceback.format_exc().encode('utf-8', 'replace'))
        print('ERROR see _work/wo_v3_error.txt')
