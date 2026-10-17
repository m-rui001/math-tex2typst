# -*- coding: utf-8 -*-
"""Read-only verification of the 517 cat=ORDER author workorders against current bytes
on disk.  Writes UTF-8 evidence dumps under _work/, never touches 研究笔记/.
"""
from __future__ import print_function
import io, os, re, sys, json, collections, traceback

HDR = ['id','note','sec_line','sec_head','no','label','cat','kind','fam',
       'stated','cur','verified','quote','fix','evidence','verify_note']
ARROW = u'\u2192'
NOTE_DIR = u'\u7814\u7a76\u7b14\u8bb0'
INFLIGHT = ('D80-', 'D94-', 'D66-', 'D080-', 'D094-', 'D066-')

MARKERS = [u'应为', u'应作', u'应写作', u'应记作', u'应改为', u'应统一为', u'应改作',
           u'应写成', u'改为', u'改作', u'改回', u'改写为', u'替换为', u'更正为',
           u'纠正为', u'换成', u'正解是', u'应读作', u'宜作', u'记作', u'写作',
           u'当作', u'应记为', u'正确写法是', u'期望文本为', u'应为', u'该为',
           u'要改为', u'请改为', u'须改为', u'改称', u'补记为']
LEAD_NOISE = u' ，。；:：、的了他它此该句行则并且与和/（）()「」『』“”‘’\'"`'

CLOSE = {u'“': u'”', u'‘': u'’', u'「': u'」', u'『': u'』', u'"': u'"'}
STOP = u'，。；、： '

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
    return i if i <= 6 and l[i:i+1] in (' ', '') else 0

def section_bounds(lines, hdr_idx):
    """0-based index of a header line -> (start, end) 0-based half-open."""
    lvl = head_level(lines[hdr_idx])
    j = hdr_idx + 1
    while j < len(lines):
        l2 = head_level(lines[j])
        if l2 and l2 <= lvl:
            break
        j += 1
    return hdr_idx, j

def strip_marker(s):
    changed = True
    while changed:
        changed = False
        s = s.strip()
        for m in MARKERS:
            if s.startswith(m):
                s = s[len(m):].strip()
                changed = True
                break
        while s and s[0] in u'为成到作，。;：: 　':
            s = s[1:]
            changed = True
    return s.strip()

def extend_at(line, idx, seed):
    """Grow `seed` occurrence at idx into its natural delimited span."""
    end = idx + len(seed)
    if seed[0] == '`':
        k = line.find('`', end)
        if k > 0:
            return line[idx:k+1], k + 1
        return line[idx:end], end
    if seed[0] == '$':
        k = line.find('$', end)
        if k > 0:
            return line[idx:k+1], k + 1
        return line[idx:end], end
    c = CLOSE.get(seed[0])
    if c:
        k = line.find(c, end)
        if k > 0:
            return line[idx:k+1], k + 1
    # plain run: stop at punctuation or at a marker that starts the good side
    k = end
    while k < len(line):
        ch = line[k]
        if ch in STOP or ch in u'“”‘’"\'`$':
            break
        if line.startswith((u'应为', u'应作', u'改为', u'应写作', u'替换为', u'更正为',
                            u'改回', u'换成', u'应记作', u'应统一为'), k):
            break
        k += 1
    return line[idx:k], k

def find_all(lines, needle):
    return [(i + 1, lines[i].count(needle)) for i in range(len(lines)) if needle in lines[i]]

def longest_prefix_on_line(lines, seed):
    """Return (line_no, idx, matched_str) for the longest prefix of seed on any line."""
    for n in range(len(seed), 3, -1):
        s = seed[:n]
        for i, l in enumerate(lines):
            j = l.find(s)
            if j >= 0:
                return i + 1, j, s
    return None

UNDEF = set()
try:
    j = json.load(io.open('katexundef.json', 'rb'))
    UNDEF = set(k for k in j.get('undef', {}))
except Exception:
    pass
UNDEF |= {u'\\R', u'\\F', u'\\d', u'\\overline', u'\\mathbb', u'\\D', u'\\X'}
CS_RE = re.compile(r'\\[A-Za-z]+')

def macro_risk(line):
    toks = set(m.group(0) for m in CS_RE.finditer(line))
    hit = sorted(t for t in toks if t in UNDEF)
    if hit:
        return u'undefined-control-seq ' + u','.join(h.lstrip('\\') for h in hit)
    if u'\\overline\\mathbb' in line or u'\\overline{' in line and u'\\mathbb' in line:
        return u'overline-mathbb pattern'
    return None

