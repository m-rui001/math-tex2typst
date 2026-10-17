# -*- coding: utf-8 -*-
"""Repair wrapped inline spans whose real cause is a space before the closing $.

The math grammar refuses a closer preceded by whitespace, so `$\\lVert x\\rvert $`
never closes: the span runs on into the next line's $, which is what the wrap
meters see. Table rows cannot be joined, so the one-byte repair is to drop that
space (no macro is followed by a letter, so nothing gets swallowed).

Usage: python fix_space_closers.py [--apply]
"""
from __future__ import unicode_literals
import io, os, sys, glob, shutil
import join_wraps2 as J

ROOT = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
LOG = u'E:/math/_work/space_fix_log.txt'
D = chr(36)


def try_file(p, apply):
    t = io.open(p, encoding='utf-8').read()
    if chr(13) in t:
        return 0
    edits = []
    cur = t
    for _ in range(60):
        L, flags = J.fence_flags(cur)
        spans = J.wrap1_spans(L, flags)
        if not spans:
            break
        a, b = spans[0]
        if flags[a] or L[a].strip()[:1] in u'#>`' or not L[a].strip():
            break
        line = L[a]
        cols = [i for i, c in enumerate(line) if c == D]
        hit = None
        for c in reversed(cols):
            if c > 0 and line[c - 1] == u' ' and line[c + 1:c + 2] not in (D,):
                hit = c
                break
        if hit is None:
            break
        new = list(L)
        new[a] = line[:hit - 1] + line[hit:]
        cur2 = u'\n'.join(new)
        L2, fl2 = J.fence_flags(cur2)
        if len(J.wrap1_spans(L2, fl2)) >= len(spans):
            break                     # not this cause; stop touching this file
        edits.append((a + 1, line[hit - 24:hit + 4], new[a][hit - 24:hit + 4]))
        cur = cur2
    if not edits:
        return 0
    assert cur.count(D) == t.count(D)
    assert len(cur.encode('utf-8')) == len(t.encode('utf-8')) - len(edits)
    assert cur.count(chr(96)) == t.count(chr(96))
    print(os.path.basename(p)[:12], 'edits=%d' % len(edits))
    for ln, old, nw in edits[:3]:
        print('   line %d  %r -> %r' % (ln, old, nw))
    if apply:
        with io.open(LOG, 'a', encoding='utf-8') as g:
            for ln, old, nw in edits:
                g.write(u'%s\t%d\t%s\n' % (p, ln, old))
        shutil.copyfile(p, os.path.join(u'E:/math/_work',
                                        os.path.basename(p)[:12] + u'.pre-space.md'))
        io.open(p, 'w', encoding='utf-8', newline='').write(cur)
    return len(edits)


ps = sorted(glob.glob(os.path.join(ROOT, '*.md')))
tot = 0
for p in ps:
    if len(J.wrap1_spans(*J.fence_flags(io.open(p, encoding='utf-8').read()))) == 0:
        continue
    tot += try_file(p, '--apply' in sys.argv)
print('TOTAL space_edits=%d %s' % (tot, 'APPLIED' if '--apply' in sys.argv else 'dry'))
