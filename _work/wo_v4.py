# -*- coding: utf-8 -*-
"""wo_v4: final executability verifier for the 517 cat=ORDER author workorders.

Pairs are extracted from the declaration sentence itself, sentence-scoped, and must pass
  defect-noun gate, done-claim gate, kind/tightness gate, disk validation of both halves.
Site = a body line (outside the declaring section, outside ``` fences) that contains the
declared bad form; short/generic bad forms must be pinned to a declared line or section.
Read-only: nothing under 研究笔记/ is written.
"""
from __future__ import print_function
import io, os, re, sys, json, collections, traceback

HDR = ['id','note','sec_line','sec_head','no','label','cat','kind','fam',
       'stated','cur','verified','quote','fix','evidence','verify_note']
NOTE_DIR = u'\u7814\u7a76\u7b14\u8bb0'
INFLIGHT = ('D80-', 'D94-', 'D66-', 'D080-', 'D094-', 'D066-')
BT, DOL = u'`', u'$'

TARGET_MARK = [u'应读作', u'应改为', u'应改成', u'应写作', u'应写为', u'应记作', u'应记为',
               u'正确的写法是', u'正确写法是', u'对应写法是', u'写法是', u'正名是', u'正解是',
               u'应统一为', u'统一成', u'统一为', u'应订正为', u'宜改为', u'宜作', u'须改为',
               u'请改为', u'当改为', u'该写', u'该作', u'应作', u'应为', u'改为', u'改作',
               u'改成', u'改回', u'换回', u'换成', u'应换成', u'替换为', u'更正为', u'纠正为',
               u'改写为', u'恢复为', u'置为', u'读作', u'写为', u'记作', u'期望文本为',
               u'完整文本为', u'应改', u'代替为', u'取代为']
CURRENT_MARK = [u'被替换成', u'现存文本', u'实际写成', u'误写成', u'误写为', u'写成了',
                u'打成了', u'落成了', u'变成了', u'被写成', u'错写成', u'错写为', u'写错成',
                u'多打成了', u'误用']
MOVE_MARK = [u'移到', u'移至', u'搬到', u'搬至', u'归位到', u'插入', u'新增', u'另起', u'拆行',
             u'补一行']
DELETE_MARK = [u'删掉', u'删除', u'删去', u'去掉', u'置空', u'多打', u'衍字', u'多余']
ALL_MARK = sorted(set(TARGET_MARK) | set(CURRENT_MARK) | set(MOVE_MARK) | set(DELETE_MARK),
                  key=len, reverse=True)
MARK_RE = re.compile(u'(' + u'|'.join(re.escape(m) for m in ALL_MARK) + u')')
DEFECT_NOUN = [u'误', u'错', u'漏', u'多', u'笔', u'杂散', u'缺', u'缺', u'失', u'衍', u'残',
               u'漂', u'混', u'撞', u'断', u'不统一', u'不一致', u'不完整', u'重复', u'重复',
               u'污染', u'越界', u'事故', u'缺陷', u'串', u'异常', u'不成对', u'未配对', u'溢出',
               u'截断', u'未译', u'夹', u'落错', u'错位', u'失当', u'失配', u'不配对', u'修正',
               u'更正', u'纠正', u'纠正', u'订正', u'改写', u'删除', u'删掉', u'置空', u'去掉',
               u'补', u'脱落', u'掉了', u'写坏', u'不成立', u'过头', u'偏少', u'偏多', u'伪',
               u'假零', u'失真']
DONE_CLAIM = [u'已就地', u'已原位', u'均已', u'已完成', u'已在本句内', u'已改', u'已删',
              u'已按规格', u'已改写', u'已在落盘前', u'已修正', u'已更正', u'已订正', u'已处理',
              u'就地改回', u'就地完成', u'就地修复', u'就地替换', u'就地修补', u'均按规格就地',
              u'已置空', u'已完成修补', u'已补全', u'已补齐', u'已换']
