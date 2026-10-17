# -*- coding: utf-8 -*-
# Execute ONLY the ORDER sites parsed from _work/katex_undef_plan.txt.
# Default is DRY RUN. Pass --apply to write.
#   python _work/exec_order.py            # dry run  -> _work/exec_order_dry.txt
#   python _work/exec_order.py --apply    # write    -> _work/exec_order_apply.txt
import io, re, os, sys, glob, json, collections, hashlib

APPLY = '--apply' in sys.argv[1:]
ARG_IDS = [a for a in sys.argv[1:] if not a.startswith('--')]
SITES = json.load(io.open(r'E:\math\_work\order_sites.json', encoding='utf-8'))
NOTES_DIR = os.path.join(r'E:\math', '研究笔记')
REPORT = r'E:\math\_work\exec_order_apply.txt' if APPLY else r'E:\math\_work\exec_order_dry.txt'

# hard exclusions: three live writer notes
BANNED = {'D80', 'D94', 'D66'}

R = []
def log(s):
    R.append(s)

def resolve(nid):
    hits = sorted(glob.glob(os.path.join(NOTES_DIR, nid + '-*.md')))
    if len(hits) != 1:
        return None, hits
    return hits[0], hits

def read_lines(p):
    """bytes -> (lines, raw size, md5, CR count). Notes are UTF-8 with CR == 0; that is
       asserted, not silently repaired, so a CRLF file stops the run instead of shifting
       the plan's coordinates under us."""
    raw = io.open(p, 'rb').read()
    txt = raw.decode('utf-8')
    cr = txt.count('\r')
    assert txt.count('\n') == 0 or '\r' not in txt.replace('\r\n', ''), 'lone CR in %s' % p
    return txt.replace('\r\n', '\n').split('\n'), len(raw), hashlib.md5(raw).hexdigest(), cr

def parity_check(path, before_lines, after_lines, edited_idx):
    """line count identical; per edited line $ and backtick parity even before+after;
       file total $ / backtick parity unchanged."""
    assert len(before_lines) == len(after_lines), 'LINE COUNT CHANGED %s %d->%d' % (path, len(before_lines), len(after_lines))
    for i in edited_idx:
        for ch, nm in (('$', 'dollar'), (chr(96), 'backtick')):
            b, a = before_lines[i].count(ch), after_lines[i].count(ch)
            assert b % 2 == 0, 'line %d odd %s count %d BEFORE %s' % (i + 1, nm, b, path)
            assert a % 2 == 0, 'line %d odd %s count %d AFTER %s' % (i + 1, nm, a, path)
    for ch, nm in (('$', 'dollar'), (chr(96), 'backtick')):
        b = sum(l.count(ch) for l in before_lines)
        a = sum(l.count(ch) for l in after_lines)
        assert b % 2 == a % 2, 'file %s parity flipped %s %d->%d %s' % (nm, path, b, a, '')
    return True

# group sites: (note, lineno, kind, bad) -> {good, n_sites}
groups = collections.OrderedDict()
for s in SITES:
    key = (s['note'], s['line'], s['kind'], s['bad'])
    g = groups.setdefault(key, dict(good=s['good'], n=0, family=s['family']))
    assert g['good'] == s['good'], 'same bad form with two goods: %r' % (key,)
    g['n'] += 1

by_note = collections.OrderedDict()
for (nid, ln, kind, bad), g in groups.items():
    by_note.setdefault(nid, []).append((ln, kind, bad, g))

skipped = []
executed = []
stats_family = collections.Counter()
stats_note = collections.Counter()

log('MODE = %s' % ('APPLY' if APPLY else 'DRY-RUN'))
log('groups=%d sites=%d notes=%d' % (len(groups), len(SITES), len(by_note)))

