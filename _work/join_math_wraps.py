# -*- coding: utf-8 -*-
"""Join the second line of an adjacent odd-$ pair into the first.

An inline $...$ span wrapped across one newline renders as literal dollar
signs in CommonMark math extensions, so the two lines become one.
"""
from __future__ import unicode_literals
import io, os, re, sys, glob

D = chr(36)
ROOT = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
LOG = u'E:/math/_work/join_log.txt'
ITEM = re.compile(u'^(?:[-*+] |\\d+[.)] )')


def blocked_first(l):
    s = l.strip()
    return (not s or s[0] in u'|#>`' or l.endswith(chr(92)) or l.count(u'`') % 2 == 1)


def blocked_next(l):
    s = l.strip()
    return (not s or s[0] in u'|#>`' or ITEM.match(s) or l.endswith(chr(92)) or
            l.count(u'`') % 2 == 1)


def run(paths, apply):
    total = 0
    out = []
    for p in paths:
        t = io.open(p, encoding='utf-8').read()
        if chr(13) in t:
            print('SKIP-CR', os.path.basename(p)[:12])
            continue
        L = t.split(u'\n')
        odd = set(i for i, l in enumerate(L) if l.count(D) % 2 == 1)
        joins = []
        i = 0
        while i < len(L) - 1:
            if (i in odd and i + 1 in odd and not blocked_first(L[i])
                    and not blocked_next(L[i + 1])):
                joined = L[i] + u' ' + L[i + 1].lstrip()
                if joined.count(D) % 2 == 0:
                    joins.append((i, L[i], L[i + 1], joined))
                    i += 2
                    continue
            i += 1
        if not joins:
            continue
        new = list(L)
        for i, a, b, j in sorted(joins, key=lambda e: -e[0]):
            new[i] = j
            del new[i + 1]
        t2 = u'\n'.join(new)
        assert t2.count(D) == t.count(D)
        assert len(new) == len(L) - len(joins)
        lead = sum(len(b) - len(b.lstrip()) for i, a, b, j in joins)
        assert len(t2.encode('utf-8')) == len(t.encode('utf-8')) - lead
        assert t2.count(u'`') == t.count(u'`')
        total += len(joins)
        out.append((p, joins, t, t2))
        print('%s joins=%d size %d->%d' % (os.path.basename(p)[:12], len(joins),
                                           len(t.encode('utf-8')), len(t2.encode('utf-8'))))
        for i, a, b, j in joins[:1]:
            print('   line %d old=%r new=%r' % (i + 1, a[-40:], j[-70:]))
    if apply:
        with io.open(LOG, 'a', encoding='utf-8') as g:
            for p, joins, t, t2 in out:
                for i, a, b, j in joins:
                    g.write(u'%s\t%d\t%s\t%s\n' % (p, i + 1, a, b))
        for p, joins, t, t2 in out:
            io.open(p, 'w', encoding='utf-8', newline='').write(t2)
    print('TOTAL joins=%d files=%d %s' % (total, len(out), 'APPLIED' if apply else 'dry'))


run(sorted(glob.glob(os.path.join(ROOT, '*.md'))), '--apply' in sys.argv)