MOVE_WORDS = [u'插入', u'搬', u'移到', u'挪', u'整块', u'新增', u'补一行', u'另起一行',
              u'插行', u'拆行', u'分段']
DEL_WORDS = [u'删除', u'删掉', u'删去', u'去掉']

def analyze(r):
    ev = {'id': r['id'], 'note': r['note'], 'kind': r['kind'], 'fam': r['fam'],
          'sec_line': int(r['sec_line']), 'sites': [], 'flags': []}
    lines = load_note(r['note'])
    if lines is None:
        ev['verdict'] = 'STALE-COORD'
        ev['reason'] = 'note file not on disk'
        return ev
    ev['nlines'] = len(lines)
    sl = ev['sec_line']
    in_flight = r['note'].startswith(INFLIGHT)
    ev['inflight'] = in_flight

    # --- sec_head check -------------------------------------------------------
    if 0 < sl <= len(lines):
        hline = lines[sl - 1]
        ev['secline_head_actual'] = hline.strip()
        ev['secline_matches_sec_head'] = (hline.strip() == r['sec_head'].strip())
        if not head_level(hline):
            ev['flags'].append('SEC-LINE-NOT-HEADER')
    else:
        ev['secline_head_actual'] = 'OUT-OF-RANGE'
        ev['flags'].append('SEC-LINE-OUT-OF-RANGE')

    # --- anchor ---------------------------------------------------------------
    q = r['quote'].strip()
    hits = [i for i, l in enumerate(lines) if q in l]
    ev['quote_exact'] = bool(hits)
    if not hits:
        for n in (100, 96, 90, 80, 70, 60, 50, 40, 32, 24, 16, 12, 10):
            if n > len(q):
                continue
            s = q[:n]
            hh = [i for i, l in enumerate(lines) if s in l]
            if hh:
                hits = hh
                ev['anchor_prefix_len'] = n
                break
    ev['anchor_lines'] = [h + 1 for h in hits]
    if not hits:
        ev['verdict'] = 'STALE-COORD'
        ev['reason'] = 'quote not locatable on disk (even by 10-char prefix)'
        return ev

    # declaration region = section that contains the anchor line
    hdr = sl - 1 if (0 < sl <= len(lines) and head_level(lines[sl - 1])) else None
    if hdr is None:
        # walk up from anchor to nearest header
        a = hits[0]
        k = a
        while k >= 0 and not head_level(lines[k]):
            k -= 1
        hdr = k if k >= 0 else 0
    ds, de = section_bounds(lines, hdr)
    ev['decl_range'] = (ds + 1, de)
    ev['anchor_in_decl'] = all(ds <= h < de for h in hits)

    fix = r['fix']
    ev['fix'] = fix
    if not fix.strip():
        ev['verdict'] = 'NO-VERBATIM'
        ev['reason'] = 'fix column empty (intent only)'
        return ev

    pairs = []
    segs = fix.split(ARROW)
    for i in range(len(segs) - 1):
        L = segs[i]
        R = segs[i + 1]
        if u' / ' in L:
            L = L.split(u' / ')[-1]
        head = R.split(u' / ')[0]
        pairs.append((L, head))
    ev['npairs'] = len(pairs)

    for (L, R) in pairs:
        bad_seed = strip_marker(L)
        good_seed = R.strip()
        site = {'raw_left': L[:60], 'raw_right': R[:60]}
        # resolve bad against disk
        bl = find_all(lines, bad_seed) if len(bad_seed) >= 3 else []
        if bl:
            ln0 = bl[0][0] - 1
            idx = lines[ln0].find(bad_seed)
            bad_ext, _ = extend_at(lines[ln0], idx, bad_seed)
            site['bad'] = bad_ext
            site['bad_raw_only'] = bad_seed
        else:
            fp = longest_prefix_on_line(lines, bad_seed) if len(bad_seed) >= 6 else None
            if fp:
                ln0, idx, ms = fp
                bad_ext, _ = extend_at(lines[ln0], idx, ms)
                site['bad'] = bad_ext
                site['bad_prefix_only'] = True
            else:
                site['bad'] = None
        # resolve good against disk (it is written verbatim in the declaration line)
        anchor_text = lines[hits[0]]
        gi = anchor_text.find(good_seed)
        if gi < 0:
            fp = longest_prefix_on_line([anchor_text], good_seed) if len(good_seed) >= 5 else None
            if fp:
                _, gidx, ms = fp
                good_ext, _ = extend_at(anchor_text, gidx, ms)
                site['good'] = good_ext
                site['good_prefix_only'] = True
            else:
                site['good'] = None
        else:
            good_ext, _ = extend_at(anchor_text, gi, good_seed)
            site['good'] = good_ext
        if site['bad'] is None:
            ev['flags'].append('BAD-NOT-ON-DISK')
            ev['sites'].append(site)
            continue
        bad = site['bad']
        good = site['good'] if site['good'] else good_seed
        occ = find_all(lines, bad)
        body = [(n, c) for (n, c) in occ if not (ds <= n - 1 < de)]
        decl = [(n, c) for (n, c) in occ if (ds <= n - 1 < de)]
        site['occ'] = occ
        site['body_occ'] = body
        site['decl_occ'] = decl
        site['good_body_occ'] = find_all(lines, good) if good else []
        site['byte_delta'] = (len(good.encode('utf-8')) - len(bad.encode('utf-8'))) if good else None
        if good:
            par = []
            for (n, c) in occ:
                l = lines[n - 1]
                nl = l.replace(bad, good)
                if (l.count('$') % 2) != (nl.count('$') % 2):
                    par.append(('dollar', n))
                if (l.count('`') % 2) != (nl.count('`') % 2):
                    par.append(('btick', n))
            site['parity_break'] = par
        ev['sites'].append(site)

    # ---------------- verdict ------------------------------------------------
    any_body = [s for s in ev['sites'] if s.get('body_occ')]
    any_good_body = [s for s in ev['sites'] if s.get('good_body_occ')]
    any_decl_bad = [s for s in ev['sites'] if s.get('decl_occ')]
    if in_flight:
        ev['verdict'] = 'CONFLICT-RISK'
        ev['reason'] = 'note is being written by another agent (D80/D94/D66); registered only'
    elif any_body:
        ok = [s for s in any_body if not s.get('parity_break')]
        if ok:
            ev['verdict'] = 'EXEC'
        else:
            ev['verdict'] = 'NEEDS-NEW-LINE'
            ev['reason'] = 'replacement changes line-level delimiter parity'
        if any(s.get('parity_break') for s in any_body) and ev['verdict'] == 'EXEC':
            ev['flags'].append('SOME-SITES-PARITY-BREAK')
    elif any_good_body:
        ev['verdict'] = 'ALREADY-DONE'
        ev['reason'] = 'expected text already present in body, bad form nowhere outside declaration'
    elif any_decl_bad:
        ev['verdict'] = 'KEEP-DECLARATION'
        ev['reason'] = 'bad form survives only inside the declaration section quoting it'
    else:
        ev['verdict'] = 'STALE-COORD'
        ev['reason'] = 'neither declared bad form nor expected text found on disk'
    return ev

