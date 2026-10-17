# -*- coding: utf-8 -*-
"""Join lines for inline $...$ spans that cross MORE THAN ONE newline.

join_wraps2.py only handles the adjacent-line pair.  A span over two or more
newlines is the same grammar violation, just with an extra line inside it, and
it renders as literal dollar signs too.  Because a long "wrap" can also be a
false pair produced by a literal $ in prose eating the following opener, every
candidate is printed for a human read before anything is written.

Usage: python join_wrapsN.py [IDprefix] [--apply]
"""
from __future__ import unicode_literals
import io, os, re, sys, glob, shutil
from join_wraps2 import D, BT, ROOT, LOG, BK, fence_flags, blocked

ITEM_RE = None


def spans(L, flags):
    """[(start_line, end_line)] for grammar-invalid inline spans crossing >=1 EOL."""
    ml = [u' ' * len(l) if f else re.sub(u'`+[^`\n]*`+', lambda mm: u' ' * len(mm.group(0)), l)
          for l, f in zip(L, flags)]
    offs = []
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
        a, b = offs[i], offs[closer]
        if b[0] > a[0]:
            res.append((a[0], b[0]))
        i = closer + 1
    return res


DIG = set(u'0123456789')
# Read case by case before joining: a "span" can also be a literal $ in prose
# eating the next opener, and then the lines it pairs have nothing to do with
# each other.  D218:706-708 is that case -- the sentence there is the author's
# own errata about 反引号内的多余 `$`, so joining it would fuse three unrelated
# sentences while fixing nothing.
EXCLUDE = [(u'D218', 706)]


def merge(L, a, b):
    out = L[a]
    for k in range(a + 1, b + 1):
        out += u' ' + L[k].lstrip()
    return out


def run(paths, apply, show):
    tot = files = skipped = 0
    for p in paths:
        t = io.open(p, encoding='utf-8').read()
        if chr(13) in t:
            print('SKIP-CR', os.path.basename(p)[:12])
            continue
        L, flags = fence_flags(t)
        sp = [(a, b) for a, b in spans(L, flags) if b > a + 1]
        if not sp:
            continue
        take = []
        used = set()
        key = os.path.basename(p)[:4]
        for a, b in sp:
            if (key, a + 1) in EXCLUDE:
                skipped += 1
                continue
            if any(blocked(L, flags, k) for k in range(a, b + 1)):
                skipped += 1
                continue
            if any(k in used for k in range(a, b + 1)):
                skipped += 1
                continue
            used.update(range(a, b + 1))
            take.append((a, b))
            if show:
                print('%s lines %d-%d' % (os.path.basename(p)[:12], a + 1, b + 1))
                for k in range(a, b + 1):
                    print('    %d %s' % (k + 1, L[k][:96]))
        if not take:
            print('%s all-skipped cand=%d' % (os.path.basename(p)[:12], len(sp)))
            continue
        new = list(L)
        for a, b in sorted(take, key=lambda e: -e[0]):
            new[a] = merge(L, a, b)
            del new[a + 1:b + 1]
        t2 = u'\n'.join(new)
        L2, flags2 = fence_flags(t2)
        rest = len([1 for a, b in spans(L2, flags2) if b > a + 1])
        assert rest == len(sp) - len(take), (p, rest, len(sp), len(take))
        lead = sum(len(L[k]) - len(L[k].lstrip())
                   for a, b in take for k in range(a + 1, b + 1))
        assert t2.count(D) == t.count(D)
        assert t2.count(BT) == t.count(BT)
        assert len(t2.encode('utf-8')) == len(t.encode('utf-8')) - lead
        assert len(new) == len(L) - sum(b - a for a, b in take)
        tot += len(take)
        files += 1
        print('== %s joins=%d size %d->%d' % (os.path.basename(p)[:12], len(take),
                                              len(t.encode('utf-8')), len(t2.encode('utf-8'))))
        if apply:
            with io.open(u'E:/math/_work/joinN_log.txt', 'a', encoding='utf-8') as g:
                for a, b in take:
                    g.write(u'%s\t%d\t%d\t%s\n' % (p, a + 1, b + 1,
                                                   u' / '.join(L[a:b + 1])))
            shutil.copyfile(p, os.path.join(BK, os.path.basename(p)[:12] + u'.pre-wrapN.md'))
            io.open(p, 'w', encoding='utf-8', newline='').write(t2)
    print('TOTAL joins=%d files=%d skipped=%d %s'
          % (tot, files, skipped, 'APPLIED' if apply else 'dry'))


if __name__ == u'__main__':
    ps = sorted(glob.glob(os.path.join(ROOT, '*.md')))
    args = [a for a in sys.argv[1:] if not a.startswith('--')]
    if args:
        ps = [f for f in ps if os.path.basename(f).startswith(args[0])]
    run(ps, '--apply' in sys.argv, '--show' in sys.argv or '--apply' not in sys.argv)
