# -*- coding: utf-8 -*-
# D95 追加区 5 处「数学跨度用反引号收尾」修复：反引号 -> $，逐笔字节增量 0
import io, os, sys
sys.stdout.reconfigure(encoding='utf-8')

P = u'研究笔记/D95-用独立行替换高斯行的Cd代价.md'
raw = io.open(P, 'rb').read()
assert raw.count(b'\r') == 0, 'CR present'
text = raw.decode('utf-8')
b0 = len(raw)
lines = text.split(u'\n')
nlines = len(lines)
d0 = text.count(u'$')
t0 = text.count(u'`')

OPS = [
    (1798, r'$p_0=3/5`,', r'$p_0=3/5$,'),
    (1894, r'$\dfrac13=2/3-1/3` 同型', r'$\dfrac13=2/3-1/3$ 同型'),
    (1898, r'$m=\lfloor d/10\rfloor`(', r'$m=\lfloor d/10\rfloor$('),
    (1898, r'$\ell=\lfloor d/2\rfloor`(', r'$\ell=\lfloor d/2\rfloor$('),
    (1945, r'$\det(gg^{\mathsf T})^{-1/2}`(', r'$\det(gg^{\mathsf T})^{-1/2}$('),
]

total = 0
for idx, old, new in OPS:
    assert len(old) == len(new), (idx, 'len mismatch')
    l = lines[idx - 1]
    assert l.count(old) == 1, (idx, 'line hits', l.count(old))
    fc = text.count(old)
    assert fc == 1, (idx, 'file hits', fc)
    lines[idx - 1] = l.replace(old, new)
    text = text.replace(old, new)
    total += len(new.encode('utf-8')) - len(old.encode('utf-8'))
    print('site L%d ok  %r -> %r' % (idx, old, new))

data = text.encode('utf-8')
assert len(lines) == nlines, 'line count changed'
assert text.count(u'$') == d0 + len(OPS), (text.count(u'$'), d0)
assert text.count(u'`') == t0 - len(OPS), (text.count(u'`'), t0)
assert len(data) - b0 == total, (len(data) - b0, total)
assert data.count(b'\r') == 0

io.open('_work/D95.pre-btickfix.md', 'wb').write(raw)
io.open(P, 'wb').write(data)
print('bytes %d -> %d delta=%d expect=%d' % (b0, os.path.getsize(P), len(data) - b0, total))
print('dollar %d -> %d  btick %d -> %d' % (d0, text.count(u'$'), t0, text.count(u'`')))
odd = [(i + 1, l.count(u'$')) for i, l in enumerate(lines) if l.count(u'$') % 2]
print('file-wide odd-$ lines:', odd)