SENT_SPLIT = re.compile(u'[。；！？]')
ITEM_START = re.compile(u'(?:(?<=^)|(?<=[\\s。；]))(?:\\d{1,3}[\\.、]|\\(\\d{1,3}\\)|'
                        u'[' + u'\u4e00\u4e8c\u4e09\u56db\u4e94\u516d\u4e03\u516b\u4e5d\u5341\u5176'
                        + u']{1,3}[\\.、\\)\\uFF0C])')
SEC_REF = re.compile(u'\\u00a7\\s*(\\d{1,3})')
LINE_RE = [re.compile(u'第\\s*(\\d{1,4})\\s*行'), re.compile(r'[Ll](\d{1,4})\b'),
           re.compile(u'行号[为是]?\\s*(\\d{1,4})')]
WS_RE = re.compile(u'\\s+')
SIG_RE = re.compile(u'sig=' + BT + u'(.+?)' + BT + u' found at \\[([0-9, ]*)\\]')
ELL = (u'……', u'…', u'...')
NUM_UNIT = re.compile(u'^(?:\\d{1,4}|[零一二三四五六七八九十百千两]{1,5})'
                      u'\\s*(?:处|行|个|枚|次|篇|段|节|字|字节|对|笔|条|短语|词)$')
SEC_TOK = re.compile(u'^\\u00a7\\s*\\d{1,3}$')
BARE_OK = re.compile(u'^[' + u'\u4e00\u4e8c\u4e09\u56db\u4e94\u516d\u4e03\u516b\u4e5d\u5341'
                     + u'零两\\d.,\\-\\u00a7#ABC-Za-z \\uFF08\\uFF09]{1,18}$')

def spans_of(text):
    cand = []
    for m in re.finditer(u'``(.+?)``', text):
        cand.append((m.start(), m.end(), m.group(1), m.group(0), 'bt2'))
    for m in re.finditer(u'`([^`\\n]+?)`', text):
        cand.append((m.start(), m.end(), m.group(1), m.group(0), 'bt'))
    for m in re.finditer(u'\u201c(.{1,120}?)\u201d', text):
        cand.append((m.start(1), m.end(1), m.group(1), m.group(0), 'quote'))
    for m in re.finditer(u'\u2018(.{1,120}?)\u2019', text):
        cand.append((m.start(1), m.end(1), m.group(1), m.group(0), 'quote'))
    for m in re.finditer(u'"([^"\\n]{1,120}?)"', text):
        cand.append((m.start(1), m.end(1), m.group(1), m.group(0), 'quote'))
    for m in re.finditer(u'\u300c(.{1,120}?)\u300d', text):
        cand.append((m.start(1), m.end(1), m.group(1), m.group(0), 'quote'))
    for m in re.finditer(r'\$([^$\n]{1,140}?)\$', text):
        cand.append((m.start(1), m.end(1), m.group(1), m.group(0), 'math'))
    cand.sort(key=lambda t: (t[0], -(t[1] - t[0])))
    keep = []
    for c in cand:
        if any(k[0] <= c[0] and c[1] <= k[1] for k in keep):
            continue
        keep.append(c)
    return keep

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

def clauses(text):
    """declaration text -> sentence/item clauses"""
    parts = []
    for s in SENT_SPLIT.split(text):
        s2 = s.strip()
        if not s2:
            continue
        sub = ITEM_START.split(s2) if ITEM_START.search(s2) else [s2]
        parts += [x.strip() for x in sub if x.strip()]
    return parts

def pair_in_clause(cl):
    """return list of candidate pairs inside ONE clause"""
    out = []
    sp = spans_of(cl)
    for m in MARK_RE.finditer(cl):
        mk = m.group(1)
        before = [s for s in sp if s[1] <= m.start() and m.start() - s[1] <= 60]
        after = [s for s in sp if s[0] >= m.end() and s[0] - m.end() <= 22]
        b = max(before, key=lambda s: s[1]) if before else None
        a = min(after, key=lambda s: s[0]) if after else None
        if b is None and a is not None and mk in CURRENT_MARK:
            continue
        if a is None:
            # bare target phrase right after the verb (counts, section numbers, short literals)
            tail = cl[m.end():].lstrip(u'：:，、 　')
            cut = re.split(u'[，、,；;：:\\s]', tail, maxsplit=1)[0]
            cand = cut.strip()
            if cand and (NUM_UNIT.match(cand) or SEC_TOK.match(cand) or BARE_OK.match(cand)):
                a = (m.end(), m.end() + len(cand), cand, cand, 'bare')
        if b is None or a is None:
            continue
        if mk in CURRENT_MARK:
            bad, good = a[2], b[2]
            bk, gk = a[4], b[4]
        else:
            bad, good = b[2], a[2]
            bk, gk = b[4], a[4]
        out.append({'bad': bad, 'good': good, 'bad_kind': bk, 'good_kind': gk,
                    'marker': mk, 'clause': cl[:180]})
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

