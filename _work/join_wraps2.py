# -*- coding: utf-8 -*-
"""Join lines for inline $...$ spans that the math grammar refuses to render.

Driven by the same strict scan as wrap_strict.py (opener not followed by
whitespace, closer not preceded by whitespace nor followed by a digit), but the
scan runs on the fence-and-code-masked text, so quoted source inside ``` fences
can never be merged, and a stray $ in `code` cannot make the meter see a span
that is not there.

Usage: python join_wraps2.py [IDprefix] [--apply]
"""
from __future__ import unicode_literals
import io, os, re, sys, glob, shutil

D = chr(36)
BT = chr(96)
ROOT = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
LOG = u'E:/math/_work/join_log.txt'
BK = u'E:/math/_work'
ITEM = re.compile(u'^(?:[-*+] |\\d+[.)] )')
FENCE = re.compile(u'^(?:`{3,}|~{3,})')
CODE = re.compile(u'`+[^' + BT + u'\n]*`+')
DIG = set(u'0123456789')


def fence_flags(t):
    L = t.split(u'\n')
    flags = []
    infence = False
    tok = None
    for l in L:
        s = l.strip()
        if FENCE.match(s):
            if not infence:
                infence = True
                tok = s[0] * 3
                flags.append(2)          # the fence line itself
                continue
            if tok and s.startswith(tok):
                infence = False
                tok = None
                flags.append(2)
                continue
        flags.append(1 if infence else 0)
    return L, flags


def masked_lines(L, flags):
    out = []
    for l, f in zip(L, flags):
        if f:
            out.append(u' ' * len(l))
        else:
            out.append(CODE.sub(lambda mm: u' ' * len(mm.group(0)), l))
    return out


def wrap1_spans(L, flags):
    """Return [(start_line, end_line)] for grammar-invalid inline spans with one EOL."""
    ml = masked_lines(L, flags)
    offs = []          # (line, col) per character index
    for i, l in enumerate(ml):
        for j in range(len(l) + 1):
            offs.append((i, j))
    mt = u'\n'.join(ml)
    n = len(mt)
    res = []
    i = 0
    while i < n:
        if mt[i] != D:
            i += 1
            continue
        if mt[i + 1:i + 2] == D:
            i += 2
            continue
        if mt[i + 1:i + 2] in (u' ', u'\t', u'\n', u''):
            i += 1
            continue
        j = i + 1
        closer = -1
        while j < n:
            if mt[j] == D:
                if mt[j - 1] not in (u' ', u'\t', u'\n') and mt[j + 1:j + 2] not in DIG:
                    closer = j
                    break
            j += 1
        if closer < 0:
            i += 1
            continue
        a = offs[i]
        b = offs[closer]
        if b[0] == a[0] + 1:
            res.append((a[0], b[0]))
        i = closer + 1
    return res


def blocked(L, flags, i):
    l = L[i]
    s = l.strip()
    if flags[i] or not s:
        return True
    if s[0] in u'|#>`' or ITEM.match(s) or l.endswith(chr(92)):
        return True
    if l.count(BT) % 2 == 1:
        return True
    return False


def run(paths, apply):
    tot = skipped = 0
    files = 0
    for p in paths:
        t = io.open(p, encoding='utf-8').read()
        if chr(13) in t:
            print('SKIP-CR', os.path.basename(p)[:12])
            continue
        L, flags = fence_flags(t)
        spans = wrap1_spans(L, flags)
        if not spans:
            continue
        take = []
        used = set()
        for a, b in spans:
            if blocked(L, flags, a) or blocked(L, flags, b):
                skipped += 1
                continue
            if a in used or b in used:
                skipped += 1
                continue
            used.add(a)
            used.add(b)
            take.append((a, b))
        if not take:
            continue
        new = list(L)
        for a, b in sorted(take, key=lambda e: -e[0]):
            joined = new[a] + u' ' + new[b].lstrip()
            new[a] = joined
            del new[b]
        t2 = u'\n'.join(new)
        L2, flags2 = fence_flags(t2)
        rest = len(wrap1_spans(L2, flags2))
        assert rest == len(spans) - len(take), (os.path.basename(p), rest, len(spans), len(take))
        lead = sum(len(L[b]) - len(L[b].lstrip()) for a, b in take)
        assert t2.count(D) == t.count(D)
        assert t2.count(BT) == t.count(BT)
        assert len(t2.encode('utf-8')) == len(t.encode('utf-8')) - lead
        assert len(new) == len(L) - len(take)
        tot += len(take)
        files += 1
        print('%s joins=%d skipped=%d size %d->%d'
              % (os.path.basename(p)[:12], len(take), len(spans) - len(take),
                 len(t.encode('utf-8')), len(t2.encode('utf-8'))))
        if apply:
            with io.open(LOG, 'a', encoding='utf-8') as g:
                for a, b in take:
                    g.write(u'%s\t%d\t%s\t%s\n' % (p, a + 1, L[a], L[b]))
            shutil.copyfile(p, os.path.join(BK, os.path.basename(p)[:12] + u'.pre-wrap.md'))
            io.open(p, 'w', encoding='utf-8', newline='').write(t2)
    print('TOTAL joins=%d files=%d skipped=%d %s'
          % (tot, files, skipped, 'APPLIED' if apply else 'dry'))


if __name__ == u'__main__':
    ps = sorted(glob.glob(os.path.join(ROOT, '*.md')))
    args = [a for a in sys.argv[1:] if not a.startswith('--')]
    if args:
        ps = [f for f in ps if os.path.basename(f).startswith(args[0])]
    run(ps, '--apply' in sys.argv)
