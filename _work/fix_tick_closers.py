# -*- coding: utf-8 -*-
"""Swap mistyped closers in the residual wrapped-inline-math spans.

Each op is (note prefix, old text, new text): a `$` run closed by a backtick
becomes a `$`-closed run, and D25's code span closed by a `$` becomes a
backtick.  Every op must match exactly once, byte length must not change, the
$/backtick counts must move by exactly the number of ops applied to that file,
and the file's wrap1 count must not grow.  Nothing is written unless all files
pass.  D371 and D398 declare this family themselves; D371 prescribes exactly
this edit ("把收尾反引号改成 $").

Usage: python fix_tick_closers.py [--apply]
"""
from __future__ import unicode_literals
import io, os, sys, glob, shutil
import join_wraps2 as J

ROOT = u'E:/math/' + u'\u7814\u7a76\u7b14\u8bb0'
B = chr(92)
D = chr(36)
T = chr(96)

OPS = [
    (u'D106', u'$' + B + u'kappa' + T + u' ', u'$' + B + u'kappa$ ', +1, -1),
    (u'D371', B + u'Nm I' + T + u'\n', B + u'Nm I$' + u'\n', +1, -1),
    (u'D398', u'$D' + T + u'\u3002', u'$D$\u3002', +1, -1),
    (u'D64', B + u'Delta>0' + T + u' ', B + u'Delta>0$ ', +1, -1),
    (u'D93', B + u'beta/64' + T + u' | $K$', B + u'beta/64$ | $K$', +1, -1),
    (u'D93', B + u'beta/64' + T + u' ', B + u'beta/64$ ', +1, -1),
    (u'D93', u'2K+4' + T + u',', u'2K+4$,', +1, -1),
    (u'D25', B + u'C)' + D + u'\uff1a', B + u'C)' + T + u'\uff1a', -1, +1),
]


def find(prefix):
    g = sorted(glob.glob(os.path.join(ROOT, prefix + u'-' + u'*' + u'.md')))
    if len(g) != 1:
        raise SystemExit('AMBIGUOUS %s n=%d' % (prefix, len(g)))
    return g[0]


orig = {}
texts = {}
want = {}
applied = []
for prefix, old, new, dd, dt in OPS:
    p = find(prefix)
    if p not in orig:
        orig[p] = io.open(p, encoding='utf-8').read()
        texts[p] = orig[p]
    if texts[p].count(old) != 1:
        print('MISS %s count=%d old=%r' % (prefix, texts[p].count(old), old))
        continue
    texts[p] = texts[p].replace(old, new, 1)
    w = want.setdefault(p, [0, 0, 0])
    w[0] += dd
    w[1] += dt
    w[2] += 1
    applied.append((p, prefix, old, new))

ok = True
for p in sorted(texts):
    t, o = texts[p], orig[p]
    pref = os.path.basename(p)[:9]
    dd, dt, c = want.get(p, [0, 0, 0])
    if t.count(D) - o.count(D) != dd or t.count(T) - o.count(T) != dt:
        print('PARITY %s dollar=%d tick=%d want=(%d,%d)'
              % (pref, t.count(D) - o.count(D), t.count(T) - o.count(T), dd, dt))
        ok = False
    if len(t.encode('utf-8')) != len(o.encode('utf-8')):
        print('BYTES %s' % pref)
        ok = False
    before = len(J.wrap1_spans(*J.fence_flags(o)))
    after = len(J.wrap1_spans(*J.fence_flags(t)))
    print('%s ops=%d wrap1 %d->%d' % (pref, c, before, after))
    if after > before:
        ok = False
if not ok:
    raise SystemExit('CHECKS FAILED - nothing written')

apply = '--apply' in sys.argv
if apply:
    with io.open(u'E:/math/_work/tick_fix_log.txt', 'a', encoding='utf-8') as g:
        for p, prefix, old, new in applied:
            g.write(u'%s\t%r\t%r\n' % (p, old, new))
    for p in sorted(texts):
        shutil.copyfile(p, os.path.join(u'E:/math/_work',
                                        os.path.basename(p)[:12] + u'.pre-tick.md'))
        io.open(p, 'w', encoding='utf-8', newline='').write(texts[p])
print('ops=%d files=%d %s' % (len(applied), len(texts), 'APPLIED' if apply else 'dry'))
