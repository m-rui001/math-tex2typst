# -*- coding: utf-8 -*-
"""Close an unclosed \\langle when the author typed a vertical-bar closer.

Only spans with more \\langle than \\rangle are touched, and only for the
note ids given on the command line (author-registered errata are excluded).
"""
from __future__ import unicode_literals
import io, os, re, sys, glob

B = chr(92)
D = chr(36)
ROOT = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'

INLINE = re.compile(re.escape(D) + u'([^$]*)' + re.escape(D))
DISPLAY = re.compile(re.escape(B + u'[') + u'(.*?)' + re.escape(B + u']'), re.S)
TOK = re.compile(re.escape(B) + u'(?:langle|rangle|lvert|rvert|lVert|rVert)')
OPEN = {B + u'langle': u'angle', B + u'lvert': u'vert', B + u'lVert': u'Vert'}
CLOSE = {B + u'rangle': u'angle', B + u'rvert': u'vert', B + u'rVert': u'Vert'}
PAIR = {u'angle': B + u'rangle', u'vert': B + u'rvert', u'Vert': B + u'rVert'}


def fix_span(s):
    """Return the span with its mismatched \\langle closer repaired, or None."""
    stack = []
    hit = None
    for m in TOK.finditer(s):
        t = m.group(0)
        if t in OPEN:
            stack.append(OPEN[t])
        elif stack and CLOSE[t] != stack[-1] and stack[-1] == u'angle':
            hit = (m.start(), m.end(), stack.count(u'vert') + stack.count(u'Vert'))
            stack.pop()
        elif stack:
            stack.pop()
    if hit is None:
        return None
    a, b, openers = hit
    out = s[:a] + PAIR[u'angle'] + s[b:]
    # rebalance the vertical-family counts inside the span
    nv = out.count(B + u'lvert') - out.count(B + u'rvert')
    nV = out.count(B + u'lVert') - out.count(B + u'rVert')
    if nv == 1:
        out = out[:a + len(PAIR[u'angle'])] + PAIR[u'vert'] + out[a + len(PAIR[u'angle']):]
    elif nV == 1:
        out = out[:a + len(PAIR[u'angle'])] + PAIR[u'Vert'] + out[a + len(PAIR[u'angle']):]
    return out


for pid in sys.argv[1:]:
    if pid == '--apply':
        continue
    path = glob.glob(os.path.join(ROOT, 'D%s-*.md' % pid))[0]
    t = io.open(path, encoding='utf-8').read()
    spans = [(m.span(1)[0], m.span(1)[1], m.group(1)) for m in INLINE.finditer(t)]
    spans += [(m.span(1)[0], m.span(1)[1], m.group(1)) for m in DISPLAY.finditer(t)]
    edits = []
    for st, en, s in spans:
        if s.count(B + u'langle') <= s.count(B + u'rangle'):
            continue
        f = fix_span(s)
        if f is not None and f != s:
            edits.append((st, en, s, f))
    print('=== D%s matches=%d' % (pid, len(edits)))
    for st, en, s, f in edits:
        print('  line', t.count(u'\n', 0, st) + 1)
        print('   old', s[:130].encode('unicode_escape').decode('ascii'))
        print('   new', f[:130].encode('unicode_escape').decode('ascii'))
        assert f.count(B + u'langle') == f.count(B + u'rangle'), pid
        assert f.count(D) == 0
    if '--apply' in sys.argv and edits:
        n = t
        for st, en, s, f in sorted(edits, key=lambda e: -e[0]):
            assert n[st:en] == s
            n = n[:st] + f + n[en:]
        assert n.count(D) == t.count(D)
        assert n.count(B + u'langle') == t.count(B + u'langle')
        assert n.count(B + u'rangle') == t.count(B + u'rangle') + len(edits)
        io.open(path, 'w', encoding='utf-8', newline='').write(n)
        print('  APPLIED size %d -> %d' % (len(t.encode('utf-8')), len(n.encode('utf-8'))))