for nid in sorted(by_note, key=lambda x: int(x[1:])):
    if ARG_IDS and nid not in ARG_IDS:
        continue
    if nid in BANNED:
        skipped.append((nid, None, 'in-flight writer note (D80/D94/D66 exclusion)'))
        log('== %s SKIPPED in-flight writer note' % nid)
        continue
    path, hits = resolve(nid)
    if path is None:
        skipped.append((nid, None, 'filename glob not unique: %s' % hits))
        log('== %s SKIPPED unresolvable filename %s' % (nid, hits))
        continue
    lines, size0, md5_0, cr0 = read_lines(path)
    if cr0:
        skipped.append((nid, None, 'CR count = %d, expected 0; not touching' % cr0))
        log('== %s SKIPPED CR=%d (corpus files are CR-free)' % (nid, cr0))
        continue
    log('== %s  %s  size=%d lines=%d CR=%d' % (nid, os.path.basename(path), size0, len(lines), cr0))
    orig = list(lines)
    edited = []
    # order the groups on a note by (line asc, body length desc) so nested span bodies
    # are consumed longest-first
    work = sorted(by_note[nid], key=lambda t: (t[0], -len(t[2])))
    for (ln, kind, bad, g) in work:
        i = ln - 1
        if not (0 <= i < len(lines)):
            skipped.append((nid, ln, 'line number out of range (file has %d lines)' % len(lines)))
            log('   [SKIP] %s:%d line out of range' % (nid, ln))
            continue
        line = lines[i]
        if kind == 'macro':
            pat = re.compile(re.escape(bad) + u'(?![A-Za-z])')
            occ = [m.start() for m in pat.finditer(line)]
        else:
            occ = []
            st = 0
            while True:
                j = line.find(bad, st)
                if j < 0:
                    break
                occ.append(j)
                st = j + len(bad)
        if not occ:
            skipped.append((nid, ln, 'plan bad-form not on declared line: %r' % bad))
            log('   [SKIP] %s:%d  bad form %r absent from the line' % (nid, ln, bad))
            continue
        for pos in occ:  # constraint 8: show the 40 chars around every hit
            ctx = line[max(0, pos - 40):pos + len(bad) + 40]
            log('   hit %s:%d %s occ@%d ctx=...%s...' % (nid, ln, bad, pos, ctx))
        if kind == 'macro':
            # lambda replacement: the target contains backslashes (\top, \mathbb{F}) which
            # re.sub would otherwise read as escapes (\t -> TAB).
            new = pat.sub(lambda m, tgt=g['good']: tgt, line)
        else:
            new = line.replace(bad, g['good'])
        # post-assert on the line
        if kind == 'macro':
            assert re.compile(re.escape(bad) + u'(?![A-Za-z])').search(new) is None, 'bad survives on %s:%d' % (nid, ln)
        else:
            assert bad not in new, 'bad survives on %s:%d' % (nid, ln)
        lines[i] = new
        if i not in edited:
            edited.append(i)
        executed.append((nid, ln, g['family'], len(occ), g['n']))
        stats_family[g['family']] += 1
        stats_note[nid] += 1
    if not edited:
        log('   no executable group on this note; nothing written')
        continue
    ok = parity_check(path, orig, lines, edited)
    newtext = '\n'.join(lines)
    buf = newtext.encode('utf-8')
    assert b'\r' not in buf
    log('   edited_lines=%d groups=%d bytes %d -> %d (delta %+d) parity_ok=%s'
        % (len(edited), stats_note[nid], size0, len(buf), len(buf) - size0, ok))
    if APPLY:
        io.open(path, 'wb').write(buf)
        lines2, size1, md5_1, cr1 = read_lines(path)
        assert cr1 == 0, 'CR written into %s' % path
        assert size1 == len(buf), 'readback size mismatch'
        assert newtext.split('\n') == lines2, 'readback content mismatch'
        log('   WRITTEN md5 %s -> %s' % (md5_0[:12], md5_1[:12]))
    else:
        log('   (dry run: not written) md5=%s' % md5_0[:12])

# family / note rollups
log('')
log('EXECUTED groups by family:')
for k, v in sorted(stats_family.items(), key=lambda x: (-x[1], x[0])):
    log('  %-16s %d' % (k, v))
log('EXECUTED groups by note:')
for k, v in sorted(stats_note.items(), key=lambda x: (-x[1], x[0])):
    log('  %-8s %d' % (k, v))
log('site->occurrence rollup (declared sites vs occurrences replaced):')
agg = collections.OrderedDict()
for (nid, ln, fam, nocc, nsites) in executed:
    a = agg.setdefault((nid, fam), [0, 0])
    a[0] += nsites
    a[1] += nocc
mis = 0
for (nid, fam), (nsites, nocc) in agg.items():
    flag = 'OK' if nocc == nsites else 'DIFF'
    if nocc != nsites:
        mis += 1
    log('  %-8s %-14s declared=%-3d replaced=%-3d %s' % (nid, fam, nsites, nocc, flag))
log('mismatched groups (occurrences != declared sites) = %d' % mis)
log('SKIPPED sites/groups = %d' % len(skipped))
for s in skipped:
    log('  %s:%s %s' % (s[0], s[1], s[2]))
log('TOTAL executed groups=%d covering declared sites=%d of %d' % (len(executed), sum(e[4] for e in executed), len(SITES)))

io.open(REPORT, 'w', encoding='utf-8').write('\n'.join(R) + '\n')
if APPLY:
    # rolling per-note log; one run == one note in the driver loop
    io.open(r'E:\math\_work\exec_order_apply_log.txt', 'a', encoding='utf-8').write('\n'.join(R) + '\n\n')
print('%s -> %s  (groups=%d skipped=%d)' % ('APPLIED' if APPLY else 'DRY', os.path.basename(REPORT), len(executed), len(skipped)))