def sections_by_num(lines):
    """§N -> (start,end) for headers that carry that number"""
    d = {}
    for i, l in enumerate(lines):
        if not head_level(l):
            continue
        m = re.search(u'\\u00a7\\s*(\\d{1,3})', l)
        if not m:
            m = re.match(u'^#+\\s*(\\d{1,3})[\\.、]', l)
        if m:
            n = int(m.group(1))
            s, e = section_bounds(lines, i)
            d.setdefault(n, (s, e))
    return d

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

def gate_pair(c):
    """quality gates on an extracted (bad, good) pair"""
    bad, good = c['bad'], c['good']
    if not bad or not good or bad == good:
        return 'empty-or-identical'
    if any(e in good for e in ELL) or any(e in bad for e in ELL):
        return 'ellipsis'
    if len(bad) < 2 or len(good) < 1:
        return 'too-short'
    core = lcs(bad, good)
    c['core'] = core
    if c['bad_kind'] != c['good_kind']:
        if len(core) < 0.85 * max(len(bad), len(good)):
            return 'kind-mismatch-not-aligned'
    else:
        if len(core) < 4 and not (len(bad) <= 4 and len(good) <= 4):
            return 'no-common-core'
    lo, hi = sorted([len(bad), len(good)])
    if hi > 3 * max(lo, 1):
        return 'length-ratio'
    return None

