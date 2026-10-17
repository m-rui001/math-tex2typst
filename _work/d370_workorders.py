# -*- coding: utf-8 -*-
import io, re

P = u'研究笔记/D370-素数次数环面包在任意局部型下的等分布.md'
raw = io.open(P, 'rb').read()
assert raw.count(b'\r') == 0
b0 = raw
L = b0.decode('utf8').split(u'\n')
dollars0 = sum(l.count(u'$') for l in L)
btick0 = sum(l.count(u'`') for l in L)
n0 = len(L)

DASH = re.compile(u'--`([0-9]+)\\$')

sites = [261, 332]
flips = []
for ln in sites:
    l = L[ln - 1]
    ms = list(DASH.finditer(l))
    assert len(ms) == 1, (ln, len(ms))
    new = DASH.sub(u'--`' + ms[0].group(1) + u'`', l)
    assert l.count(u'$') - new.count(u'$') == 1
    assert new.count(u'`') - l.count(u'`') == 1
    flips.append((ln, l.count(u'$'), new.count(u'$')))
    L[ln - 1] = new

NI = u'(Q\\NI)^{-1/n}'
FIX = u'(Q\\N I)^{-1/n}'
ni_rows = []
for ln in (85, 87):
    l = L[ln - 1]
    c = l.count(NI)
    assert c >= 1, ln
    L[ln - 1] = l.replace(NI, FIX)
    ni_rows.append((ln, c))
ni_total = sum(c for _, c in ni_rows)
left = [i + 1 for i, l in enumerate(L) if NI in l]

II = u'\\lvert X+\\ii Y\\rvert'
IIFIX = u'\\lvert X+iY\\rvert'
l141 = L[140]
assert l141.count(II) == 1, l141.count(II)
L[140] = l141.replace(II, IIFIX)
ii_left = [i + 1 for i, l in enumerate(L) if u'\\ii' in l]

out = u'\n'.join(L).encode('utf8')
assert len(L) == n0, (len(L), n0)
assert out.count(b'\r') == 0
dollars1 = sum(l.count(u'$') for l in L)
btick1 = sum(l.count(u'`') for l in L)
assert dollars1 == dollars0 - 2, (dollars0, dollars1)
assert btick1 == btick0 + 2, (btick0, btick1)
delta = ni_total + (len(IIFIX.encode('utf8')) - len(II.encode('utf8')))
assert len(out) == len(b0) + delta, (len(b0), len(out), delta)

io.open(P, 'wb').write(out)

print('flips', flips)
print('ni', ni_rows, 'ni_total', ni_total, 'NI remaining lines', left)
print('ii replaced, \\ii remaining lines', ii_left)
print('bytes %d -> %d' % (len(b0), len(out)))
print('lines %d -> %d' % (n0, len(L)))
print('dollar %d -> %d  btick %d -> %d' % (dollars0, dollars1, btick0, btick1))
