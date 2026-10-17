# -*- coding: utf-8 -*-
"""Per-case repair of the inline-math flags that the mechanical joiners refused.

Each site was read in context first.  Classes:
  join   -- the span really does cross one newline, but one of the two lines
            carries a list marker, a `>` quote, or a trailing backslash, so the
            mechanical joiner refused it.  Joining keeps every word.
  sect   -- `$\S$4`: the closer is followed by a digit, which the grammar
            refuses, so the span runs on past the row.  The house style already
            writes the literal section sign, so `$\S$` + digit becomes that
            sign + digit.
  tick   -- an inline span opened with a backtick the author meant as a math
            opener: the line closes with `$` and nothing on it ever closes the
            code span.
Deliberately untouched: D123:197 and D123:218 -- CommonMark lets a code span
cross one newline, so those two are meter false positives.

Usage: python fix_wrap1_cases.py [--apply]
"""
from __future__ import unicode_literals
import io, os, re, sys, glob, shutil
sys.path.insert(0, u'E:/math/_work')
from wrap_strict import scan

D = chr(36)
B = chr(92)
T = chr(96)
SECT = u'\u00a7'
ROOT = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
BK = u'E:/math/_work'
LOG = u'E:/math/_work/case_fix_log.txt'

JOINS = {
    u'D106': [398],
    u'D116': [1449],
    u'D122': [803],
    u'D140': [984, 1206],
    u'D218': [328, 555, 566],
    u'D264': [616],
    u'D89': [814],
    u'D99': [192],
}
SECT_KEYS = [u'D51']
TICKS = {u'D95': [(932, u'\u7528\u4e2d\u5fc3\u51a0\u754c:' + T + u'\sup_s',
                  u'\u7528\u4e2d\u5fc3\u51a0\u754c:' + D + u'\sup_s')]}


def wrap1(t):
    return sum(1 for x in scan(t) if x[1] == 'WRAP1')


def deal(path, apply):
    key = re.match(u'(D\d+)', os.path.basename(path)).group(1)
    orig = io.open(path, encoding='utf-8').read()
    L = orig.split(u'\n')
    ops = []
    bytes_lead = 0
    for n in sorted(JOINS.get(key, []), reverse=True):
        a, b = L[n - 1], L[n]
        assert D in a and D in b, (key, n)
        lead = len(b) - len(b.lstrip())
        L[n - 1] = a + u' ' + b.lstrip()
        del L[n]
        bytes_lead += lead                # the folded newline is paid back by the space
        ops.append((u'join', n, a[:36], b[:36]))
    t = u'\n'.join(L)
    n_sect = 0
    if key in SECT_KEYS:
        pat = re.compile(re.escape(D + B + u'S' + D) + u'([0-9])')
        n_sect = len(pat.findall(t))
        assert n_sect, key
        t = pat.sub(lambda m: SECT + m.group(1), t)
        ops.append((u'sect', 0, n_sect, u''))
    for ln, old, new in TICKS.get(key, []):
        assert t.count(old) == 1, (key, ln, t.count(old))
        t = t.replace(old, new, 1)
        ops.append((u'tick', ln, old[:24], new[:24]))
    assert t.count(chr(13)) == 0
    assert t.count(D) == orig.count(D) - 2 * n_sect + len(TICKS.get(key, []))
    assert t.count(T) == orig.count(T) - len(TICKS.get(key, []))
    exp = len(orig.encode('utf-8')) - bytes_lead - 2 * n_sect   # 4 bytes -> 2 bytes a hit
    got = len(t.encode('utf-8'))
    assert got == exp, (key, got, exp)     # 4 chars -> 1 char, i.e. -6 bytes a hit
    w0, w1 = wrap1(orig), wrap1(t)
    assert len(t.split(u'\n')) == len(L)
    print('%-6s ops=%d wrap1 %d->%d %s' % (key, len(ops), w0, w1,
                                           [o[0] for o in ops]))
    if w1 >= w0:
        print('   REFUSED -- wrap1 did not drop')
        return 0, 0
    if apply:
        shutil.copyfile(path, os.path.join(BK, key + u'.pre-case.md'))
        with io.open(LOG, 'a', encoding='utf-8') as g:
            for o in ops:
                g.write(u'%s\t%s\n' % (path, u'\t'.join(str(x) for x in o)))
        io.open(path, 'w', encoding='utf-8', newline='').write(t)
    return len(ops), w0 - w1


if __name__ == u'__main__':
    ap = '--apply' in sys.argv
    keys = sorted(set(list(JOINS) + SECT_KEYS + list(TICKS)))
    tot = drop = 0
    for k in keys:
        ps = glob.glob(os.path.join(ROOT, '%s-*.md' % k))
        assert len(ps) == 1, (k, ps)
        n, d = deal(ps[0], ap)
        tot += n
        drop += d
    print('TOTAL ops=%d wrap1_dropped=%d files=%d %s'
          % (tot, drop, len(keys), 'APPLIED' if ap else 'dry'))