def analyze(r):
    ev = {'id': r['id'], 'note': r['note'], 'kind': r['kind'], 'fam': r['fam'],
          'sec_line': int(r['sec_line']), 'stated': r['stated'], 'cur': r['cur'],
          'verified': r['verified'], 'vnote': r['verify_note'], 'fix': r['fix'],
          'quote': r['quote'], 'flags': [], 'cands': [], 'sites': []}
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
        ev['secline_head_ok'] = (lines[sl - 1].strip() == r['sec_head'].strip())
    else:
        ev['secline_head_ok'] = False
        ev['flags'].append('SEC-LINE-OUT-OF-RANGE')

    q = r['quote'].strip()
    nlines = [WS_RE.sub(u' ', l) for l in lines]
    hits = [i for i, l in enumerate(nlines) if q in l]
    ev['quote_exact'] = bool(hits)
    how = 'normalized'
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
        ev['reason'] = 'declared quote absent from disk (no 10-char normalised prefix hit)'
        return ev

    hdr = sl - 1 if (0 < sl <= len(lines) and head_level(lines[sl - 1])) else None
    if hdr is None:
        k = hits[0]
        while k >= 0 and not head_level(lines[k]):
            k -= 1
        hdr = max(k, 0)
    ds, de = section_bounds(lines, hdr)
    ev['decl_range'] = (ds + 1, de)

    a = hits[0]
    end = a + 1
    cnt = 0
    while end < len(lines) and cnt < 10:
        l2 = lines[end]
        if not l2.strip() or head_level(l2):
            break
        end += 1
        cnt += 1
    text_window = u' '.join(l.strip() for l in lines[a:end])
    ev['window_len'] = len(text_window)
    ev['window'] = text_window[:400]

    sig = SIG_RE.search(r['verify_note'])
    if sig:
        ev['sig'] = sig.group(1)
        ev['sig_lines'] = [int(x) for x in re.findall(r'\d+', sig.group(2))]
    dl = []
    for rx in LINE_RE:
        dl += [int(x) for x in rx.findall(text_window)]
    ev['declared_lines'] = sorted(set(dl))
    if r['cur'].isdigit():
        ev['cur_line'] = int(r['cur'])
    secnums = [int(x) for x in SEC_REF.findall(text_window)]
    secmap = sections_by_num(lines)
    allowed_secs = [(secmap[n][0], secmap[n][1]) for n in secnums if n in secmap]

    def region(nline):
        i = nline - 1
        if ds <= i < de:
            return 'anchor-decl'
        if fence[i]:
            return 'fence'
        return 'body'

    def in_pinned(nline):
        if not allowed_secs and not ev['declared_lines'] and not ev.get('cur_line'):
            return False
        i = nline - 1
        if any(s <= i < e for s, e in allowed_secs):
            return True
        for d in ev['declared_lines']:
            if abs(d - nline) <= 80:
                return True
        if ev.get('cur_line') and abs(ev['cur_line'] - nline) <= 80:
            return True
        if ev.get('sig_lines') and any(abs(x - nline) <= 80 for x in ev['sig_lines']):
            return True
        return False

    clauses_ = clauses(text_window)
    ev['nclauses'] = len(clauses_)
    pairs = []
    for cl in clauses_:
        defect = any(d in cl for d in DEFECT_NOUN)
        done = any(d in cl for d in DONE_CLAIM)
        for p in pair_in_clause(cl):
            p['defect_noun'] = defect
            p['done_claim'] = done
            pairs.append(p)
    ev['npairs_raw'] = len(pairs)

    for p in pairs:
        c = dict(p)
        c['flags'] = []
        rej = gate_pair(c)
        if rej is None and not c['defect_noun']:
            rej = 'no-defect-noun'
        if rej is None:
            bo = [(i + 1, lines[i].count(c['bad'])) for i in range(len(lines)) if c['bad'] in lines[i]]
            go = [(i + 1, lines[i].count(c['good'])) for i in range(len(lines)) if c['good'] in lines[i]]
            c['bad_all'] = bo
            c['good_all'] = go
            c['bad_body'] = [(n, k) for (n, k) in bo if region(n) == 'body']
            c['bad_decl'] = [(n, k) for (n, k) in bo if region(n) == 'anchor-decl']
            c['bad_fence'] = [(n, k) for (n, k) in bo if region(n) == 'fence']
            c['good_body'] = [(n, k) for (n, k) in go if region(n) == 'body']
            c['nb'] = sum(k for n, k in c['bad_body'])
            c['ng'] = sum(k for n, k in c['good_body'])
            if c['nb'] == 0 and c['ng'] == 0 and not c['bad_all']:
                rej = 'neither-form-on-disk'
            if c['nb'] and len(c['bad']) < 8:
                pinned = [(n, k) for (n, k) in c['bad_body'] if in_pinned(n)]
                if not pinned:
                    rej = 'generic-bad-unpinned'
                    c['flags'].append('SHORT-BAD(%d)' % len(c['bad']))
                else:
                    c['bad_body'] = pinned
                    c['nb'] = sum(k for n, k in pinned)
                    c['flags'].append('PINNED')
        c['reject'] = rej
        ev['cands'].append(c)
        if rej is None and c['nb'] and not c['done_claim']:
            ev['sites'].append(c)
        if rej is None and c['nb'] and c['done_claim']:
            c['flags'].append('DONE-CLAIM-BUT-BAD-PRESENT')

    usable = sorted(ev['sites'], key=lambda c: (-len(c['bad']), c['marker'] in MOVE_MARK))
    donec = [c for c in ev['cands'] if c.get('reject') is None and c.get('nb') and c.get('done_claim')]
    already = [c for c in ev['cands'] if c.get('reject') is None and not c.get('nb') and c.get('ng')]
    kept = [c for c in ev['cands'] if c.get('reject') is None and not c.get('nb')
            and c.get('bad_decl') and not c.get('ng')]

    if ev['inflight']:
        ev['verdict'] = 'CONFLICT-RISK'
        ev['reason'] = 'writer is appending to this note now; registered only, coordinates unverified'
        return ev
    exec_sites = []
    unsafe = []
    for c in usable:
        if c['marker'] in MOVE_MARK:
            unsafe.append((c['bad'], 'move-verb'))
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
            if why:
                unsafe.append((c['bad'], ','.join(why)))
            else:
                keep.append((n, k))
        for (n, k) in keep:
            exec_sites.append({'line': n, 'count': k, 'bad': c['bad'], 'good': c['good'],
                               'marker': c['marker'], 'pair_kind': c['bad_kind'] + '/' + c['good_kind'],
                               'delta': len(c['good'].encode('utf-8')) - len(c['bad'].encode('utf-8')),
                               'macro': macro_hits(c['bad'] + u' ' + c['good'] + u' ' + lines[n - 1])})
    if exec_sites:
        ev['verdict'] = 'EXEC'
        ev['exec'] = exec_sites
        if unsafe:
            ev['flags'].append('UNSAFE-SITES(%d)' % len(unsafe))
        if any(s['macro'] for s in exec_sites):
            ev['flags'].append('MACRO-ON-SITE')
        ev['reason'] = '%d verbatim site(s) on disk; same-line swap, parity preserved' % len(exec_sites)
    elif donec:
        ev['verdict'] = 'ALREADY-DONE'
        ev['reason'] = 'declaration states the swap was applied in place; bad form still cited at line %d' % donec[0]['bad_all'][0][0]
        ev['bad'], ev['good'] = donec[0]['bad'], donec[0]['good']
    elif already:
        ev['verdict'] = 'ALREADY-DONE'
        ev['reason'] = 'expected form present on %d body line(s), declared bad form absent' % already[0]['ng']
        ev['bad'], ev['good'] = already[0]['bad'], already[0]['good']
    elif kept:
        ev['verdict'] = 'KEEP-DECLARATION'
        ev['bad'], ev['good'] = kept[0]['bad'], kept[0]['good']
        ev['reason'] = 'bad form only inside the declaring section that quotes it (line %d)' % kept[0]['bad_decl'][0][0]
    elif any(c.get('bad_all') for c in ev['cands']):
        ev['verdict'] = 'KEEP-DECLARATION'
        c = [x for x in ev['cands'] if x.get('bad_all')][0]
        ev['bad'], ev['good'] = c['bad'], c['good']
        ev['reason'] = 'declared form present only where the declaration quotes it'
    elif ev['cands']:
        ev['verdict'] = 'NO-VERBATIM'
        ev['reason'] = 'pairs rejected by the gates: %s' % ','.join(sorted(set(
            c['reject'] for c in ev['cands'] if c.get('reject')))[:4])
    else:
        ev['verdict'] = 'NO-VERBATIM'
        ev['reason'] = 'declaration sentence carries no marker-adjacent verbatim pair'
    return ev