def main():
    order = load_rows()
    res = [analyze(r) for r in order]
    io.open('_work/wo_evidence.json', 'wb').write(
        json.dumps(res, ensure_ascii=False, indent=1).encode('utf-8'))
    cnt = collections.Counter(x['verdict'] for x in res)
    print('rows', len(res), 'notes loaded', len(_notes))
    for k in sorted(cnt):
        print(k, cnt[k])
    # per-site tally
    nsites = 0
    nbody_sites = 0
    for x in res:
        for s in x.get('sites', []):
            nsites += 1
            nbody_sites += len(s.get('body_occ', []))
    print('pairs', nsites, 'body bad-occurrences', nbody_sites)
    print('quote-exact', sum(1 for x in res if x.get('quote_exact')))
    print('secline==sec_head', sum(1 for x in res if x.get('secline_matches_sec_head')))
    print('anchor-in-decl', sum(1 for x in res if x.get('anchor_in_decl')))
    print('bad-not-on-disk rows', sum(1 for x in res if 'BAD-NOT-ON-DISK' in x.get('flags', [])))

if __name__ == '__main__':
    try:
        main()
    except Exception:
        io.open('_work/wo_error.txt', 'wb').write(traceback.format_exc().encode('utf-8', 'replace'))
        print('ERROR, see _work/wo_error.txt')