def main():
    order = load_rows()
    res = [analyze(r) for r in order]
    io.open('_work/wo_v4_evidence.json', 'wb').write(
        json.dumps(res, ensure_ascii=False, indent=1).encode('utf-8'))
    cnt = collections.Counter(x['verdict'] for x in res)
    print('rows', len(res), 'notes', len(_notes))
    for k in ('EXEC', 'ALREADY-DONE', 'NEEDS-NEW-LINE', 'NO-VERBATIM', 'KEEP-DECLARATION',
              'CONFLICT-RISK', 'STALE-COORD'):
        print('%-18s %d' % (k, cnt.get(k, 0)))
    print('exec sites', sum(len(x.get('exec', [])) for x in res))
    print('pairs raw', sum(x.get('npairs_raw', 0) for x in res))
    print('clean pairs', sum(1 for x in res for c in x['cands'] if c.get('reject') is None))
    print('anchor normalized', sum(1 for x in res if x.get('anchor_method') == 'normalized'),
          'prefix', sum(1 for x in res if str(x.get('anchor_method', '')).startswith('prefix')),
          'none', sum(1 for x in res if not x.get('anchor_lines')))
    print('secline-head-ok', sum(1 for x in res if x.get('secline_head_ok')))
    print('macro flagged', sum(1 for x in res if 'MACRO-ON-SITE' in x.get('flags', [])))

if __name__ == '__main__':
    try:
        main()
    except Exception:
        io.open('_work/wo_v4_error.txt', 'wb').write(
            traceback.format_exc().encode('utf-8', 'replace'))
        print('ERROR see _work/wo_v4_error.txt')
